# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> **This document has two parts, and they do not describe the same thing.**
> **Part 1 — Current state** is what the code actually is today; verified against the repo.
> **Part 2 — Target architecture** is where the project is headed. None of it exists in this repo yet.
> Never run a command or follow a pattern from Part 2 until the corresponding migration step is done. If the two parts conflict, Part 1 wins for any change you make right now.

## Project identity

Flutter e-commerce **UI kit** (a purchased template being rebranded). Three names are in play and all are load-bearing:

- Directory: `markas-app`
- Dart package name (`pubspec.yaml`): **`navy_wear`** — absolute imports are `package:navy_wear/...`. Renaming this breaks every absolute import plus `test/widget_test.dart`.
- Product name / bundle id: **Shopapay** / `com.Shopapay.Shopapay` (Android `namespace` + `applicationId`, iOS `PRODUCT_BUNDLE_IDENTIFIER`), and `MaterialApp.title`.

---

# Part 1 — Current state

## Commands

```bash
flutter pub get                       # install dependencies
flutter run                           # run on connected device/emulator
flutter analyze                       # static analysis (flutter_lints 4.0.0 via analysis_options.yaml)
flutter test                          # run all tests
flutter test test/widget_test.dart    # run a single test file
flutter test test/widget_test.dart --plain-name 'Counter increments smoke test'   # single test case
flutter build apk --release           # Android
flutter build ios --release           # iOS
```

Regenerate localizations after editing `lib/l10n/*.arb`:

```bash
dart run intl_utils:generate          # requires: dart pub global activate intl_utils (not a declared dev_dependency)
```

`build_runner` **is now installed and required** for `lib/config/env/env.g.dart`:

```bash
dart run build_runner build          # after editing .env or any freezed/json model
dart run build_runner watch          # while iterating
```

Note: `build_runner` 2.15 **removed `--delete-conflicting-outputs`** — passing it prints a warning and is ignored. Drop the flag.

## Architecture

There is **no backend**. `dio` and `get_it` are declared in `pubspec.yaml` but never imported; all product/review/cart data is hardcoded as fields inside cubits (e.g. `HomePageCubit.productsTShirt`). Models like `ProductModel` already carry `fromJson` factories, so wiring a real API means replacing the cubit's literal lists, not restructuring.

### Feature-first layout

```
lib/core/       # cross-cutting: routes, theme, styles, constants, cached prefs, shared widgets
lib/features/<feature>/data/models/
lib/features/<feature>/presentation/{cubits,views,views/widgets}
lib/generated/  # Flutter Intl output — DO NOT EDIT
lib/l10n/       # .arb translation sources
```

The convention is applied loosely: `favorites`, `trending`, and `spalsh` are single files with no `presentation/` layer. Directory names contain typos that are part of the real paths — `spalsh` (splash), `presentaion` (profile only), and `notifications&messages` (literal `&`). Match the existing spelling rather than "fixing" it, or every import breaks.

### State: Cubits with mutable fields, not immutable state

`flutter_bloc` cubits are created **locally** — each view wraps its own body in `BlocProvider(create: ...)` inside `build()`. There is no global provider and no DI container.

Cubits hold **public mutable fields** (`currentIndex`, `products`, controllers) and emit **marker states** that carry no data (`class HomeChangeBottomNav extends HomeLayoutState {}`). `BlocBuilder` reacts to the emit, then reads the field off the cubit. Follow this pattern; do not convert to data-carrying states piecemeal. (Part 2 replaces this with freezed sealed unions — a deliberate, project-wide migration, not a per-file change.)

Every cubit exposes `static XCubit get(context) => BlocProvider.of(context);` — used as `HomePageCubit.get(context)`.

`MyBlocObserver` (`lib/core/utils/bloc_observer.dart`) logs all cubit lifecycle in debug.

`lib/core/cubits/app_cubit.dart` (`AppCubit`) is **dead code** — never provided or referenced. The live theme toggle is the top-level function in `components.dart` (below).

### Navigation: go_router, one flat table

All routes live in one file, [app_routes.dart](lib/core/utils/app_routes.dart): an `AppRoutes` class of path string constants plus a single flat `GoRouter` route list. Every route uses `FadeThroughTransitionPageWrapper` for a consistent transition. Arguments are passed untyped via `state.extra` and cast (`state.extra! as String`).

The `router` object is global and often called directly (`router.go(AppRoutes.onboarding)` in the splash screen) rather than through `context.go`. Adding a screen = add a constant to `AppRoutes` + a `GoRoute` entry with the wrapper.

