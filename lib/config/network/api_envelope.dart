import 'package:dio/dio.dart';

import '../../core/data_state.dart';
import 'api_exception.dart';

/// Isi satu respons yang sudah dibuka dari amplopnya.
///
/// Setiap endpoint Markas membalas bentuk yang sama:
/// `{ "success": bool, "data": <apa pun>, "error": <obj|null>, "meta": <obj?> }`
class ApiEnvelope<T> {
  const ApiEnvelope({
    required this.data,
    this.meta = const {},
    this.statusCode,
  });

  final T data;

  /// Blok `meta`, `{}` kalau tidak dikirim. **Jangan dibuang** — di API ini
  /// `meta` membawa keputusan bisnis (`forced_bank_transfer`, `note`), bukan
  /// hanya `count`.
  final Map<String, dynamic> meta;

  /// Status HTTP asli, dibutuhkan karena beberapa endpoint memakai 200 vs 201
  /// untuk membedakan "yang sudah ada" dari "baru dibuat".
  final int? statusCode;
}

/// Membuka amplop dan mengubah `data` lewat [parse].
///
/// Melempar [ApiException] kalau body bukan amplop yang dikenali atau
/// `success` bukan `true`. Yang terakhir menangkap kasus langka `HTTP 200`
/// dengan `success: false` — Dio sendiri tidak menganggapnya error karena
/// statusnya 2xx.
ApiEnvelope<T> parseEnvelope<T>(
  Response<dynamic> response,
  T Function(dynamic raw) parse, {
  String? context,
}) {
  final body = response.data;
  final suffix = context == null ? '' : ' ($context)';

  if (body is! Map) {
    throw ApiException(DataError(
      code: ClientErrorCode.badResponse,
      message: 'Respons server bukan objek JSON$suffix.',
      statusCode: response.statusCode,
      kind: DataErrorKind.server,
    ));
  }

  if (body['success'] != true) {
    final err = body['error'];
    final details = err is Map ? err['details'] : null;
    throw ApiException(DataError(
      code: (err is Map ? err['code'] : null)?.toString() ??
          ClientErrorCode.badResponse,
      message: (err is Map ? err['message'] : null)?.toString() ??
          'Permintaan ditolak server$suffix.',
      details: details is Map ? Map<String, dynamic>.from(details) : null,
      statusCode: response.statusCode,
      kind: DataErrorKind.api,
    ));
  }

  final meta = body['meta'];

  return ApiEnvelope<T>(
    data: parse(body['data']),
    meta: meta is Map ? Map<String, dynamic>.from(meta) : const {},
    statusCode: response.statusCode,
  );
}

/// Varian [parseEnvelope] untuk `data` berbentuk array objek.
///
/// `data` yang `null` diperlakukan sebagai list kosong, bukan error — beberapa
/// endpoint memakai itu untuk "tidak ada hasil".
ApiEnvelope<List<T>> parseEnvelopeList<T>(
  Response<dynamic> response,
  T Function(Map<String, dynamic> json) fromJson, {
  String? context,
}) {
  return parseEnvelope<List<T>>(
    response,
    (raw) {
      if (raw == null) return <T>[];
      if (raw is! List) {
        throw ApiException(DataError(
          code: ClientErrorCode.badResponse,
          message: 'Field `data` diharapkan array tapi bukan'
              '${context == null ? '' : ' ($context)'}.',
          statusCode: response.statusCode,
          kind: DataErrorKind.server,
        ));
      }
      return raw
          .whereType<Map>()
          .map((e) => fromJson(Map<String, dynamic>.from(e)))
          .toList();
    },
    context: context,
  );
}
