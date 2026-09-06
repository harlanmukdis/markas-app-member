import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/cart/cart_add_result.dart';

abstract interface class CartRepository {
  /// Menambahkan penawaran ke keranjang.
  ///
  /// Kegagalan yang perlu pesan khusus di UI: `OFFER_NOT_ACTIVE` (404 —
  /// penawaran sudah dinonaktifkan) dan `FORBIDDEN` (403 — role tidak berhak).
  Future<DataState<CartAddResult>> add({
    required int offerId,
    required double qty,
    int? unitId,
  });
}
