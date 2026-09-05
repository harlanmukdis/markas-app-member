import 'package:envied/envied.dart';

part 'env.g.dart';

/// Nilai dibaca dari `.env` saat build oleh `envied_generator`.
///
/// `.env` gitignored, jadi setiap developer/CI harus menyalin `.env.example`
/// lebih dulu — tanpa `.env`, `build_runner` gagal dengan pesan yang jelas.
///
/// Menambah base URL / API key baru: tambahkan satu `EnviedField` di sini plus
/// barisnya di `.env` dan `.env.example`, lalu regenerate.
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;
}
