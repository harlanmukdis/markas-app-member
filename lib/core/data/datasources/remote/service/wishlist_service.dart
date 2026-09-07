import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/wishlist/wishlist_item_model.dart';

/// Wishlist, **tersimpan di server** sejak backend v2.2.
///
/// Sebelumnya fitur ini biasanya disimpan di `localStorage`; sekarang tidak
/// perlu — dan tidak boleh, karena wishlist server ikut sinkron antar
/// perangkat sedangkan penyimpanan lokal tidak.
class WishlistService {
  WishlistService(this._dio);

  final Dio _dio;

  Future<ApiEnvelope<List<WishlistItemModel>>> list() async {
    const context = 'GET /wishlist';
    try {
      final response = await _dio.get<dynamic>('/wishlist');
      return parseEnvelopeList(response, WishlistItemModel.fromJson,
          context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<dynamic>> add(int offerId) =>
      _post('/wishlist/add', offerId);

  Future<ApiEnvelope<dynamic>> remove(int offerId) =>
      _post('/wishlist/remove', offerId);

  Future<ApiEnvelope<dynamic>> _post(String path, int offerId) async {
    final context = 'POST $path';
    try {
      final response =
          await _dio.post<dynamic>(path, data: {'offer_id': offerId});
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
