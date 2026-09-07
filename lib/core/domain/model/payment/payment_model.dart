import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

/// Metode pembayaran yang diterima `POST /payments/initiate`.
enum PaymentMethod {
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

  /// Metode yang boleh dipilih user.
  ///
  /// Untuk order di atas ambang (`forced_bank_transfer`), server **memaksa**
  /// transfer bank walau app mengirim `VA` — jadi opsi lain harus
  /// disembunyikan, bukan dibiarkan lalu ditimpa diam-diam.
  static List<PaymentMethod> selectable({required bool forcedBankTransfer}) =>
      forcedBankTransfer ? const [bankTransfer] : values;
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
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,
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
