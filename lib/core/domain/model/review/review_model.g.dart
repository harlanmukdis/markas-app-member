// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewSummaryModel _$ReviewSummaryModelFromJson(Map<String, dynamic> json) =>
    _ReviewSummaryModel(
      reviewCount: json['review_count'] == null
          ? 0
          : const IntJson().fromJson(json['review_count']),
      avgRating: json['avg_rating'] == null
          ? 0
          : const DoubleJson().fromJson(json['avg_rating']),
    );

Map<String, dynamic> _$ReviewSummaryModelToJson(_ReviewSummaryModel instance) =>
    <String, dynamic>{
      'review_count': const IntJson().toJson(instance.reviewCount),
      'avg_rating': const DoubleJson().toJson(instance.avgRating),
    };

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
      id: const IntJson().fromJson(json['id']),
      offerId: const IntOrNullJson().fromJson(json['offer_id']),
      buyerId: const IntOrNullJson().fromJson(json['buyer_id']),
      rating: const IntJson().fromJson(json['rating']),
      comment: const StringOrNullJson().fromJson(json['comment']),
      buyerName: const StringOrNullJson().fromJson(json['buyer_name']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
    );

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'offer_id': const IntOrNullJson().toJson(instance.offerId),
      'buyer_id': const IntOrNullJson().toJson(instance.buyerId),
      'rating': const IntJson().toJson(instance.rating),
      'comment': const StringOrNullJson().toJson(instance.comment),
      'buyer_name': const StringOrNullJson().toJson(instance.buyerName),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
    };

_ReviewPageModel _$ReviewPageModelFromJson(Map<String, dynamic> json) =>
    _ReviewPageModel(
      summary: json['summary'] == null
          ? const ReviewSummaryModel()
          : ReviewSummaryModel.fromJson(
              json['summary'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ReviewModel>[],
    );

Map<String, dynamic> _$ReviewPageModelToJson(_ReviewPageModel instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'items': instance.items,
    };
