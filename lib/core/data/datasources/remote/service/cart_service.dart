import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/cart/cart_add_result.dart';

/// Keranjang. **Semua endpoint di sini khusus `BUY_R`/`BUY_B`** — role lain
/// dibalas `403`.
///
/// Saat ini hanya `add()` yang ada, karena itu yang dibutuhkan tombol di
/// halaman detail produk. Sisa keranjang (view/remove/clear beserta model
/// `grouped_by_seller`-nya) menyusul bersama layar keranjang.
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
}
