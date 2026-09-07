import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

/// Satu baris keranjang.
///
/// Perhatikan yang **tidak** ada di sini: nama produk, foto, dan harga.
/// Respons keranjang hanya membawa `offer_id`, `qty`, `seller_id`,
/// `offer_status`, dan `min_order_qty` — jadi layar keranjang harus melengkapi
/// sendiri dari `/offers/{id}` dan `/sku-master/{id}`.
@freezed
abstract class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @IntJson() required int id,
    @IntJson() @JsonKey(name: 'cart_id') required int cartId,
    @IntJson() @JsonKey(name: 'offer_id') required int offerId,
    @IntOrNullJson() @JsonKey(name: 'unit_id') int? unitId,

    /// Berdesimal (`"60.0000"`) — pasir per m³ dan cat per liter bisa pecahan.
    @DoubleJson() @Default(0) double qty,

    @IntJson() @JsonKey(name: 'seller_id') required int sellerId,
    @StringOrNullJson() @JsonKey(name: 'offer_status') String? offerStatus,
    @DoubleJson() @JsonKey(name: 'min_order_qty') @Default(0)
    double minOrderQty,
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  /// Penawaran sudah dinonaktifkan sejak masuk keranjang — checkout akan
  /// ditolak `OFFER_NOT_ACTIVE`, jadi user perlu diberi tahu lebih dulu.
  bool get isOfferInactive => offerStatus != null && offerStatus != 'ACTIVE';

  /// Qty belum memenuhi minimum order toko.
  bool get belowMinOrder => qty < minOrderQty;
}

/// Keranjang, **dikelompokkan per toko**.
///
/// Pengelompokan ini bukan kosmetik: minimum order, ongkir, dan pembatalan
/// semuanya berlaku per toko, jadi UI wajib menampilkan kartu terpisah per
/// toko.
@freezed
abstract class CartModel with _$CartModel {
  const CartModel._();

  const factory CartModel({
    @IntOrNullJson() @JsonKey(name: 'cart_id') int? cartId,
    @GroupedBySellerConverter()
    @JsonKey(name: 'grouped_by_seller')
    @Default(<int, List<CartItemModel>>{})
    Map<int, List<CartItemModel>> groupedBySeller,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  List<CartItemModel> get allItems =>
      groupedBySeller.values.expand((e) => e).toList();

  bool get isEmpty => allItems.isEmpty;
  int get sellerCount => groupedBySeller.length;

  /// Ada item yang akan menggagalkan checkout.
  bool get hasBlockingIssue =>
      allItems.any((i) => i.isOfferInactive || i.belowMinOrder);
}

/// Membaca `grouped_by_seller`, yang **berubah bentuk tergantung isinya**.
///
/// Sudah diverifikasi ke backend v2.2:
///
/// * keranjang terisi → **objek** ber-key `seller_id` (`{"1": [...], "2": [...]}`)
/// * keranjang kosong → **array kosong** (`[]`)
///
/// Ini perilaku khas PHP: `json_encode` menghasilkan `{}` untuk array
/// asosiatif berisi, tapi `[]` untuk array kosong. Model yang mendeklarasikan
/// `Map` langsung akan `CastError` tepat saat user membuka keranjang kosong —
/// yaitu keadaan pertama yang dilihat setiap user baru.
class GroupedBySellerConverter
    extends JsonConverter<Map<int, List<CartItemModel>>, Object?> {
  const GroupedBySellerConverter();

  @override
  Map<int, List<CartItemModel>> fromJson(Object? json) {
    if (json is! Map) return const {};

    return {
      for (final entry in json.entries)
        if (asIntOrNull(entry.key) != null && entry.value is List)
          asIntOrNull(entry.key)!: (entry.value as List)
              .whereType<Map>()
              .map((e) => CartItemModel.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
    };
  }

  @override
  Object? toJson(Map<int, List<CartItemModel>> object) => {
        for (final entry in object.entries)
          '${entry.key}': entry.value.map((e) => e.toJson()).toList(),
      };
}
