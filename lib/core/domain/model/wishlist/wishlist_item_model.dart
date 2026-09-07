import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/domain/model/catalog/photo_model.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'wishlist_item_model.freezed.dart';
part 'wishlist_item_model.g.dart';

/// Item wishlist dari `GET /wishlist`.
///
/// Respons ini **sudah diperkaya server** dengan `display_name`,
/// `display_price`, dan `photos_json` — jadi layar wishlist tidak perlu
/// melengkapi sendiri dari `/offers/{id}`, berbeda dari keranjang yang hanya
/// membawa `offer_id`.
@freezed
abstract class WishlistItemModel with _$WishlistItemModel {
  const WishlistItemModel._();

  const factory WishlistItemModel({
    @IntJson() required int id,
    @IntJson() @JsonKey(name: 'offer_id') required int offerId,
    @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
    @StringOrNullJson() @JsonKey(name: 'display_name') String? displayName,
    @IntOrNullJson() @JsonKey(name: 'display_price') int? displayPrice,
    @StringOrNullJson() @JsonKey(name: 'freeform_name') String? freeformName,
    @PhotosJsonConverter() @JsonKey(name: 'photos_json')
    @Default(<PhotoModel>[])
    List<PhotoModel> photos,
    @DoubleJson() @JsonKey(name: 'min_order_qty') @Default(0)
    double minOrderQty,
    @StringOrNullJson() @JsonKey(name: 'offer_status') String? offerStatus,
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,
  }) = _WishlistItemModel;

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);

  String get title {
    for (final candidate in [displayName, freeformName]) {
      final v = candidate?.trim();
      if (v != null && v.isNotEmpty) return v;
    }
    return 'Produk #$offerId';
  }

  String? get primaryPhotoUrl => photos.isEmpty ? null : photos.first.url;

  /// Penawaran sudah tidak aktif — item wishlist tetap ada, tapi tidak bisa
  /// dibeli. UI perlu menandainya alih-alih membiarkan user menekan tombol
  /// yang pasti gagal.
  bool get isOfferInactive => offerStatus != null && offerStatus != 'ACTIVE';
}
