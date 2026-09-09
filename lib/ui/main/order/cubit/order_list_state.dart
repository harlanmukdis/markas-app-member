part of 'order_list_cubit.dart';

/// Tab daftar pesanan.
///
/// Pengelompokannya mengikuti status order induk, sesuai saran peta fitur.
/// Status pengiriman **tidak** dipakai di sini karena satu order bisa punya
/// beberapa pengiriman dengan status berbeda — memfilter berdasarkan itu akan
/// membuat satu pesanan muncul di dua tab.
enum OrderTab {
  belumBayar('Belum Bayar', {'MENUNGGU_BAYAR', 'MENUNGGU_KONFIRMASI_STOK'}),
  diproses('Diproses', {'DIBAYAR', 'DP_DIBAYAR', 'BERJALAN'}),
  selesai('Selesai', {'SELESAI'}),
  dibatalkan(
    'Dibatalkan',
    {'DIBATALKAN', 'KEDALUWARSA', 'DIHENTIKAN', 'REFUND_PENUH',
      'REFUND_SEBAGIAN'},
  );

  const OrderTab(this.label, this.statuses);

  final String label;
  final Set<String> statuses;
}

@freezed
sealed class OrderListState with _$OrderListState {
  const OrderListState._();

  const factory OrderListState({
    @Default(true) bool isLoading,
    DataError? error,
    @Default(<OrderModel>[]) List<OrderModel> orders,
    @Default(OrderTab.belumBayar) OrderTab tab,
  }) = _OrderListState;

  /// Pesanan pada tab yang aktif.
  List<OrderModel> get visibleOrders =>
      orders.where((o) => tab.statuses.contains(o.status)).toList();

  int countFor(OrderTab tab) =>
      orders.where((o) => tab.statuses.contains(o.status)).length;

  /// Status yang tidak masuk tab mana pun — dibiarkan terlihat di tab
  /// "Diproses" daripada hilang tanpa jejak kalau backend menambah status
  /// baru.
  List<OrderModel> get unclassified => orders
      .where((o) => !OrderTab.values.any((t) => t.statuses.contains(o.status)))
      .toList();
}
