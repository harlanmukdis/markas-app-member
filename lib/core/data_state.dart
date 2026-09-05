/// Hasil satu operasi repository.
///
/// Kontraknya (Part 2 CLAUDE.md): **repository tidak pernah throw**. Semua
/// kegagalan — jaringan, timeout, maupun `error` dari amplop API — dibungkus
/// jadi [DataFailed], sehingga cubit memakai pattern matching, bukan try/catch,
/// untuk alur kontrol.
///
/// [DataSuccess.meta] sengaja ada karena backend Markas menaruh **keputusan
/// bisnis** di `meta`, bukan hanya statistik: `meta.forced_bank_transfer`
/// menentukan metode bayar mana yang boleh dirender, `meta.note` menjelaskan
/// kenapa retur ditolak otomatis. Kalau repository hanya meneruskan `data`,
/// informasi itu hilang dan UI jadi salah.
sealed class DataState<T> {
  const DataState();

  /// Data kalau sukses, `null` untuk state lain. Untuk percabangan yang
  /// sesungguhnya pakai `switch` pada instance-nya, bukan getter ini.
  T? get valueOrNull => switch (this) {
        DataSuccess<T>(:final data) => data,
        _ => null,
      };

  bool get isSuccess => this is DataSuccess<T>;
}

/// Berhasil dan ada isinya.
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(this.data, {this.meta = const {}, this.statusCode});

  final T data;

  /// Blok `meta` dari amplop respons; `{}` kalau endpoint tidak mengirimnya.
  final Map<String, dynamic> meta;

  /// Status HTTP asli. Dibutuhkan karena beberapa endpoint memakai **200 vs
  /// 201** untuk membedakan "mengembalikan yang sudah ada" dari "membuat baru"
  /// — `POST /payments/initiate` dan `POST /chat/threads`.
  final int? statusCode;

  /// `true` kalau server mengembalikan resource yang sudah ada (200), bukan
  /// membuat yang baru (201). Dipakai supaya app tidak membuat pembayaran atau
  /// thread chat duplikat.
  bool get isExisting => statusCode == 200;
}

/// Berhasil tapi kosong — mis. `GET /finance/tax_invoices` yang mengembalikan
/// array kosong karena toko bukan PKP. Dipisah dari [DataSuccess] supaya UI
/// bisa membedakan "belum ada data" dari "gagal memuat".
class DataEmpty<T> extends DataState<T> {
  const DataEmpty({this.meta = const {}});

  final Map<String, dynamic> meta;
}

/// Gagal. [error] selalu ada, jadi UI tidak perlu memeriksa null.
class DataFailed<T> extends DataState<T> {
  const DataFailed(this.error);

  final DataError error;
}

/// Sedang berjalan.
class DataLoading<T> extends DataState<T> {
  const DataLoading();
}

/// Asal kegagalan. Membedakan masalah transport dari penolakan yang memang
/// disengaja backend — keduanya butuh pesan dan tombol aksi yang berbeda.
enum DataErrorKind {
  /// Tidak ada koneksi / host tidak terjangkau / sertifikat bermasalah.
  network,

  /// Connect, send, atau receive timeout.
  timeout,

  /// Server membalas dengan amplop `success: false`.
  api,

  /// 5xx atau body yang tidak bisa di-parse.
  server,

  /// Request dibatalkan (mis. user pindah halaman).
  cancelled,

  unknown,
}

/// Kegagalan yang sudah dinormalisasi, apa pun sumbernya.
class DataError {
  const DataError({
    required this.code,
    required this.message,
    this.details,
    this.statusCode,
    this.kind = DataErrorKind.unknown,
  });

  /// `error.code` dari backend (mis. `BELOW_MIN_ORDER`), atau salah satu
  /// [ClientErrorCode] kalau kegagalannya terjadi di sisi app.
  final String code;

  /// Pesan dari backend. Belum tentu layak ditampilkan apa adanya ke user —
  /// petakan [code] ke string terlokalisasi untuk pesan yang user lihat.
  final String message;

