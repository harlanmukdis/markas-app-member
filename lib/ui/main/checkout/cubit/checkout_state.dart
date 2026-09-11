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

    /// Kode voucher yang menempel di keranjang sebelum checkout.
    ///
    /// Sengaja kode, bukan angka pratinjau: `discount_amount_preview` hanya
    /// dikirim sekali oleh `POST /cart/voucher` dan hilang begitu halaman
    /// dimuat ulang — di web itu satu tombol refresh. Kode-nya selalu bisa
    /// dibaca ulang dari `GET /cart/view`.
    @Default(<String>[]) List<String> cartVoucherCodes,

    DataError? error,
  }) = _CheckoutState;

  /// Voucher dilewati server saat checkout.
  ///
  /// Server memvalidasi ulang voucher terhadap nilai final; yang tidak lagi
  /// memenuhi syarat **dibuang diam-diam** dan checkout tetap berhasil. Tanpa
  /// pembandingan ini pembeli baru sadar potongannya hilang setelah membayar.
  ///
  /// Yang terdeteksi di sini adalah kasus tegasnya: ada voucher menempel tapi
  /// potongannya nol. Kalau dua voucher menempel dan hanya satu yang dibuang,
  /// `discount_total` tetap > 0 dan selisihnya tidak bisa dihitung tanpa
  /// melakukan aritmetika uang sendiri — yang justru dilarang.
  bool get voucherSkipped =>
      result != null &&
      cartVoucherCodes.isNotEmpty &&
      result!.discountTotal == 0;

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
