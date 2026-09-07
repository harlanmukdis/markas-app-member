import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

/// Sesi hasil `POST /auth/login` atau `POST /auth/register`.
///
/// **Kedua endpoint mengembalikan bentuk yang berbeda**, dan ini sudah
/// diverifikasi terhadap backend, bukan hanya dibaca dari dokumen:
///
/// | field | register | login |
/// |---|---|---|
/// | `user_id` | ada (**int**) | ada (**int**) |
/// | `access_token` | ada | ada |
/// | `expires_in` | 7200 | 7200 |
/// | `seller_id` | `null` | `null` |
/// | `role` | **tidak ada** | ada (`BUY_R`/`BUY_B`) |
/// | `refresh_token` | **tidak ada** | ada (30 hari) |
///
/// Dua field terakhir itulah alasan `AuthRepository.register()` harus
/// dilanjutkan dengan login otomatis — tanpa refresh token, sesi user mati
/// setelah 2 jam tanpa bisa dipulihkan.
@freezed
abstract class AuthSessionModel with _$AuthSessionModel {
  const factory AuthSessionModel({
    @IntJson() @JsonKey(name: 'user_id') required int userId,
    @StringJson() @JsonKey(name: 'access_token') required String accessToken,

    /// Hanya terisi dari `login`. `null` dari `register`.
    @StringOrNullJson() @JsonKey(name: 'refresh_token') String? refreshToken,

    /// `BUY_R` atau `BUY_B`. `null` dari `register` — backend tidak
    /// mengirimkannya di sana, jadi nilainya harus diambil dari apa yang
    /// dikirim client atau dari `GET /auth/me`.
    @StringOrNullJson() String? role,

    @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
    @StringOrNullJson() @JsonKey(name: 'token_type') String? tokenType,

    /// Selalu `null` untuk member; hanya berisi untuk akun toko.
    @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,

    /// `MEMBER` / `MERCHANT` / `ADMIN`. Ditambahkan backend v2.2.
    ///
    /// Berguna untuk memutuskan aplikasi/rute awal, tapi **bukan** penentu
    /// menu B2B — itu tetap [role] (`BUY_R` vs `BUY_B`), karena keduanya
    /// sama-sama `MEMBER`.
    @StringOrNullJson() @JsonKey(name: 'actor_type') String? actorType,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);
}
