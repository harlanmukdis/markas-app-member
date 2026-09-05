// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => _PhotoModel(
      url: const StringJson().fromJson(json['url']),
      width: const IntOrNullJson().fromJson(json['width']),
      height: const IntOrNullJson().fromJson(json['height']),
    );

Map<String, dynamic> _$PhotoModelToJson(_PhotoModel instance) =>
    <String, dynamic>{
      'url': const StringJson().toJson(instance.url),
      'width': const IntOrNullJson().toJson(instance.width),
      'height': const IntOrNullJson().toJson(instance.height),
    };
