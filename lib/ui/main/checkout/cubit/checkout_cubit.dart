import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/address/address_model.dart';
import 'package:navy_wear/core/domain/model/cart/cart_model.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';
import 'package:navy_wear/di/injector.dart';

part 'checkout_cubit.freezed.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit()
      : _addresses = injector<AddressRepository>(),
        _orders = injector<OrderRepository>(),
        _cart = injector<CartRepository>(),
        super(const CheckoutState());

  static CheckoutCubit get(BuildContext context) => BlocProvider.of(context);

  final AddressRepository _addresses;
  final OrderRepository _orders;
  final CartRepository _cart;

  Future<void> loadAddresses() async {
    emit(state.copyWith(isLoadingAddresses: true, error: null));

    final result = await _addresses.list();
    if (isClosed) return;

    switch (result) {
      case DataSuccess<List<AddressModel>>(:final data):
        // Alamat default dipilih otomatis; kalau tidak ada yang default,
        // ambil yang pertama supaya user tidak perlu memilih untuk kasus
        // paling umum (satu alamat).
        final usable = data.where((a) => a.hasCoordinates).toList();
        final preselect = usable.where((a) => a.isDefault).firstOrNull ??
            usable.firstOrNull;
        emit(state.copyWith(
          isLoadingAddresses: false,
          addresses: data,
          selectedAddressId: state.selectedAddressId ?? preselect?.id,
        ));
      case DataEmpty():
        emit(state.copyWith(isLoadingAddresses: false, addresses: const []));
      case DataFailed(:final error):
        emit(state.copyWith(isLoadingAddresses: false, error: error));
      case DataLoading():
        break;
    }
  }

  void selectAddress(int addressId) =>
      emit(state.copyWith(selectedAddressId: addressId, error: null));

  /// Mengaktifkan "semua atau tidak sama sekali" (CRT-08).
  ///
  /// Kalau satu sub-order batal, semuanya batal dan direfund penuh. Berguna
  /// untuk proyek yang materialnya harus datang lengkap — semen tanpa pasir
  /// tidak berguna.
  void setAllOrNothing(bool value) =>
      emit(state.copyWith(allOrNothing: value));

  /// Membaca kode voucher yang menempel, untuk dibandingkan setelah checkout.
  ///
  /// Kegagalannya diabaikan: ini cuma bahan peringatan, bukan syarat checkout.
  Future<void> loadCartVouchers() async {
    final result = await _cart.view();
    if (isClosed) return;
    if (result case DataSuccess<CartModel>(:final data)) {
      emit(state.copyWith(
        cartVoucherCodes: data.vouchers.map((v) => v.code).toList(),
      ));
    }
  }

  Future<void> submit() async {
    final addressId = state.selectedAddressId;
    if (addressId == null || state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, error: null, result: null));

    final result = await _orders.checkout(
      addressId: addressId,
      allOrNothing: state.allOrNothing,
    );
    if (isClosed) return;

    emit(switch (result) {
      DataSuccess<CheckoutResultModel>(:final data) =>
        state.copyWith(isSubmitting: false, result: data),
      DataFailed(:final error) =>
        state.copyWith(isSubmitting: false, error: error),
      _ => state.copyWith(isSubmitting: false),
    });
  }

  /// Menambah alamat baru lalu langsung memilihnya.
  Future<bool> createAddress({
    required String recipientName,
    required String phone,
    required String province,
    required String city,
    required String fullAddress,
    required double lat,
    required double lng,
    String? label,
    String? district,
    bool isDefault = false,
  }) async {
    emit(state.copyWith(isSavingAddress: true, error: null));

    final result = await _addresses.create(
      recipientName: recipientName,
      phone: phone,
      province: province,
      city: city,
      fullAddress: fullAddress,
      lat: lat,
      lng: lng,
      label: label,
      district: district,
      isDefault: isDefault,
    );
    if (isClosed) return false;

    if (result case DataFailed(:final error)) {
      emit(state.copyWith(isSavingAddress: false, error: error));
      return false;
    }

    final newId = result.valueOrNull;
    emit(state.copyWith(isSavingAddress: false, selectedAddressId: newId));
    await loadAddresses();
    return true;
  }

  void clearError() => emit(state.copyWith(error: null));
}
