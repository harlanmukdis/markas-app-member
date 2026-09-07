import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data_state.dart';

/// Pembungkus bersama yang menegakkan kontrak **repository tidak pernah
/// throw** (Part 2 CLAUDE.md).
///
/// Sebelumnya tiap `*RepositoryImpl` menyalin dua helper yang sama. Duplikasi
/// itu bukan hanya berisik: kalau satu salinan lupa menangkap
/// [ApiException], kontraknya bocor di satu tempat saja dan baru terasa
/// sebagai crash di layar tertentu.
mixin RepositoryGuard {
  /// Menjalankan panggilan service dan membungkus hasilnya jadi [DataState].
  Future<DataState<T>> guard<T>(
    Future<ApiEnvelope<T>> Function() call,
  ) async {
    try {
      final env = await call();
      return DataSuccess<T>(
        env.data,
        meta: env.meta,
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  /// Seperti [guard], tapi list kosong jadi [DataEmpty] supaya UI bisa
  /// membedakan "tidak ada data" dari "gagal memuat" tanpa memeriksa panjang
  /// list di setiap layar. `meta` tetap diteruskan.
  Future<DataState<List<T>>> guardList<T>(
    Future<ApiEnvelope<List<T>>> Function() call,
  ) async {
    try {
      final env = await call();
      return env.data.isEmpty
          ? DataEmpty<List<T>>(meta: env.meta)
          : DataSuccess<List<T>>(
              env.data,
              meta: env.meta,
              statusCode: env.statusCode,
            );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  /// Untuk operasi yang hasilnya tidak dipakai (hapus, konfirmasi, dsb).
  Future<DataState<void>> guardVoid(
    Future<ApiEnvelope<dynamic>> Function() call,
  ) async {
    try {
      await call();
      return const DataSuccess(null);
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }
}
