import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

/// Merek dari `GET /brands`.
@freezed
abstract class BrandModel with _$BrandModel {
  const BrandModel._();

  const factory BrandModel({
    @IntJson() required int id,
    @StringJson() required String name,
    @StringOrNullJson() String? slug,

    /// Merek bersertifikat (SNI dan sejenisnya).
    ///
    /// Relevan untuk kategori berisiko — besi, semen, kabel — di mana merek
    /// palsu bukan soal selera tapi soal keselamatan bangunan. Dikirim
    /// sebagai `"1"`/`"0"`.
    @BoolJson() @JsonKey(name: 'is_certified') @Default(false)
    bool isCertified,

    @StringOrNullJson() @JsonKey(name: 'logo_url') String? logoUrl,

    /// Jumlah penawaran aktif bermerek ini. `0` berarti merek terdaftar tapi
    /// belum ada barangnya — jangan ditampilkan sebagai filter.
    @IntJson() @JsonKey(name: 'offer_count') @Default(0) int offerCount,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  bool get hasOffers => offerCount > 0;
}

/// Bahan sidebar filter dari `GET /offers/facets?category_id=`.
@freezed
abstract class OfferFacetsModel with _$OfferFacetsModel {
  const OfferFacetsModel._();

  const factory OfferFacetsModel({
    @IntOrNullJson() @JsonKey(name: 'price_min') int? priceMin,
    @IntOrNullJson() @JsonKey(name: 'price_max') int? priceMax,

    /// Jumlah penawaran dengan rating **≥ N**, ber-key `"5"`..`"1"`.
    ///
    /// Kumulatif, bukan histogram: nilai pada `"4"` sudah mencakup yang
    /// berating 5. Menampilkannya sebagai batang histogram akan menyesatkan.
    @JsonKey(name: 'rating_counts')
    @Default(<String, int>{})
    Map<String, int> ratingCounts,

    @Default(<FacetBrand>[]) List<FacetBrand> brands,
  }) = _OfferFacetsModel;

  factory OfferFacetsModel.fromJson(Map<String, dynamic> json) =>
      _$OfferFacetsModelFromJson(json);

  bool get hasPriceRange =>
      priceMin != null && priceMax != null && priceMax! > priceMin!;

  int countAtLeast(int stars) => ratingCounts['$stars'] ?? 0;
}

/// Merek beserta jumlah penawarannya di dalam facet.
@freezed
abstract class FacetBrand with _$FacetBrand {
  const factory FacetBrand({
    @IntJson() required int id,
    @StringJson() required String name,
    @IntJson() @Default(0) int cnt,
  }) = _FacetBrand;

  factory FacetBrand.fromJson(Map<String, dynamic> json) =>
      _$FacetBrandFromJson(json);
}
