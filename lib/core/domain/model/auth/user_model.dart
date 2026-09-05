import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Profil user dari `GET /auth/me`.
///
/// Catat perbedaan yang mudah menjebak: endpoint ini mengirim id sebagai
/// **`"id"` bertipe String** (`"3"`), sementara `POST /auth/login` mengirim
/// **`"user_id"` bertipe int** (`3`) untuk user yang sama. Keduanya ditangani
/// [IntJson].
@freezed
abstract class UserModel with _$UserModel {
  /// Wajib ada karena kelas ini punya getter kustom di bawah — tanpa
  /// konstruktor privat ini `freezed` menolak dengan
  /// "Getters require a MyClass._() constructor".
  const UserModel._();

  const factory UserModel({
    @IntJson() required int id,
    @StringJson() required String phone,
    @StringOrNullJson() String? email,
    @StringOrNullJson() @JsonKey(name: 'full_name') String? fullName,

    /// `BUY_R` (retail) atau `BUY_B` (B2B/kontraktor).
    @StringJson() required String role,

    /// `RETAIL` atau `B2B`. Server yang menentukan segmen harga saat checkout
    /// dari kolom ini — **tidak bisa dikirim dari client**.
    @StringOrNullJson() @JsonKey(name: 'buyer_segment') String? buyerSegment,

    @StringOrNullJson() String? npwp,
    @StringOrNullJson() @JsonKey(name: 'nib_siup_no') String? nibSiupNo,

    /// Terisi kalau berkas B2B sudah diverifikasi admin.
    @ServerDateTimeJson() @JsonKey(name: 'b2b_verified_at')
    DateTime? b2bVerifiedAt,

    @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,

    /// `ACTIVE` atau `SUSPENDED`.
    @StringJson() required String status,

    @ServerDateTimeJson() @JsonKey(name: 'created_at') DateTime? createdAt,
    @ServerDateTimeJson() @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Penentu apakah tier harga `PROJECT` dan modul RFQ/kontrak boleh dirender.
  ///
  /// Menampilkan tier `PROJECT` ke pembeli retail berarti membocorkan harga
  /// grosir (aturan PRD-06), dan endpoint RFQ membalas `403` untuk `BUY_R`
  /// bahkan untuk `GET` — jadi menunya harus disembunyikan, bukan dibiarkan
  /// lalu gagal.
  bool get isB2B => role == 'BUY_B' || buyerSegment == 'B2B';

  /// Akun ditangguhkan — butuh layar khusus, bukan pesan error biasa.
  bool get isSuspended => status == 'SUSPENDED';

  /// Berkas B2B sudah diserahkan tapi belum diverifikasi admin.
  bool get isPendingB2BVerification => isB2B && b2bVerifiedAt == null;

  String get displayName =>
      (fullName != null && fullName!.trim().isNotEmpty) ? fullName! : phone;
}
