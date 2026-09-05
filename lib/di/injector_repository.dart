/// Pendaftaran seluruh `*RepositoryImpl`.
///
/// Dijalankan **setelah** `initializeService()` karena setiap repository
/// menerima service sebagai dependency:
///
/// ```dart
/// injector.registerLazySingleton<AuthRepository>(
///   () => AuthRepositoryImpl(injector<AuthService>()),
/// );
/// ```
///
/// Kontrak yang tidak boleh dilanggar: **repository tidak pernah throw**.
/// Setiap method membungkus panggilan service dalam try/catch dan
/// mengembalikan `DataState<T>`:
///
/// ```dart
/// @override
/// Future<DataState<OrderModel>> fetchOrder(int id) async {
///   try {
///     final env = await _service.fetchOrder(id);
///     return DataSuccess(env.data, meta: env.meta, statusCode: env.statusCode);
///   } on ApiException catch (e) {
///     return DataFailed(e.error);
///   }
/// }
/// ```
///
/// Yang didaftarkan adalah **antarmuka** dari `core/domain/repositories/`,
/// dengan implementasi dari `core/data/repositories/` — supaya cubit
/// bergantung pada abstraksi dan bisa diganti fake saat test.
void initializeRepository() {
  // Belum ada repository. Diisi mulai Step 2, berpasangan dengan service-nya.
}
