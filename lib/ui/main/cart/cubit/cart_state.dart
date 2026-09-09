part of 'cart_cubit.dart';

/// Isi satu baris keranjang setelah dilengkapi.
///
/// `GET /cart/view` hanya membawa `offer_id`, `qty`, `seller_id`,
/// `offer_status`, dan `min_order_qty` — tanpa nama, foto, maupun harga. Jadi
/// tiap baris harus dilengkapi dari `GET /offers/{id}` (yang membawa foto +
/// `price_tiers`) dan `GET /sku-master?ids=` (nama + satuan dasar).
@freezed
abstract class CartLine with _$CartLine {
  const CartLine._();

  const factory CartLine({
    required CartItemModel item,
    OfferModel? offer,
    SkuBriefModel? sku,
  }) = _CartLine;

  int get id => item.id;
  int get offerId => item.offerId;
  double get qty => item.qty;

  String get title {
    if (offer?.isFreeform == true) {
      return offer?.freeformName ?? 'Barang tanpa nama';
    }
    return sku?.name ?? 'Produk #$offerId';
  }

  String? get unitName => sku?.baseUnit;
  String? get photoUrl => offer?.primaryPhotoUrl;

  /// Harga per satuan **sebagai acuan saja**.
  ///
  /// Diambil dari tier yang berlaku untuk qty ini, tapi **bukan jaminan**:
  /// server menghitung ulang seluruh harga saat checkout (aturan CRT-02).
  int? referencePrice({required bool isB2B}) => offer
      ?.tierFor(qty: qty, segment: isB2B ? 'PROJECT' : 'RETAIL')
      ?.price ??
      offer?.tierFor(qty: qty, segment: 'RETAIL')?.price;

  /// Penawaran sudah dinonaktifkan sejak masuk keranjang — checkout akan
  /// ditolak `OFFER_NOT_ACTIVE`.
  bool get isInactive => item.isOfferInactive;

  /// Qty di bawah minimum order toko — checkout akan ditolak
  /// `BELOW_MIN_ORDER`.
  bool get belowMinOrder => item.belowMinOrder;

  double get minOrderShortfall {
    final gap = item.minOrderQty - qty;
    return gap <= 0 ? 0 : gap;
  }

  /// Batas qty untuk penawaran sampel (ORD-16).
  int? get maxQty => offer?.maxSelectableQty;
}

/// Satu kelompok toko di keranjang.
///
/// Pengelompokan per toko bukan kosmetik: minimum order, ongkir, dan
/// pembatalan semuanya berlaku per toko, jadi tiap toko dapat kartunya
/// sendiri.
@freezed
abstract class CartSellerGroup with _$CartSellerGroup {
  const CartSellerGroup._();

  const factory CartSellerGroup({
    required int sellerId,
    String? sellerName,
    @Default(<CartLine>[]) List<CartLine> lines,
  }) = _CartSellerGroup;

  String get displayName => sellerName ?? 'Toko #$sellerId';

  bool get hasBlockingIssue =>
      lines.any((l) => l.isInactive || l.belowMinOrder);
}

@freezed
sealed class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default(true) bool isLoading,
    DataError? error,

    @Default(<CartSellerGroup>[]) List<CartSellerGroup> groups,

    /// Baris yang sedang diproses (hapus / ubah qty), supaya tombolnya bisa
    /// dimatikan tanpa memblokir seluruh layar.
    @Default(<int>{}) Set<int> busyLineIds,

    @Default(false) bool isClearing,
    String? message,
  }) = _CartState;

  List<CartLine> get allLines => groups.expand((g) => g.lines).toList();

  int get itemCount => allLines.length;
  bool get isEmpty => !isLoading && allLines.isEmpty;

  /// Ada yang akan menggagalkan checkout — tombolnya dimatikan.
  bool get hasBlockingIssue => groups.any((g) => g.hasBlockingIssue);

  bool isBusy(int lineId) => busyLineIds.contains(lineId);
}
