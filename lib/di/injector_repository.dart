import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/cart_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/catalog_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/reference_service.dart';
import 'package:navy_wear/core/data/repositories/auth_repository_impl.dart';
import 'package:navy_wear/core/data/repositories/cart_repository_impl.dart';
import 'package:navy_wear/core/data/repositories/catalog_repository_impl.dart';
import 'package:navy_wear/core/data/repositories/reference_repository_impl.dart';
import 'package:navy_wear/core/domain/repositories/auth_repository.dart';
import 'package:navy_wear/core/domain/repositories/cart_repository.dart';
import 'package:navy_wear/core/domain/repositories/catalog_repository.dart';
import 'package:navy_wear/core/domain/repositories/reference_repository.dart';
import 'package:navy_wear/core/services/token_store.dart';
import 'package:navy_wear/di/injector.dart';

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
  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      injector<AuthService>(),
      injector<TokenStore>(),
    ),
  );

  injector.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(injector<CatalogService>()),
  );

  injector.registerLazySingleton<ReferenceRepository>(
    () => ReferenceRepositoryImpl(injector<ReferenceService>()),
  );

  injector.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(injector<CartService>()),
  );
}
