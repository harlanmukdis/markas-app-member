import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

/// Metode pembayaran yang diterima `POST /payments/initiate`.
enum PaymentMethod {
  saldo('SALDO', 'Saldo Markas'),
  va('VA', 'Virtual Account'),
  qris('QRIS', 'QRIS'),
  ewallet('EWALLET', 'E-Wallet'),
  card('CARD', 'Kartu'),
  bankTransfer('BANK_TRANSFER', 'Transfer Bank');

  const PaymentMethod(this.wireValue, this.label);

  final String wireValue;
  final String label;

  static PaymentMethod? fromWire(String? value) {
    for (final m in values) {
      if (m.wireValue == value) return m;
    }
    return null;
  }

  /// Metode yang **benar-benar bisa dirender** aplikasi.
  ///
  /// Tiga dari enam, dan bukan karena pilihan desain — tiga sisanya tidak
  /// mengembalikan apa pun yang bisa ditampilkan ke pembeli:
  ///
  /// * `EWALLET` — tanpa deeplink, QR, maupun referensi.
  /// * `CARD` — `card_token` dibuat server tapi tidak dikembalikan, dan tidak
  ///   ada URL redirect 3DS.
  /// * `BANK_TRANSFER` — hanya `expires_at`. **Tidak ada rekening tujuan di
  ///   mana pun**: tidak ada parameter, tabel, maupun konfigurasinya.
  ///
  /// Menampilkan ketiganya berarti menyodorkan tombol yang berujung layar
  /// kosong.
  /// `SALDO` ditaruh paling depan karena ia satu-satunya metode yang
  /// benar-benar tuntas hari ini: server menjawab `status: "LUNAS"` seketika,
  /// tanpa gateway dan tanpa `expires_at`. VA dan QRIS masih
  /// `MOCK_GATEWAY` — nomor dan payload-nya palsu, jadi pembeli tidak akan
  /// pernah bisa menyelesaikannya.
  static const List<PaymentMethod> renderable = [saldo, va, qris];

  /// Metode yang boleh dipilih user untuk satu order.
  ///
  /// Untuk order di atas ambang (`forced_bank_transfer`), server **memaksa**
  /// `BANK_TRANSFER` walau app mengirim `VA`. Metode itu tidak bisa
  /// disembunyikan pada kasus ini — jadi ia satu-satunya pilihan, dan UI
  /// wajib menampilkan instruksi bahwa detail rekening dikonfirmasi tim,
  /// bukan layar kosong.
  /// `SALDO` **dikecualikan** dari aturan transfer bank wajib, jadi ia tetap
  /// ditawarkan pada order besar. Menghilangkannya di sana justru memaksa
  /// pembeli ke satu-satunya jalur yang rekening tujuannya belum ada.
  static List<PaymentMethod> selectable({required bool forcedBankTransfer}) =>
      forcedBankTransfer ? const [saldo, bankTransfer] : renderable;

  /// Server tidak mengembalikan data yang cukup untuk merender metode ini.
  bool get isRenderable => renderable.contains(this);

  /// Butuh instruksi manual karena rekening tujuan belum tersedia di API.
  bool get needsManualInstruction => this == bankTransfer;

  /// Dibayar dari saldo Markas: lunas seketika, tidak ada yang perlu
  /// ditunggu, tidak ada batas waktu, dan **refund-nya kembali ke saldo**
  /// (bukan ke rekening) — itu yang wajib dijelaskan sebelum pembeli memilih.
  bool get isWalletPayment => this == saldo;
}

/// Pembayaran dari `POST /payments/initiate` dan
/// `GET /payments/detail?order_id=`.
@freezed
abstract class PaymentModel with _$PaymentModel {
  const PaymentModel._();

  const factory PaymentModel({
    @IntJson() required int id,
    @StringOrNullJson() @JsonKey(name: 'payment_no') String? paymentNo,
    @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
    @StringOrNullJson() String? method,
    @IntJson() @Default(0) int amount,
    @StringJson() @Default('') String status,

    /// **Mock penuh** di backend saat ini: `va_number` dan `qris_payload`
    /// adalah string palsu, bukan instrumen pembayaran sungguhan. Alur bisa
    /// dites end-to-end, tapi jangan tampilkan ke user asli.
    @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
    @StringOrNullJson() @JsonKey(name: 'qris_payload') String? qrisPayload,

    /// Batas bayar. Terkena bug jam 5 jam di backend v2.2 — tampilkan
    /// absolut, jangan hitung mundur presisi.
    @ServerDateTimeJson() @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @ServerDateTimeJson() @JsonKey(name: 'verified_at') DateTime? verifiedAt,
    /// Perhatikan: endpoint pembayaran **masih mengirim `created_at`**, bukan
    /// `created_date` seperti endpoint lain — backend meng-alias kolomnya di
    /// `C_Payments.php`. Inkonsistensi ini juga berlaku untuk
    /// `/chat/messages`. Dibaca lewat [_readPaymentCreated] supaya benar
    /// untuk kedua ejaan, dan tetap benar kalau nanti diseragamkan.
    @ServerDateTimeJson()
    @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
    DateTime? createdDate,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  PaymentMethod? get methodEnum => PaymentMethod.fromWire(method);

  bool get isPending => status == 'TERTUNDA';
  bool get isPaid => status == 'LUNAS';
  bool get isExpired => status == 'KEDALUWARSA';
  bool get isFailed => status == 'GAGAL';

  /// Menunggu verifikasi dua orang admin finance.
  bool get awaitingManualConfirmation =>
      status == 'MENUNGGU_KONFIRMASI_MANUAL';

  /// Perlu unggah bukti transfer dari pembeli.
  bool get needsTransferProof =>
      methodEnum == PaymentMethod.bankTransfer && isPending;

  bool get hasVirtualAccount => vaNumber != null && vaNumber!.isNotEmpty;
  bool get hasQris => qrisPayload != null && qrisPayload!.isNotEmpty;

  /// Masih perlu di-polling. Tidak ada webhook ke aplikasi, dan tidak ada
  /// endpoint notifikasi — status hanya bisa diketahui dengan menanya ulang.
  bool get shouldPoll => isPending || awaitingManualConfirmation;
}

/// Membaca waktu pembuatan pembayaran dari ejaan mana pun.
///
/// Endpoint `/payments/*` dan `/chat/messages` mengembalikan `created_at`
/// sementara seluruh endpoint lain memakai `created_date`. Membaca keduanya
/// membuat model ini tahan terhadap penyeragaman di sisi backend.
Object? _readPaymentCreated(Map<dynamic, dynamic> json, String key) =>
    json['created_at'] ?? json['created_date'];
