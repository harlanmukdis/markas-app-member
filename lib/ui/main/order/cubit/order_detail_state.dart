part of 'order_detail_cubit.dart';

@freezed
sealed class OrderDetailState with _$OrderDetailState {
  const OrderDetailState._();

  const factory OrderDetailState({
    @Default(true) bool isLoading,
    DataError? error,
    String? message,

    OrderModel? order,
    PaymentModel? payment,

    @Default(false) bool isInitiatingPayment,
    @Default(false) bool isCancelling,
    @Default(<int>{}) Set<int> busyShipmentIds,
  }) = _OrderDetailState;

  bool get isReady => !isLoading && order != null;

  /// Metode pembayaran yang boleh ditawarkan.
  ///
  /// Untuk order di atas ambang server memaksa transfer bank, dan hanya dua
  /// dari lima metode benar-benar mengembalikan data yang bisa dirender —
  /// lihat [PaymentMethod.renderable].
  List<PaymentMethod> get selectableMethods => PaymentMethod.selectable(
        forcedBankTransfer: order?.forcedBankTransfer ?? false,
      );

  /// Tagihan sudah terbit dan belum lunas.
  bool get needsPayment => (order?.canPay ?? false) && !(payment?.isPaid ?? false);

  /// Tagihan **belum** terbit — toko harus mengonfirmasi ketersediaan dulu.
  /// Tombol bayar tidak boleh muncul.
  bool get awaitingStockConfirmation =>
      order?.awaitingStockConfirmation ?? false;

  /// Sudah ada tagihan yang bisa ditampilkan.
  bool get hasPaymentInstructions =>
      payment != null && (payment!.hasVirtualAccount || payment!.hasQris);

  bool isShipmentBusy(int id) => busyShipmentIds.contains(id);
}