Note: `AppRoutes.contactUs` is registered twice; the first entry wins.

### Theming: preferences-driven, not `Theme.of(context)`

This is the most important convention to get right. `lightTheme`/`darkTheme` exist in [app_theme.dart](lib/core/utils/app_theme.dart), but **widgets almost never read `Theme.of(context)`**. Instead every color decision is written inline as:

```dart
color: isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
```

`isAppDarkMode()` reads SharedPreferences **synchronously** via `CachedHelper.getData(kAppTheme)`. Colors are `k`-prefixed constants in [constant.dart](lib/core/utils/constant.dart). New UI should use these constants + `isAppDarkMode()`, not theme lookups.

**Theme and language changes restart the app.** `toggleAppTheme()` / `changeAppLanguage()` in [components.dart](lib/core/function/components.dart) persist the value then call `Phoenix.rebirth(context)`. This is why `CachedHelper.init()` must complete before `runApp` in [main.dart](lib/main.dart) — the whole app reads prefs synchronously at build time.

### Text and spacing helpers

- **Text**: `AppStyles.styleSemiBold16(context)` etc. in [app_styles.dart](lib/core/utils/app_styles.dart). Every style takes `context` because font size is scaled by `getResponsiveFontSize()` against a 375pt base width, clamped to ±20%. Never hardcode a `TextStyle` with a raw `fontSize`.
- **Spacing**: extensions in [extensions.dart](lib/core/utils/extensions.dart) — `16.pa`, `16.ps`/`.pe` (start/end), `.pt`/`.pb`, `.psh`/`.psv` all return **`EdgeInsetsDirectional`** (RTL-aware — important, Arabic is supported). Gaps use `12.sbh` / `12.sbw` for `SizedBox`. Screen size via `context.screenWidth` / `context.screenHeight`.
- **Assets**: referenced through `AppImages` constants; `assets/images/` and `assets/icon/` are glob-registered in `pubspec.yaml`, so new files need only an `AppImages` entry.
- **App bar**: `customAppBar(context, title, action: ...)` in [custom_app_bar.dart](lib/core/function/custom_app_bar.dart).

### Localization

Generated by the **Flutter Intl IDE plugin** (Localizely), not `flutter gen-l10n`. `lib/generated/l10n.dart` and `lib/generated/intl/*` are generated — edit `lib/l10n/*.arb` and regenerate. Usage in views: `final l = S.of(context); ... l.home`.

Adding a language: add `lib/l10n/intl_<code>.arb`, regenerate, then add a `LanguageModel` to `supportedLanguages` in [language_model.dart](lib/features/shared/models/language_model.dart) (this list drives the settings picker and RTL direction, and is separate from `S.delegate.supportedLocales`).

Current state: `en` and `ar` are complete (284 keys) and selectable. `fr` appears in `S.delegate.supportedLocales` but `intl_fr.arb` is **empty** and `fr` is not in `supportedLanguages` — so device-locale French resolves to a locale with no translations. Either fill it in or drop it.

## Known rough edges

- `test/widget_test.dart` is still the unmodified Flutter counter template and **fails** — it pumps `MyApp` and looks for a `+` icon. Replace it before treating `flutter test` as a signal.
- Stale `*.dart~` backup files litter `lib/` (and `android/`). They are not compiled but **do show up in grep results** — always confirm a hit isn't in a `~` file before editing.
- `lib/features/my_cart/presentation/views/map_screen.dart` is 100% commented out, and the `com.google.android.geo.API_KEY` meta-data in `android/app/src/main/AndroidManifest.xml` is commented out too. Restoring the map needs both, plus an iOS key. Location permissions are already declared in the manifest.
- **The app cannot be built at all until assets are restored.** `flutter build web` fails on three missing entries declared in `pubspec.yaml`: the directories `assets/images/` and `assets/icon/`, and the file `assets/fonts/Hanimation_Arabic_Regular.otf`. Dart compilation itself succeeds — this is purely asset bundling. The UI kit's asset folders were never copied into this repo.
- Android `usesCleartextTraffic` / iOS ATS are **not** configured, so the `http://` base URL will fail on mobile. Not needed for the current web target; required before the first Android/iOS run.
- `DevicePreview` wraps the app when `kDebugMode`, so debug builds render inside a simulated device frame — layout that looks wrong in debug may be the preview frame, not the code.
- Orientation is locked to portrait in `main()`.
- `flutter_launcher_icons` and `flutter_native_splash` config blocks in `pubspec.yaml` are commented out, though `flutter_launcher_icons.yaml` / `flutter_native_splash.yaml` exist at the root.

