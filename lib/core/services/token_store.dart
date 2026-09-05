import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/constant.dart';
import '../utils/local_network.dart';

/// Satu-satunya pemilik sesi login.
///
/// Pembagian penyimpanan disengaja:
///
/// * **Token → `flutter_secure_storage`.** `refresh_token` berlaku 30 hari,
///   jadi kalau bocor akun bisa diambil alih selama sebulan. Di Android masuk
///   Keystore, di iOS masuk Keychain.
/// * **Identitas non-rahasia (`user_id`, `role`, `buyer_segment`) →
///   `CachedHelper`.** Secure storage bersifat async, sedangkan pola project
///   ini membaca preferensi **sinkron saat build** (lihat `isAppDarkMode()`).
///   Menaruh `buyer_segment` di secure storage berarti setiap widget yang
///   perlu tahu "user ini B2B atau retail" harus jadi async — itu menular ke
///   mana-mana. Ketiga nilai ini bukan rahasia, jadi prefs sudah memadai.
///
/// > **Catatan untuk target web.** Di Flutter web `flutter_secure_storage`
/// > menyimpan di `localStorage` dengan enkripsi WebCrypto, dan kuncinya ikut
/// > berada di browser. Jadi di web ini **bukan** penyimpanan rahasia yang
/// > setara Keychain/Keystore — script mana pun yang berhasil dieksekusi di
/// > origin itu bisa membacanya. Untuk build web produksi, sesi jangka panjang
/// > sebaiknya ditopang cookie `HttpOnly` dari backend, bukan token di storage
/// > browser. Aman untuk pengembangan; catat sebagai utang sebelum rilis web.
class TokenStore {
  TokenStore(this._secure);

  final FlutterSecureStorage _secure;

  String? _accessToken;
  String? _refreshToken;
  DateTime? _accessExpiresAt;

  /// Memuat token dari secure storage ke memori. **Wajib dipanggil sekali di
  /// `initialize()` sebelum `runApp`**, supaya request pertama tidak perlu
  /// menunggu pembacaan keychain.
  Future<void> restore() async {
    _accessToken = await _read(kAccessToken);
    _refreshToken = await _read(kRefreshToken);
    final rawExpiry = CachedHelper.getData(kAccessTokenExpiry);
    _accessExpiresAt =
        rawExpiry is String ? DateTime.tryParse(rawExpiry) : null;
  }

  /// Dibaca dari memori, jadi murah untuk dipanggil per request oleh
  /// interceptor.
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  /// Ada sesuatu yang bisa dipakai untuk memulihkan sesi.
  bool get hasSession => _refreshToken != null || _accessToken != null;

  /// `true` kalau access token sudah (hampir) kedaluwarsa.
  ///
  /// Diberi jeda 30 detik supaya request yang dikirim tepat di detik terakhir
  /// tidak dijamin gagal. Ini hanya optimasi — interceptor tetap menangani 401
  /// secara reaktif, karena jam perangkat bisa saja tidak akurat dan tidak
  /// boleh dijadikan satu-satunya penentu.
  bool get isAccessTokenExpired {
    final expiry = _accessExpiresAt;
    if (expiry == null) return false;
    return DateTime.now().toUtc().isAfter(
          expiry.toUtc().subtract(const Duration(seconds: 30)),
        );
  }

  // --- Identitas, dibaca sinkron saat build -------------------------------

  int? get userId {
    final raw = CachedHelper.getData(kUserId);
    if (raw is int) return raw;
    if (raw is String) return int.tryParse(raw);
    return null;
  }

  /// `BUY_R` atau `BUY_B`.
  String? get role => CachedHelper.getData(kUserRole) as String?;

  /// `RETAIL` atau `B2B`, dari `users.buyer_segment`.
  String? get buyerSegment => CachedHelper.getData(kBuyerSegment) as String?;

