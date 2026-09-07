import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

/// Ringkasan rating sebuah penawaran.
///
/// Dipakai dua tempat: blok `summary` pada `GET /offers/{id}/reviews`, dan
/// nilai di dalam `GET /offers/reviews-summary?ids=` yang berbentuk objek
/// ber-key `offer_id`.
@freezed
abstract class ReviewSummaryModel with _$ReviewSummaryModel {
  const ReviewSummaryModel._();

  const factory ReviewSummaryModel({
    @IntJson() @JsonKey(name: 'review_count') @Default(0) int reviewCount,

    /// Dikirim sebagai string desimal (`"5.00"`), termasuk `"0.00"` untuk
    /// penawaran yang belum punya ulasan.
    @DoubleJson() @JsonKey(name: 'avg_rating') @Default(0) double avgRating,
  }) = _ReviewSummaryModel;

  factory ReviewSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewSummaryModelFromJson(json);

  /// Belum ada ulasan sama sekali.
  ///
  /// Penting dibedakan dari rating rendah: backend mengirim `avg_rating`
  /// `"0.00"` untuk penawaran tanpa ulasan, dan menampilkannya sebagai
  /// bintang 0 akan membuat produk baru terlihat buruk padahal belum dinilai
  /// siapa pun.
  bool get hasReviews => reviewCount > 0;
}

/// Satu ulasan pembeli dari `GET /offers/{id}/reviews`.
@freezed
abstract class ReviewModel with _$ReviewModel {
  const ReviewModel._();

  const factory ReviewModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
    @IntOrNullJson() @JsonKey(name: 'buyer_id') int? buyerId,
    @IntJson() required int rating,
    @StringOrNullJson() String? comment,
    @StringOrNullJson() @JsonKey(name: 'buyer_name') String? buyerName,
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  String get displayName {
    final name = buyerName?.trim();
    return (name == null || name.isEmpty) ? 'Pembeli' : name;
  }

  bool get hasComment => comment != null && comment!.trim().isNotEmpty;
}

/// Isi `GET /offers/{id}/reviews`: ringkasan + daftar.
@freezed
abstract class ReviewPageModel with _$ReviewPageModel {
  const factory ReviewPageModel({
    @Default(ReviewSummaryModel()) ReviewSummaryModel summary,
    @Default(<ReviewModel>[]) List<ReviewModel> items,
  }) = _ReviewPageModel;

  factory ReviewPageModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewPageModelFromJson(json);
}
