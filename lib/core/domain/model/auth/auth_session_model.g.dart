// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSessionModel _$AuthSessionModelFromJson(Map<String, dynamic> json) =>
    _AuthSessionModel(
      accessToken: const StringJson().fromJson(json['access_token']),
      refreshToken: const StringOrNullJson().fromJson(json['refresh_token']),
      expiresIn: const IntOrNullJson().fromJson(json['expires_in']),
      requiresReconsent: json['requires_reconsent'] == null
          ? false
          : const BoolJson().fromJson(json['requires_reconsent']),
    );

Map<String, dynamic> _$AuthSessionModelToJson(_AuthSessionModel instance) =>
    <String, dynamic>{
      'access_token': const StringJson().toJson(instance.accessToken),
      'refresh_token': const StringOrNullJson().toJson(instance.refreshToken),
      'expires_in': const IntOrNullJson().toJson(instance.expiresIn),
      'requires_reconsent': const BoolJson().toJson(instance.requiresReconsent),
    };

_RegisterResultModel _$RegisterResultModelFromJson(Map<String, dynamic> json) =>
    _RegisterResultModel(
      userId: const IntJson().fromJson(json['user_id']),
      devVerificationToken:
          const StringOrNullJson().fromJson(json['dev_verification_token']),
    );

Map<String, dynamic> _$RegisterResultModelToJson(
        _RegisterResultModel instance) =>
    <String, dynamic>{
      'user_id': const IntJson().toJson(instance.userId),
      'dev_verification_token':
          const StringOrNullJson().toJson(instance.devVerificationToken),
    };
