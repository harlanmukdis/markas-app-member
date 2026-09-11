import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'wallet_models.freezed.dart';
part 'wallet_models.g.dart';

/// Saldo dompet dari `GET /wallet`.
///
/// Responsnya hanya `{"balance": 661000}` — tidak ada mata uang, tidak ada
/// saldo tertahan, tidak ada limit. Jangan tampilkan kolom yang datanya tidak
/// dikirim server.
@freezed
abstract class WalletBalanceModel with _$WalletBalanceModel {
  const factory WalletBalanceModel({
    @IntJson() @Default(0) int balance,
  }) = _WalletBalanceModel;

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceModelFromJson(json);
}

/// Metode top-up yang diterima `POST /wallet/topup`.
///
/// `BANK_TRANSFER` **tidak ada di sini** dan itu bukan kelalaian: top-up tidak
/// menerimanya. Hanya `CARD` dan `EWALLET` yang ikut ditolak di UI karena
/// server tidak mengembalikan apa pun yang bisa dirender, sama seperti pada
/// pembayaran order.
enum TopupMethod {
  va('VA', 'Virtual Account'),
  qris('QRIS', 'QRIS'),
  ewallet('EWALLET', 'E-Wallet'),
  card('CARD', 'Kartu');

  const TopupMethod(this.wireValue, this.label);

  final String wireValue;
  final String label;

  /// Sama alasannya dengan `PaymentMethod.renderable`: `EWALLET` tidak
  /// mengembalikan deeplink dan `CARD` tidak mengembalikan token maupun
  /// redirect 3DS, jadi keduanya berujung layar kosong.
  static const List<TopupMethod> renderable = [va, qris];
}

/// Hasil `POST /wallet/topup`.
///
/// ⚠️ Endpoint ini mengembalikan **`created_at`**, bukan `created_date` —
/// pengecualian yang tidak tercatat di brief mana pun (brief menyebut hanya
/// `/chat/messages` dan `/payments/*`). Padahal `GET /wallet/history`, yang
/// satu modul dengannya, mengirim `created_date`. Dibaca lewat
/// [_readTopupCreated] supaya benar untuk kedua ejaan.
@freezed
abstract class WalletTopupModel with _$WalletTopupModel {
  const WalletTopupModel._();

  const factory WalletTopupModel({
    @IntJson() required int id,
    @StringOrNullJson() @JsonKey(name: 'topup_no') String? topupNo,
    @StringOrNullJson() String? method,
    @IntJson() @Default(0) int amount,
    @StringJson() @Default('') String status,
    @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
    @StringOrNullJson() @JsonKey(name: 'qris_payload') String? qrisPayload,

    /// Terkena bug jam 5 jam yang sama seperti `payment_deadline`: satu
    /// top-up nyata tercatat `created_at 17:54` dengan `expires_at 12:54`
    /// keesokan harinya — 19 jam, bukan 24. Tampilkan absolut.
    @ServerDateTimeJson() @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @ServerDateTimeJson() @JsonKey(name: 'verified_at') DateTime? verifiedAt,
    @ServerDateTimeJson()
    @JsonKey(name: 'created_at', readValue: _readTopupCreated)
    DateTime? createdDate,
  }) = _WalletTopupModel;

  factory WalletTopupModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTopupModelFromJson(json);

  TopupMethod? get methodEnum {
    for (final m in TopupMethod.values) {
      if (m.wireValue == method) return m;
    }
    return null;
  }

  bool get isPending => status == 'TERTUNDA';
  bool get isVerified => status == 'TERVERIFIKASI' || status == 'LUNAS';

  /// Ada instruksi yang bisa ditampilkan ke pembeli.
  bool get hasInstruction =>
      (vaNumber != null && vaNumber!.isNotEmpty) ||
      (qrisPayload != null && qrisPayload!.isNotEmpty);
}

/// Satu baris mutasi dari `GET /wallet/history`.
@freezed
abstract class WalletEntryModel with _$WalletEntryModel {
  const WalletEntryModel._();

  const factory WalletEntryModel({
    @IntJson() required int id,
    @StringJson() @JsonKey(name: 'entry_type') @Default('') String entryType,

    /// Sudah bertanda: pengeluaran datang negatif (`"-1339000.00"`). Jangan
    /// dibalik sendiri di UI — cukup tampilkan apa adanya.
    @DoubleJson() @Default(0) double amount,
    @StringOrNullJson() @JsonKey(name: 'ref_type') String? refType,
    @IntOrNullJson() @JsonKey(name: 'ref_id') int? refId,
    @StringOrNullJson() String? note,
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,
  }) = _WalletEntryModel;

  factory WalletEntryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletEntryModelFromJson(json);

  bool get isIncoming => amount >= 0;

  /// Label Indonesia untuk `entry_type`. Nilai yang belum dikenal tetap
  /// ditampilkan apa adanya, bukan diganti "Lainnya" — kalau backend menambah
  /// jenis mutasi baru, pembeli tetap melihat sesuatu yang bisa dicari.
  String get typeLabel => switch (entryType) {
        'TOPUP_MASUK' => 'Top-up',
        'PEMBAYARAN_KELUAR' => 'Pembayaran',
        'REFUND_MASUK' => 'Pengembalian dana',
        _ => entryType,
      };
}

Object? _readTopupCreated(Map<dynamic, dynamic> json, String key) =>
    json['created_at'] ?? json['created_date'];
