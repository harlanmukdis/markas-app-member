import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Profil user dari `GET /auth/me`.
///
/// Endpoint ini punya penamaan yang **berbeda dari endpoint lain**, dan
/// namanya sudah berubah dua kali:
///
/// | konsep | `/auth/login` | `/auth/me` v2.1 | `/auth/me` v2.2 |
/// |---|---|---|---|
/// | id user | `user_id` (int) | `id` (String) | **`seq`** (String) |
/// | nama | — | `full_name` | **`name`** |
///
/// Backend v2.2 memakai `seq` dan `name`, sementara seluruh endpoint lain
/// (`/offers`, `/categories`, `/brands`, …) tetap `id`. Perubahan ini **tidak
/// disebutkan** di catatan rilis v2.2, yang hanya menyebut penggantian kolom
/// waktu — jadi [_readUserId] dan [_readUserName] membaca semua ejaan yang
/// pernah dipakai. Kalau backend mengubahnya lagi atau merevert, model ini
/// tidak ikut pecah.
@freezed
abstract class UserModel with _$UserModel {
  /// Wajib ada karena kelas ini punya getter kustom di bawah — tanpa
  /// konstruktor privat ini `freezed` menolak dengan
  /// "Getters require a MyClass._() constructor".
  const UserModel._();

  const factory UserModel({
    @IntJson() @JsonKey(name: 'seq', readValue: _readUserId) required int id,
    @StringJson() required String phone,
    @StringOrNullJson() String? email,
    @StringOrNullJson() @JsonKey(name: 'name', readValue: _readUserName)
    String? fullName,

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

    // Backend v2.2 mengganti nama kolom waktu: `created_at`/`updated_at`
    // HILANG TOTAL dari semua respons, diganti `created_date`/
    // `modified_date`. Nama Dart-nya ikut diselaraskan supaya tidak ada
    // celah antara nama field di kode dan di API.
    @ServerDateTimeJson() @JsonKey(name: 'created_date')
    DateTime? createdDate,
    @ServerDateTimeJson() @JsonKey(name: 'modified_date')
    DateTime? modifiedDate,
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

/// Membaca id user dari ejaan mana pun yang dipakai backend.
///
/// Urutannya sesuai yang paling baru lebih dulu, supaya nilai v2.2 menang
/// kalau backend suatu saat mengirim keduanya sekaligus.
Object? _readUserId(Map<dynamic, dynamic> json, String key) =>
    json['seq'] ?? json['id'] ?? json['user_id'];

/// Membaca nama user dari ejaan mana pun yang dipakai backend.
Object? _readUserName(Map<dynamic, dynamic> json, String key) =>
    json['name'] ?? json['full_name'];
