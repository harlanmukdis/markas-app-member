import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data/datasources/remote/service/cart_service.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/cart/cart_add_result.dart';
import 'package:navy_wear/core/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._service);

  final CartService _service;

  @override
  Future<DataState<CartAddResult>> add({
    required int offerId,
    required double qty,
    int? unitId,
  }) async {
    try {
      final env = await _service.add(
        offerId: offerId,
        qty: qty,
        unitId: unitId,
      );
      return DataSuccess(
        env.data,
        meta: env.meta,
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }
}
