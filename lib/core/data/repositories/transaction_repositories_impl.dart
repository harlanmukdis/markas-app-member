import 'package:navy_wear/core/data/datasources/remote/service/address_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/cart_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/order_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/payment_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/voucher_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/wishlist_service.dart';
import 'package:navy_wear/core/data/repositories/repository_guard.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/address/address_model.dart';
import 'package:navy_wear/core/domain/model/cart/cart_add_result.dart';
import 'package:navy_wear/core/domain/model/cart/cart_model.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/domain/model/payment/payment_model.dart';
import 'package:navy_wear/core/domain/model/voucher/voucher_models.dart';
import 'package:navy_wear/core/domain/model/wishlist/wishlist_item_model.dart';
import 'package:navy_wear/core/data/datasources/remote/service/wallet_service.dart';
import 'package:navy_wear/core/domain/model/wallet/wallet_models.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';

class AddressRepositoryImpl with RepositoryGuard implements AddressRepository {
  AddressRepositoryImpl(this._service);

  final AddressService _service;

  @override
  Future<DataState<List<AddressModel>>> list() =>
      guardList(() => _service.list());

  @override
  Future<DataState<AddressModel>> detail(int id) =>
      guard(() => _service.detail(id));

  @override
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
  }) =>
      guard(() => _service.create(
            recipientName: recipientName,
            phone: phone,
            province: province,
            city: city,
            fullAddress: fullAddress,
            lat: lat,
            lng: lng,
            label: label,
            district: district,
            zoneId: zoneId,
            isDefault: isDefault,
          ));

  @override
  Future<DataState<void>> update(int id, Map<String, dynamic> changes) =>
      guardVoid(() => _service.update(id, changes));

  @override
  Future<DataState<void>> delete(int id) =>
      guardVoid(() => _service.delete(id));
}

class CartRepositoryImpl with RepositoryGuard implements CartRepository {
  CartRepositoryImpl(this._service);

  final CartService _service;

  @override
  Future<DataState<CartAddResult>> add({
    required int offerId,
    required double qty,
    int? unitId,
  }) =>
      guard(() => _service.add(offerId: offerId, qty: qty, unitId: unitId));

  @override
  Future<DataState<CartModel>> view() => guard(() => _service.view());

  @override
  Future<DataState<void>> remove(int itemId) =>
      guardVoid(() => _service.remove(itemId));

  @override
  Future<DataState<CartVoucherModel>> attachVoucher({
    required String code,
    int? sellerId,
  }) =>
      guard(() => _service.attachVoucher(code: code, sellerId: sellerId));

  @override
  Future<DataState<void>> removeVoucher(String code) =>
      guardVoid(() => _service.removeVoucher(code));

  @override
  Future<DataState<void>> clear() => guardVoid(() => _service.clear());
}

class OrderRepositoryImpl with RepositoryGuard implements OrderRepository {
  OrderRepositoryImpl(this._service);

  final OrderService _service;

  @override
  Future<DataState<CheckoutResultModel>> checkout({
    required int addressId,
    bool? allOrNothing,
  }) =>
      guard(() => _service.checkout(
            addressId: addressId,
            allOrNothing: allOrNothing,
          ));

  @override
  Future<DataState<List<OrderModel>>> list() =>
      guardList(() => _service.list());

  @override
  Future<DataState<OrderModel>> detail(int orderId) =>
      guard(() => _service.detail(orderId));

  @override
  Future<DataState<void>> cancel(int orderId) =>
      guardVoid(() => _service.cancel(orderId));

  @override
  Future<DataState<SubOrderModel>> subOrder(int subOrderId) =>
      guard(() => _service.subOrder(subOrderId));

  @override
  Future<DataState<ShipmentModel>> shipment(int shipmentId) =>
      guard(() => _service.shipment(shipmentId));

  @override
  Future<DataState<void>> completeShipment(int shipmentId) =>
      guardVoid(() => _service.completeShipment(shipmentId));
}

class PaymentRepositoryImpl with RepositoryGuard implements PaymentRepository {
  PaymentRepositoryImpl(this._service);

  final PaymentService _service;

  @override
  Future<DataState<PaymentModel>> initiate({
    required int orderId,
    required PaymentMethod method,
  }) =>
      guard(() => _service.initiate(orderId: orderId, method: method));

  @override
  Future<DataState<PaymentModel>> detail({int? orderId, int? paymentId}) =>
      guard(() => _service.detail(orderId: orderId, paymentId: paymentId));

  @override
  Future<DataState<void>> submitTransferProof({
    required int paymentId,
    required String proofFileUrl,
  }) =>
      guardVoid(() => _service.submitTransferProof(
            paymentId: paymentId,
            proofFileUrl: proofFileUrl,
          ));
}

class WishlistRepositoryImpl
    with RepositoryGuard
    implements WishlistRepository {
  WishlistRepositoryImpl(this._service);

  final WishlistService _service;

  @override
  Future<DataState<List<WishlistItemModel>>> list() =>
      guardList(() => _service.list());

  @override
  Future<DataState<void>> add(int offerId) =>
      guardVoid(() => _service.add(offerId));

  @override
  Future<DataState<void>> remove(int offerId) =>
      guardVoid(() => _service.remove(offerId));
}

class VoucherRepositoryImpl with RepositoryGuard implements VoucherRepository {
  VoucherRepositoryImpl(this._service);

  final VoucherService _service;

  @override
  Future<DataState<List<Map<String, dynamic>>>> list({int? sellerId}) =>
      guardList(() => _service.list(sellerId: sellerId));

  @override
  Future<DataState<VoucherValidationModel>> validate({
    required String code,
    required int subOrderSubtotal,
    int? subOrderId,
  }) =>
      guard(() => _service.validate(
            code: code,
            subOrderSubtotal: subOrderSubtotal,
            subOrderId: subOrderId,
          ));
}

class WalletRepositoryImpl with RepositoryGuard implements WalletRepository {
  WalletRepositoryImpl(this._service);

  final WalletService _service;

  @override
  Future<DataState<WalletBalanceModel>> balance() =>
      guard(() => _service.balance());

  @override
  Future<DataState<WalletTopupModel>> topup({
    required TopupMethod method,
    required int amount,
  }) =>
      guard(() => _service.topup(method: method, amount: amount));

  @override
  Future<DataState<List<WalletEntryModel>>> history({
    int limit = 30,
    int offset = 0,
  }) =>
      guardList(() => _service.history(limit: limit, offset: offset));
}