  /// Penentu **tunggal** apakah tier harga `PROJECT` dan seluruh modul
  /// RFQ/kontrak boleh dirender.
  ///
  /// Menampilkan tier `PROJECT` ke pembeli retail berarti membocorkan harga
  /// grosir (aturan PRD-06), dan endpoint RFQ membalas `403` untuk `BUY_R`
  /// bahkan untuk `GET` — jadi menu-nya harus disembunyikan, bukan dibiarkan
  /// lalu gagal.
  bool get isB2B => role == 'BUY_B' || buyerSegment == 'B2B';

  bool get isLoggedIn => _accessToken != null && userId != null;

  // --- Mutasi --------------------------------------------------------------

  /// Menyimpan sesi hasil `POST /auth/login`.
  ///
  /// [refreshToken] boleh null karena **`POST /auth/register` tidak
  /// mengembalikan refresh token** — hanya `login` yang memberikannya. Itu
  /// sebabnya alur pendaftaran harus dilanjutkan dengan login di belakang
  /// layar; kalau tidak, sesi user mati setelah 2 jam tanpa bisa dipulihkan.
  Future<void> saveSession({
    required String accessToken,
    String? refreshToken,
    int? expiresIn,
    int? userId,
    String? role,
    String? buyerSegment,
  }) async {
    _accessToken = accessToken;
    await _write(kAccessToken, accessToken);

    if (refreshToken != null) {
      _refreshToken = refreshToken;
      await _write(kRefreshToken, refreshToken);
    }

    await _setExpiry(expiresIn);

    if (userId != null) await CachedHelper.saveData(kUserId, userId);
    if (role != null) await CachedHelper.saveData(kUserRole, role);
    if (buyerSegment != null) {
      await CachedHelper.saveData(kBuyerSegment, buyerSegment);
    }
  }

  /// Menyimpan access token baru hasil `POST /auth/refresh`.
  ///
  /// Endpoint refresh **tidak** mengembalikan refresh token baru, jadi yang
  /// lama sengaja dibiarkan utuh sampai 30 hari habis.
  Future<void> saveAccessToken(String accessToken, {int? expiresIn}) async {
    _accessToken = accessToken;
    await _write(kAccessToken, accessToken);
    await _setExpiry(expiresIn);
  }

  /// Menghapus seluruh sesi. Dipanggil saat logout dan saat refresh ditolak
  /// (`INVALID_REFRESH_TOKEN` / `REFRESH_REVOKED`).
  Future<void> clear() async {
    _accessToken = null;
    _refreshToken = null;
    _accessExpiresAt = null;
    await _delete(kAccessToken);
    await _delete(kRefreshToken);
    await CachedHelper.removeData(kAccessTokenExpiry);
    await CachedHelper.removeData(kUserId);
    await CachedHelper.removeData(kUserRole);
    await CachedHelper.removeData(kBuyerSegment);
  }

  Future<void> _setExpiry(int? expiresIn) async {
    if (expiresIn == null) return;
    _accessExpiresAt =
        DateTime.now().toUtc().add(Duration(seconds: expiresIn));
    await CachedHelper.saveData(
      kAccessTokenExpiry,
      _accessExpiresAt!.toIso8601String(),
    );
  }

  /// Secure storage bisa melempar di platform tertentu (keychain terkunci,
  /// browser memblokir storage). Sesi yang tidak terbaca diperlakukan sebagai
  /// "belum login" — jauh lebih baik daripada app gagal start.
  Future<String?> _read(String key) async {
    try {
      return await _secure.read(key: key);
    } catch (_) {
      return null;
    }
  }

  Future<void> _write(String key, String value) async {
    try {
      await _secure.write(key: key, value: value);
    } catch (_) {
      // Token tetap hidup di memori untuk sesi ini; user perlu login ulang
      // setelah app ditutup. Lebih baik daripada memblokir login.
    }
  }

  Future<void> _delete(String key) async {
    try {
      await _secure.delete(key: key);
    } catch (_) {}
  }
}