  /// `error.details`. Hanya muncul di sebagian error: validasi
  /// (`details.missing`), gate, dan jendela retur (`delivered_at`,
  /// `window_hours`).
  final Map<String, dynamic>? details;

  final int? statusCode;
  final DataErrorKind kind;

  /// Token tidak ada / kedaluwarsa / invalid. Interceptor sudah mencoba
  /// refresh sebelum error ini sampai ke repository, jadi kalau masih muncul
  /// artinya sesi benar-benar habis → paksa login ulang.
  bool get isUnauthenticated =>
      code == ApiErrorCode.unauthenticated || statusCode == 401;

  /// **URL-nya salah**, bukan datanya tidak ada.
  ///
  /// Backend memakai routing bawaan CodeIgniter 3, jadi beberapa path tidak
  /// lazim (`/returns/{id}/detail`, `/cart/view`). Keduanya membalas 404, tapi
  /// `"Endpoint not found"` berarti bug di sisi app dan **tidak boleh**
  /// ditampilkan sebagai "data tidak ditemukan".
  bool get isRouteNotFound =>
      statusCode == 404 && message.toLowerCase().contains('endpoint not found');

  /// 404 yang benar-benar berarti data tidak ada **atau bukan milik user**.
  /// Backend sengaja tidak membedakan keduanya, dan UI juga tidak boleh.
  bool get isDataNotFound => statusCode == 404 && !isRouteNotFound;

  /// Transisi status tidak sah. **Jangan pernah dianggap sukses**, dan jangan
  /// retry buta — muat ulang datanya dulu, karena status di server sudah
  /// berubah dari yang app kira.
  bool get isConflict => statusCode == 409;

  /// Aman diulang sekali. Kegagalan transport bisa diulang; `DB_ERROR`
  /// eksplisit disebut boleh retry sekali. Sisanya tidak.
  bool get isRetryable =>
      kind == DataErrorKind.network ||
      kind == DataErrorKind.timeout ||
      code == ApiErrorCode.dbError;

  /// Field wajib yang kosong, dari `details.missing` pada `VALIDATION_ERROR`.
  List<String> get missingFields {
    final raw = details?['missing'];
    if (raw is List) return raw.map((e) => e.toString()).toList();
    return const [];
  }

  @override
  String toString() =>
      'DataError($code${statusCode != null ? ' / HTTP $statusCode' : ''}: $message)';
}

/// `error.code` yang dikirim backend.
///
/// Dipakai sebagai konstanta, bukan enum, karena backend boleh menambah kode
/// baru kapan saja — kode yang tidak dikenal tetap lolos sebagai string biasa
/// dan tidak membuat parsing gagal.
abstract final class ApiErrorCode {
  static const malformedJson = 'MALFORMED_JSON';
  static const unauthenticated = 'UNAUTHENTICATED';
  static const invalidCredentials = 'INVALID_CREDENTIALS';
  static const invalidRefreshToken = 'INVALID_REFRESH_TOKEN';
  static const refreshRevoked = 'REFRESH_REVOKED';
  static const forbidden = 'FORBIDDEN';
  static const accountSuspended = 'ACCOUNT_SUSPENDED';
  static const notFound = 'NOT_FOUND';
  static const conflict = 'CONFLICT';
  static const invalidState = 'INVALID_STATE';
  static const invalidTransition = 'INVALID_TRANSITION';
  static const validationError = 'VALIDATION_ERROR';
  static const dbError = 'DB_ERROR';
}

/// Kode yang dibuat app sendiri, untuk kegagalan yang tidak pernah datang dari
/// backend. Diberi awalan supaya tidak mungkin bentrok dengan [ApiErrorCode].
abstract final class ClientErrorCode {
  static const network = 'CLIENT_NETWORK';
  static const timeout = 'CLIENT_TIMEOUT';
  static const cancelled = 'CLIENT_CANCELLED';
  static const badResponse = 'CLIENT_BAD_RESPONSE';
  static const unknown = 'CLIENT_UNKNOWN';
}
