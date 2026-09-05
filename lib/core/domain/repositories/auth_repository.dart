import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/auth/auth_session_model.dart';
import 'package:navy_wear/core/domain/model/auth/user_model.dart';

/// Kontrak autentikasi yang dikonsumsi `AuthCubit`.
///
/// Tidak ada method yang melempar — semuanya mengembalikan [DataState].
abstract interface class AuthRepository {
  /// Mendaftar **lalu login otomatis**, dalam satu operasi.
  ///
  /// Digabung dengan sengaja. `POST /auth/register` tidak mengembalikan
  /// `refresh_token` maupun `role`, jadi kalau app berhenti di situ, sesi user
  /// mati setelah 2 jam tanpa bisa dipulihkan dan gating B2B tidak punya
  /// dasar. Menyatukannya di sini membuat urutan itu tidak mungkin terlupakan
  /// oleh pemanggil.
  ///
  /// Kalau pendaftaran berhasil tapi login otomatisnya gagal, hasilnya tetap
  /// [DataSuccess] — akunnya sungguh terbentuk, dan `meta['auto_login']` diisi
  /// `false` supaya UI bisa mengarahkan user ke layar login alih-alih
  /// menyatakan pendaftaran gagal.
  Future<DataState<AuthSessionModel>> register({
    required String phone,
    required String password,
    required String fullName,
    required String role,
    String? email,
    String? npwp,
    String? nibSiupNo,
  });

  /// Login dan simpan sesi. Salah satu dari [phone]/[email] wajib.
  Future<DataState<AuthSessionModel>> login({
    required String password,
    String? phone,
    String? email,
  });

  /// Profil user aktif. Juga menyimpan `buyer_segment` ke penyimpanan lokal.
  Future<DataState<UserModel>> me();

  /// Menghapus sesi lokal.
  ///
  /// Tidak ada endpoint logout di backend — refresh token tidak bisa dicabut
  /// dari sisi app, jadi logout murni membuang token yang tersimpan.
  Future<void> logout();

  /// Ada token tersimpan yang bisa dipakai memulihkan sesi.
  bool get hasSession;
}
