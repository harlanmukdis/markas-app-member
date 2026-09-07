import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/address/address_model.dart';
import 'package:navy_wear/core/domain/model/cart/cart_add_result.dart';
import 'package:navy_wear/core/domain/model/cart/cart_model.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/domain/model/payment/payment_model.dart';
import 'package:navy_wear/core/domain/model/voucher/voucher_models.dart';
import 'package:navy_wear/core/domain/model/wishlist/wishlist_item_model.dart';

/// Buku alamat.
abstract interface class AddressRepository {
  Future<DataState<List<AddressModel>>> list();
  Future<DataState<AddressModel>> detail(int id);

  /// [lat]/[lng] wajib — server memakainya menentukan zona ongkir (USR-09).
  /// Mengembalikan id alamat baru.
  Future<DataState<int>> create({
    required String recipientName,
    required String phone,
    required String province,
    required String city,
    required String fullAddress,
    required double lat,
    required double lng,
    String? label,
    String? district,
    int? zoneId,
    bool? isDefault,
  });

  Future<DataState<void>> update(int id, Map<String, dynamic> changes);
  Future<DataState<void>> delete(int id);
}

/// Keranjang.
abstract interface class CartRepository {
  /// Kegagalan yang perlu pesan khusus: `OFFER_NOT_ACTIVE` (404) dan
  /// `FORBIDDEN`/`PERMISSION_DENIED` (403).
  Future<DataState<CartAddResult>> add({
    required int offerId,
    required double qty,
    int? unitId,
  });

  /// Keranjang dikelompokkan per toko.
  Future<DataState<CartModel>> view();

  Future<DataState<void>> remove(int itemId);
  Future<DataState<void>> clear();
}

/// Checkout, pesanan, pengiriman.
abstract interface class OrderRepository {
  /// Kegagalan yang perlu pesan khusus: `BELOW_MIN_ORDER` (tampilkan
  /// kekurangannya), `OFFER_NOT_ACTIVE`, `STOCK_RESERVATION_FAILED` (stok
  /// keburu habis — muat ulang), `SELLER_NOT_VERIFIED`, `NO_PRICE_TIER`.
  ///
  /// Catatan: untuk akun **B2B** checkout masih selalu gagal `NO_PRICE_TIER`
  /// karena bug backend yang belum beres di v2.2 — jalur B2B yang bisa
  /// dipakai hanya RFQ.
  Future<DataState<CheckoutResultModel>> checkout({
    required int addressId,
    bool? allOrNothing,
  });

  /// 50 terbaru, tanpa paginasi.
  Future<DataState<List<OrderModel>>> list();

  /// Satu panggilan untuk seluruh layar detail.
  Future<DataState<OrderModel>> detail(int orderId);

  Future<DataState<void>> cancel(int orderId);
  Future<DataState<SubOrderModel>> subOrder(int subOrderId);
  Future<DataState<ShipmentModel>> shipment(int shipmentId);

  /// Tombol "Pesanan Diterima" — level **pengiriman**, bukan order.
  Future<DataState<void>> completeShipment(int shipmentId);
}

/// Pembayaran.
abstract interface class PaymentRepository {
  /// [DataSuccess.isExisting] `true` berarti server mengembalikan pembayaran
  /// pending yang sudah ada (HTTP 200), bukan membuat yang baru (201).
  Future<DataState<PaymentModel>> initiate({
    required int orderId,
    required PaymentMethod method,
  });

  /// Dipakai untuk polling status.
  Future<DataState<PaymentModel>> detail({int? orderId, int? paymentId});

  Future<DataState<void>> submitTransferProof({
    required int paymentId,
    required String proofFileUrl,
  });
}

/// Wishlist, tersimpan di server sejak v2.2.
abstract interface class WishlistRepository {
  Future<DataState<List<WishlistItemModel>>> list();
  Future<DataState<void>> add(int offerId);
  Future<DataState<void>> remove(int offerId);
}

/// Voucher — hanya pratinjau; pemakaiannya diserahkan ke server saat checkout.
abstract interface class VoucherRepository {
  Future<DataState<List<Map<String, dynamic>>>> list({int? sellerId});

  Future<DataState<VoucherValidationModel>> validate({
    required String code,
    required int subOrderSubtotal,
    int? subOrderId,
  });
}