---

# Part 2 — Target architecture

> ### 🔴 Backend v2.2 renamed fields the release notes did not mention
>
> The v2.2 refactor notes list only `created_at` → `created_date` and `updated_at` → `modified_date`. Verified against the running backend, **`GET /auth/me` also renamed two more fields** — and only that endpoint:
>
> | concept | `/auth/login` | `/auth/me` v2.1 | `/auth/me` v2.2 |
> |---|---|---|---|
> | user id | `user_id` (int) | `id` (String) | **`seq`** (String) |
> | name | — | `full_name` | **`name`** |
>
> Every other endpoint (`/offers`, `/categories`, `/brands`, `/orders`, `/addresses`, `/wishlist`) still uses `id`. `UserModel` therefore reads all spellings via `@JsonKey(readValue:)` rather than trusting one; the integration test pins it so a third rename fails loudly instead of silently producing `id: 0`.
>
> **Lesson that keeps repeating on this project: probe the endpoint, don't trust the release note.** Three assumptions from BE docs have now been wrong — `/offers?category_id=` existed when I assumed it did not, `price_tiers` is empty in every list response when the doc implied otherwise, and `/offers` with no filter returns everything when both the doc and I said there was no "all products" endpoint.
>
> ### 🔴 Server deadlines are 5 hours off (v2.2, still open)
>
> PHP and MySQL clocks disagree by 5 hours, so a 24-hour payment window is stored as 19 hours after `created_date`. **Do not correct this with an offset in Flutter** — when the backend is fixed the correction makes it wrong twice. Until then show absolute times via `formatServerDeadline()` and do not build countdowns that look precise. `formatCountdown()` carries the same warning at its definition.

> ### 🔴 Backend blocker: the `Authorization` header is case-sensitive
>
> Every protected endpoint returns `401 UNAUTHENTICATED` unless the header name is spelled **exactly** `Authorization`. This violates RFC 7230 §3.2 (HTTP field names are case-insensitive) and it breaks **all native Dart/Flutter clients**, because `dart:io`'s `HttpHeaders` lowercases field names and Dio does not opt out.
>
> Verified against the running backend:
>
> | request | result |
> |---|---|
> | `curl -H "Authorization: Bearer …"` | **200** |
> | `curl -H "authorization: Bearer …"` | **401** |
> | `curl -H "AUTHORIZATION: Bearer …"` | **401** |
> | `HttpHeaders.set(..., preserveHeaderCase: true)` | **200** |
> | `HttpHeaders.set(...)` (Dart default, what Dio sends) | **401** |
>
> **Fix belongs in the backend** — read the header case-insensitively (`$_SERVER['HTTP_AUTHORIZATION']` is populated regardless of the incoming case; an exact-key lookup into `apache_request_headers()` is not). A client-side workaround exists but needs a custom `HttpClientAdapter` (~80 lines, platform-conditional) versus a one-line backend change, so it was deliberately not built.
>
> **Impact by platform — verified in a real browser:** Flutter **web is unaffected**. Dio's browser adapter sends the field name as written, so the capital `Authorization` set by `AuthInterceptor` arrives intact. Proven by running the real stack in Chrome:
>
> ```bash
> flutter test --platform chrome test/integration/   # 6/6 pass, incl. GET /auth/me
> flutter test test/integration/                     # GET /auth/me skipped on native
> ```
>
> A standalone browser probe confirmed the same at the transport level: XHR and `fetch` both return **200** with `Authorization` and **401** with `authorization`.
>
> **Android/iOS/desktop remain unusable for anything past login.** The `GET /auth/me` contract test carries a `skip: kIsWeb ? false : '…'` so it runs on web and is skipped on native; drop the condition once the backend is fixed.

**Status: foundation (steps 1-5) plus the auth domain implemented.** What exists today:

