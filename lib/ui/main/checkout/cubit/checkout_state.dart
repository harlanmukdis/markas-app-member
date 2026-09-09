part of 'checkout_cubit.dart';

@freezed
sealed class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  const factory CheckoutState({
    @Default(false) bool isLoadingAddresses,
    @Default(<AddressModel>[]) List<AddressModel> addresses,
    int? selectedAddressId,

    @Default(false) bool allOrNothing,

    @Default(false) bool isSubmitting,
    @Default(false) bool isSavingAddress,

    /// Hasil checkout yang berhasil — dipakai layar untuk memutuskan tujuan
    /// berikutnya.
    CheckoutResultModel? result,

    DataError? error,
  }) = _CheckoutState;

  AddressModel? get selectedAddress {
    for (final a in addresses) {
      if (a.id == selectedAddressId) return a;
    }
    return null;
  }

  /// Alamat tanpa koordinat tidak bisa dipakai: server memakainya untuk
  /// menentukan zona ongkir (USR-09).
  List<AddressModel> get usableAddresses =>
      addresses.where((a) => a.hasCoordinates).toList();

  List<AddressModel> get unusableAddresses =>
      addresses.where((a) => !a.hasCoordinates).toList();

  bool get canSubmit =>
      selectedAddressId != null && !isSubmitting && selectedAddress != null;

  bool get hasNoAddress => !isLoadingAddresses && addresses.isEmpty;
}
