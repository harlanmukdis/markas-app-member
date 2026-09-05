import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../config/env/env.dart';
import '../config/network/dio_client.dart';
import '../config/network/token_refresher.dart';
import '../core/services/auth_events.dart';
import '../core/services/token_store.dart';
import 'injector_repository.dart';
import 'injector_service.dart';

/// Service locator global. Dipakai cubit sebagai `injector<XRepository>()`.
final GetIt injector = GetIt.instance;

/// Menyiapkan seluruh dependency. **Wajib selesai sebelum `runApp`**, dan
/// **setelah `CachedHelper.init()`** — [TokenStore] membaca identitas user dari
/// SharedPreferences secara sinkron.
///
/// Urutan pendaftaran mengikuti arah ketergantungan, dan tidak boleh diacak:
///
/// 1. Infrastruktur tanpa dependency: [AuthEvents], [FlutterSecureStorage].
/// 2. [TokenStore] — di-`restore()` di sini supaya request pertama tidak perlu
///    menunggu pembacaan keychain.
/// 3. [TokenRefresher] — butuh [TokenStore].
/// 4. `Dio` bernama `"api"` — butuh ketiganya di atas.
/// 5. `initializeService()` — service butuh `Dio`.
/// 6. `initializeRepository()` — repository butuh service.
Future<void> initialize() async {
  injector.registerLazySingleton<AuthEvents>(() => AuthEvents());

  injector.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  final tokenStore = TokenStore(injector<FlutterSecureStorage>());
  await tokenStore.restore();
  injector.registerSingleton<TokenStore>(tokenStore);

  injector.registerLazySingleton<TokenRefresher>(
    () => TokenRefresher(
      tokens: injector<TokenStore>(),
      baseUrl: Env.apiBaseUrl,
    ),
  );

  injector.registerLazySingleton<Dio>(
    () => DioClient.create(
      baseUrl: Env.apiBaseUrl,
      tokens: injector<TokenStore>(),
      refresher: injector<TokenRefresher>(),
      authEvents: injector<AuthEvents>(),
    ),
    instanceName: DioClient.api,
  );

  initializeService();
  initializeRepository();
}
