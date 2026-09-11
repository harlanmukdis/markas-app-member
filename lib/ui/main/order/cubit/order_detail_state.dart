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

    /// Saldo dompet, dimuat bersama order supaya tombol "Bayar dengan Saldo"
    /// bisa menyebut angkanya. Null artinya belum/ gagal dimuat — UI tetap
    /// menawarkan saldo, karena server yang berhak memutuskan.
    int? walletBalance,
  }) = _OrderDetailState;

  bool get isReady => !isLoading && order != null;

  /// Metode pembayaran yang boleh ditawarkan.
  ///
  /// Untuk order di atas ambang server memaksa transfer bank — tapi `SALDO`
  /// dikecualikan dari aturan itu, jadi ia tetap ikut. Tiga dari enam metode
  /// tidak mengembalikan data yang bisa dirender — lihat
  /// [PaymentMethod.renderable].
  List<PaymentMethod> get selectableMethods => PaymentMethod.selectable(
        forcedBankTransfer: order?.forcedBankTransfer ?? false,
      );

  /// Kekurangan saldo untuk melunasi order ini, atau null kalau saldo belum
  /// diketahui atau sudah cukup. Dihitung dari angka server (`grand_total`
  /// dan `balance`), bukan dari perhitungan uang sendiri.
  int? get walletShortfall {
    final balance = walletBalance;
    final total = order?.grandTotal;
    if (balance == null || total == null) return null;
    final diff = total - balance;
    return diff > 0 ? diff : null;
  }

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
