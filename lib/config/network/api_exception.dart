import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/data_state.dart';

/// Kegagalan yang sudah dinormalisasi, dilempar oleh lapisan `*Service`.
///
/// Sesuai Part 2 CLAUDE.md, `*Service` adalah lapisan yang menangkap
/// [DioException] mentah dan melemparkan exception dengan konteks; repository
/// lalu menangkap [ApiException] dan mengubahnya jadi [DataFailed]. Karena
/// [error] sudah bertipe [DataError], repository tidak perlu memetakan apa pun:
///
/// ```dart
/// try {
///   final env = await _service.fetchOrder(id);
///   return DataSuccess(env.data, meta: env.meta, statusCode: env.statusCode);
/// } on ApiException catch (e) {
///   return DataFailed(e.error);
/// }
/// ```
class ApiException implements Exception {
  const ApiException(this.error);

  final DataError error;

  /// Menerjemahkan [DioException] jadi [DataError].
  ///
  /// [context] menempel di pesan supaya log menyebut operasi mana yang gagal,
  /// mis. `'GET /orders/12'`.
  factory ApiException.fromDio(DioException e, {String? context}) {
    final status = e.response?.statusCode;
    final suffix = context == null ? '' : ' ($context)';

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(DataError(
          code: ClientErrorCode.timeout,
          message: 'Koneksi ke server habis waktu$suffix.',
          kind: DataErrorKind.timeout,
        ));

      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return ApiException(DataError(
          code: ClientErrorCode.network,
          message: 'Tidak bisa menjangkau server$suffix.',
          kind: DataErrorKind.network,
        ));

      case DioExceptionType.cancel:
        return ApiException(DataError(
          code: ClientErrorCode.cancelled,
          message: 'Permintaan dibatalkan$suffix.',
          kind: DataErrorKind.cancelled,
        ));

      case DioExceptionType.badResponse:
        return ApiException(_fromResponseBody(e.response, suffix));

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return ApiException(DataError(
            code: ClientErrorCode.network,
            message: 'Tidak ada koneksi internet$suffix.',
            kind: DataErrorKind.network,
          ));
        }
        return ApiException(DataError(
          code: ClientErrorCode.unknown,
          message: '${e.message ?? 'Terjadi kesalahan tidak terduga'}$suffix',
          statusCode: status,
          kind: DataErrorKind.unknown,
        ));
    }
  }

  /// Membaca blok `error` dari amplop respons.
  ///
  /// Body-nya belum tentu amplop yang rapi: kalau PHP fatal error, CodeIgniter
  /// bisa membalas HTML. Karena itu bentuk body diperiksa dulu, bukan langsung
  /// di-cast.
  static DataError _fromResponseBody(Response<dynamic>? response, String suffix) {
    final status = response?.statusCode;
    final body = response?.data;

    if (body is Map) {
      final err = body['error'];
      if (err is Map) {
        final details = err['details'];
        return DataError(
          code: (err['code'] ?? ApiErrorCode.conflict).toString(),
          message: (err['message'] ?? 'Permintaan ditolak server').toString(),
          details: details is Map ? Map<String, dynamic>.from(details) : null,
          statusCode: status,
          kind: DataErrorKind.api,
        );
      }
    }

    return DataError(
      code: ClientErrorCode.badResponse,
      message: 'Server membalas dengan format tidak dikenal '
          '(HTTP ${status ?? '?'})$suffix.',
      statusCode: status,
      kind: status != null && status >= 500
          ? DataErrorKind.server
          : DataErrorKind.unknown,
    );
  }

  @override
  String toString() => 'ApiException($error)';
}