- `lib/config/env/env.dart` + `.env` + `.env.example` (envied; `API_BASE_URL`)
- `lib/config/network/` — `dio_client.dart` (named `"api"` Dio), `api_envelope.dart`, `api_exception.dart`, `token_refresher.dart`, `interceptors/{auth,logging}_interceptor.dart`
- `lib/core/data_state.dart` — `DataState<T>` union
- `lib/core/services/` — `token_store.dart`, `auth_events.dart`
- `lib/util/` — `format_helper.dart`, `json_converters.dart`
- `lib/di/` — `injector.dart` (called from `main.dart` before `runApp`), `injector_service.dart`, `injector_repository.dart` (both still empty)
- **Auth domain (step 2)** — `AuthSessionModel` + `UserModel` (freezed), `AuthService`, `AuthRepository`/`AuthRepositoryImpl`, `AuthCubit`/`AuthState`, and the API-wired `LoginScreen`/`RegisterScreen` under `lib/ui/main/auth/`
- `lib/util/error_message.dart` — maps `DataError.code` to localized copy; **never** shows `error.message` to users
- Tests: `test/util/` (17, pure), `test/data/` (6, fake service+store), `test/ui/` (8, fake repository), `test/integration/` (11, needs the backend running)

Still absent: the rest of `lib/features/` (catalog, cart, checkout, orders, …), Firebase, `lib/firebase_options.dart`.

### Presentation lives in two trees right now

