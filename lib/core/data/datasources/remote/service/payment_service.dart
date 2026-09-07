import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/payment/payment_model.dart';

/// Pembayaran.
///
/// > Payment gateway masih **mock penuh**: `va_number` dan `qris_payload`
/// > adalah string palsu. Alur bisa dites ujung ke ujung, tapi jangan
/// > menampilkan VA palsu ke user asli.
///
/// `POST /payments/verify_mock` **tidak dibuatkan method di sini** — itu
/// simulator webhook untuk pengujian backend, dan tidak boleh ada jalannya
/// dari aplikasi produksi.
class PaymentService {
  PaymentService(this._dio);

  final Dio _dio;

  /// `POST /payments/initiate`.
  ///
  /// Dua perilaku yang wajib diantisipasi:
  ///
  /// * Kalau sudah ada pembayaran pending untuk order itu, server
  ///   mengembalikan **yang lama dengan HTTP 200** (bukan 201). Periksa
  ///   `ApiEnvelope.statusCode` supaya app tidak membuat tagihan ganda.
  /// * Untuk order di atas ambang, `method` **dipaksa** jadi `BANK_TRANSFER`
  ///   walau app mengirim `VA`. Cek `meta['forced_bank_transfer']`.
  Future<ApiEnvelope<PaymentModel>> initiate({
    required int orderId,
    required PaymentMethod method,
  }) async {
    const context = 'POST /payments/initiate';
    try {
      final response = await _dio.post<dynamic>(
        '/payments/initiate',
        data: {'order_id': orderId, 'method': method.wireValue},
      );
      return parseEnvelope(
        response,
        (raw) => PaymentModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /payments/detail?order_id=` — perhatikan path-nya: **bukan**
  /// `/payments/{id}` (routing CodeIgniter).
  ///
  /// Ini yang dipakai untuk polling status, karena tidak ada webhook ke
  /// aplikasi dan belum ada endpoint notifikasi.
  Future<ApiEnvelope<PaymentModel>> detail({
    int? orderId,
    int? paymentId,
  }) async {
    assert(orderId != null || paymentId != null,
        'butuh order_id atau payment_id');
    const context = 'GET /payments/detail';
    try {
      final response = await _dio.get<dynamic>(
        '/payments/detail',
        queryParameters: {
          if (orderId != null) 'order_id': orderId,
          if (paymentId != null) 'payment_id': paymentId,
        },
      );
      return parseEnvelope(
        response,
        (raw) => PaymentModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /payments/manual_transfer_proof`.
  ///
  /// [proofFileUrl] harus **URL**: backend tidak punya endpoint unggah berkas
  /// sama sekali, jadi aplikasi wajib punya storage sendiri (S3/GCS) dan
  /// mengirim URL hasil unggahannya.
  Future<ApiEnvelope<dynamic>> submitTransferProof({
    required int paymentId,
    required String proofFileUrl,
  }) async {
    const context = 'POST /payments/manual_transfer_proof';
    try {
      final response = await _dio.post<dynamic>(
        '/payments/manual_transfer_proof',
        data: {'payment_id': paymentId, 'proof_file_url': proofFileUrl},
      );
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
