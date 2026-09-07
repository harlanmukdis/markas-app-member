// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSessionModel _$AuthSessionModelFromJson(Map<String, dynamic> json) =>
    _AuthSessionModel(
      userId: const IntJson().fromJson(json['user_id']),
      accessToken: const StringJson().fromJson(json['access_token']),
      refreshToken: const StringOrNullJson().fromJson(json['refresh_token']),
      role: const StringOrNullJson().fromJson(json['role']),
      expiresIn: const IntOrNullJson().fromJson(json['expires_in']),
      tokenType: const StringOrNullJson().fromJson(json['token_type']),
      sellerId: const IntOrNullJson().fromJson(json['seller_id']),
      actorType: const StringOrNullJson().fromJson(json['actor_type']),
    );

Map<String, dynamic> _$AuthSessionModelToJson(_AuthSessionModel instance) =>
    <String, dynamic>{
      'user_id': const IntJson().toJson(instance.userId),
      'access_token': const StringJson().toJson(instance.accessToken),
      'refresh_token': const StringOrNullJson().toJson(instance.refreshToken),
      'role': const StringOrNullJson().toJson(instance.role),
      'expires_in': const IntOrNullJson().toJson(instance.expiresIn),
      'token_type': const StringOrNullJson().toJson(instance.tokenType),
      'seller_id': const IntOrNullJson().toJson(instance.sellerId),
      'actor_type': const StringOrNullJson().toJson(instance.actorType),
    };
