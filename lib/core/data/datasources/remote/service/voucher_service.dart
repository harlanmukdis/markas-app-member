import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/voucher/voucher_models.dart';

/// Voucher.
///
/// > **`POST /vouchers/apply` sengaja TIDAK dibuatkan method di sini.**
/// > Endpoint itu tidak memeriksa autentikasi sama sekali, mengambil
/// > `buyer_id` dari body, dan memakai `discount_amount` kiriman client tanpa
/// > dihitung ulang — artinya pihak tanpa akun bisa memasang potongan
/// > sembarang ke sub-order milik orang lain. Masih terbuka di v2.2.
/// > Pemakaian voucher diserahkan ke server saat checkout; [validate] hanya
/// > untuk pratinjau.
class VoucherService {
  VoucherService(this._dio);

  final Dio _dio;

  /// `GET /vouchers` — tanpa [sellerId] mengembalikan voucher platform.
  Future<ApiEnvelope<List<Map<String, dynamic>>>> list({int? sellerId}) async {
    const context = 'GET /vouchers';
    try {
      final response = await _dio.get<dynamic>(
        '/vouchers',
        queryParameters: {if (sellerId != null) 'seller_id': sellerId},
      );
      return parseEnvelopeList<Map<String, dynamic>>(
        response,
        (json) => json,
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /vouchers/validate` — **pratinjau, tidak mengikat**.
  ///
  /// [subOrderId] opsional tapi sebaiknya dikirim kalau sudah ada, supaya
  /// aturan PRM-03 (maksimal 1 voucher platform + 1 voucher toko per
  /// sub-order) ikut diperiksa dan user tidak kaget saat checkout.
  Future<ApiEnvelope<VoucherValidationModel>> validate({
    required String code,
    required int subOrderSubtotal,
    int? subOrderId,
  }) async {
    const context = 'POST /vouchers/validate';
    try {
      final response = await _dio.post<dynamic>(
        '/vouchers/validate',
        data: {
          'code': code,
          'sub_order_subtotal': subOrderSubtotal,
          if (subOrderId != null) 'sub_order_id': subOrderId,
        },
      );
      return parseEnvelope(
        response,
        (raw) => VoucherValidationModel.fromJson(
            Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