`lib/ui/main/auth/` (Part 2) and `lib/features/` (the UI kit's sample tree) coexist deliberately. A screen moves to `lib/ui/` **when it gets wired to the API**, not before — so `login`/`register` moved and were rewritten, while `welcome_view` and `reset_password_view` stayed in `lib/features/auth/presentation/views/`. `reset_password` cannot move yet: **the API has no password-reset endpoint at all**, so that screen has nothing to call.

The kit's social-login buttons were dropped, not ported — the backend has no OAuth, and a button that does nothing is worse than no button.

### freezed 3 gotcha

A `@freezed` class with custom getters or methods **must** declare a private constructor (`const UserModel._();`), otherwise generation fails with `Getters require a MyClass._() constructor`. Also prefer getters **inside** the class over an `extension`: an extension is only in scope where its own library is imported, so `user.isB2B` silently fails to resolve in a file that imported the model only transitively.

**Backend contract**: the member app talks to Markas Bangunan (CodeIgniter 3 + JWT). The API is documented in `API-MEMBER-APP.md` — ask the user for it if it is not in the repo root. Three deviations from the generic plan below were forced by that API and are deliberate:

1. **`DataSuccess` carries `meta` and `statusCode`.** The API puts business decisions in `meta` (`forced_bank_transfer` decides which payment methods may render; `note` explains an auto-rejected return), and uses **200 vs 201** to distinguish "returned the existing record" from "created a new one" (`POST /payments/initiate`, `POST /chat/threads`). A repository that forwards only `data` loses both.
2. **Every numeric and boolean model field must use a converter from `lib/util/json_converters.dart`.** The same logical field arrives as a number from one endpoint and a string from another (`"grand_total": 6500000` from `POST /checkout`, `"grand_total": "6500000"` from `GET /orders/{id}`), and `tinyint` booleans arrive as `"0"`/`"1"`.
3. **Two endpoints must never get a service method** — `GET /shipments` (no id; unfiltered, leaks every buyer's shipments platform-wide) and `POST /vouchers/apply` (no auth check, trusts client-supplied `discount_amount`). See `lib/di/injector_service.dart` for the note that keeps this decision discoverable.

This is the layering the project is being moved toward: **data → domain → presentation** per feature, wired with `get_it` for DI and `go_router` for navigation.

## Additional commands (only after the deps below are added)

Models use `freezed` + `json_serializable`; env vars use `envied`. Changes to `*_model.dart`, `*_state.dart`, `*_cubit.dart` (freezed part files), or `.env` require regenerating the related `*.freezed.dart` / `*.g.dart`:

```bash
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs   # while iterating
```

`lib/config/env/env.dart` reads `.env` (the gitignored key names are listed in `.gitignore`) and produces `env.g.dart` via `envied`. It starts with a single `API_BASE_URL` placeholder — add one `EnviedField` per new base URL / API key as feature domains are added.

## Target layout

```
lib/
  config/         # env, network (Dio), routing, theming
  core/
    data/
      datasources/remote/service/   # Dio-based *Service classes, one per API
      repositories/                 # *RepositoryImpl — calls Service, wraps result in DataState<T>
    domain/
      model/        # freezed/json_serializable models, grouped per API
      repositories/ # abstract repository interfaces consumed by cubits
    data_state.dart # DataState<T> result wrapper: DataLoading/DataSuccess/DataEmpty/DataFailed(DataError)
  di/               # get_it registration, split into injector (Dio client) / injector_service / injector_repository
  ui/
    main/           # shared shell: splash, login, register, home, profile + their cubits
    <feature>/<subfeature>/{cubit,screens,widgets}/   # new feature domains use this layout
  util/             # format_helper, list_slice_extension
```

## Conventions to preserve once migrated

**DI wiring order matters.** `lib/di/injector.dart` registers one **named** `Dio` singleton (`"api"` — see `DioClient` in `lib/config/network/dio_client.dart`), then calls `initializeService()` (services take the named Dio instance), then `initializeRepository()` (repositories take the services). New services/repositories must be registered in `injector_service.dart` / `injector_repository.dart` **in that same dependency order**, and `initialize()` must run before `runApp` in `main.dart`. When adding a feature domain that calls its own API, register another named `Dio` singleton here (see the example comments in `dio_client.dart` / `injector.dart`).

**Repositories never throw.** Every repository method wraps its service call in try/catch and returns `DataState<T>` (`DataSuccess` / `DataFailed(DataError(...))`), so cubits pattern-match on state instead of using try/catch for control flow. Follow this for every new repository method.

**Services own caching and raw HTTP errors.** `*Service` classes are the layer that catches `DioException` and rethrows a plain `Exception` with context. For expensive per-ID lookups, keep an in-memory `Map<int, Model>` cache (see the `PokemonService` pattern in the origin GameHub project) and chunk calls into `Future.wait` batches rather than firing unbounded concurrent requests.

**Cubits use freezed sealed state.** Each feature's `*_state.dart` is an `@freezed` union (initial/loading/loaded/error or similar), declared via `part 'x_state.dart'; part 'x_cubit.freezed.dart';` in the cubit file. Cubits pull their repository directly with `injector<XRepository>()` — **not** constructor injection — and are provided to widgets via `BlocProvider`/`BlocBuilder` from `flutter_bloc`.

**Routes split per domain, combined into one `GoRouter`.** `lib/config/route/app_route.dart` holds the shared shell routes; spread a new `appRouterMyFeature` from its own `app_route_myfeature.dart`, following the marked example pattern. Add new feature routes to that domain file, **not** directly into `app_route.dart`.

## Migration checklist (current → target)

Derived from the gap between Part 1 and Part 2; no step is started yet.

0. ~~Unblock `flutter pub get`: `intl` was constrained to `^0.19.0` while `flutter_localizations` on Flutter 3.41 requires `0.20.2`, so the project could not resolve at all.~~ **Done** — bumped to `^0.20.2`.
1. ~~Add `freezed_annotation`, `json_annotation`, `envied` to dependencies and `build_runner`, `freezed`, `json_serializable`, `envied_generator` to dev_dependencies.~~ **Done** (also `flutter_secure_storage` for tokens).
2. ~~Create `lib/config/env/env.dart` + `.env` with `API_BASE_URL`; add `.env` to `.gitignore`.~~ **Done.** `.env.example` lists the base URL per target; current target is **Flutter web on Chrome** (`http://localhost/markas/api/v1`).
3. ~~Create `lib/config/network/dio_client.dart` with the named `"api"` Dio singleton.~~ **Done**, plus auth/refresh/logging interceptors.
4. ~~Add `lib/core/data_state.dart` with the `DataState<T>` union.~~ **Done** — see deviation 1 above.
5. ~~Build `lib/di/{injector,injector_service,injector_repository}.dart` and call `initialize()` before `runApp`.~~ **Done**; service/repository registries are still empty stubs.
6. **In progress.** Move the hardcoded lists out of cubits (`HomePageCubit.productsTShirt` and friends) behind a `*Service` + `*RepositoryImpl` pair. `ProductModel.fromJson` already exists as a starting point.
7. **In progress** (auth done). Convert marker states to `@freezed` unions, one feature at a time, and switch cubits from public mutable fields to emitted state data.
8. Split [app_routes.dart](lib/core/utils/app_routes.dart) into per-domain route files under `lib/config/route/`.
9. Decide the fate of `lib/features/` vs `lib/ui/` — the target names the presentation root `ui/`, which is a rename of the existing tree, not a second one.

## Follow-ups when starting a new project from this base

- **Firebase**: this repo has no Firebase at all today. If it is adopted (or if this project is duplicated from one that has it), run `flutterfire configure` rather than inheriting another project's `firebase.json`, `lib/firebase_options.dart`, and platform config files — a copied config points at the origin project.
- **App identifier**: Android `applicationId` / iOS bundle identifier are still `com.Shopapay.Shopapay` from the purchased UI kit, and `name:` in `pubspec.yaml` is still `navy_wear`. Update both before shipping this as a separate app — especially if the origin app and this one may be installed on the same device.
