import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/cart/cart_add_result.dart';
import 'package:navy_wear/core/domain/model/cart/cart_model.dart';

/// Keranjang. **Semua endpoint di sini khusus `BUY_R`/`BUY_B`** — role lain
/// dibalas `403`.
///
/// Perhatikan bentuk `grouped_by_seller` pada [view]: **objek** ber-key
/// `seller_id` saat terisi, tapi **array kosong** saat keranjang kosong.
/// Ditangani `GroupedBySellerConverter`.
class CartService {
  CartService(this._dio);

  final Dio _dio;

  /// `POST /cart/add`. Kalau item-nya sudah ada, qty di-*upsert* oleh server.
  ///
  /// [unitId] opsional; kalau diisi, harus salah satu id dari `units[]` milik
  /// SKU tersebut.
  ///
  /// Perhatikan [qty] bertipe `double`: kuantitas di API ini **berdesimal**
  /// (`5.0000`), karena pasir per m³ dan cat per liter bisa pecahan.
  Future<ApiEnvelope<CartAddResult>> add({
    required int offerId,
    required double qty,
    int? unitId,
  }) async {
    const context = 'POST /cart/add';
    try {
      final response = await _dio.post<dynamic>(
        '/cart/add',
        data: {
          'offer_id': offerId,
          'qty': qty,
          if (unitId != null) 'unit_id': unitId,
        },
      );
      return parseEnvelope(
        response,
        (raw) => CartAddResult.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /cart/view` — perhatikan path-nya: **`/cart/view`**, bukan `/cart`
  /// (routing CodeIgniter; `/cart` membalas 404 "Endpoint not found").
  Future<ApiEnvelope<CartModel>> view() async {
    const context = 'GET /cart/view';
    try {
      final response = await _dio.get<dynamic>('/cart/view');
      return parseEnvelope(
        response,
        (raw) => CartModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /cart/remove` — menghapus satu baris keranjang.
  Future<ApiEnvelope<dynamic>> remove(int itemId) async {
    const context = 'POST /cart/remove';
    try {
      final response =
          await _dio.post<dynamic>('/cart/remove', data: {'item_id': itemId});
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<dynamic>> clear() async {
    const context = 'POST /cart/clear';
    try {
      final response = await _dio.post<dynamic>('/cart/clear');
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
