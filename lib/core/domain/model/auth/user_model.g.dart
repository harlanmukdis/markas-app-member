// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: const IntJson().fromJson(json['id']),
      email: const StringOrNullJson().fromJson(json['email']),
      phone: const StringOrNullJson().fromJson(json['phone']),
      fullName: const StringOrNullJson().fromJson(json['full_name']),
      avatarUrl: const StringOrNullJson().fromJson(json['avatar_url']),
      status: json['status'] == null
          ? ''
          : const StringJson().fromJson(json['status']),
      emailVerified: json['email_verified'] == null
          ? false
          : const BoolJson().fromJson(json['email_verified']),
      phoneVerified: json['phone_verified'] == null
          ? false
          : const BoolJson().fromJson(json['phone_verified']),
      createdAt: const ServerDateTimeJson().fromJson(json['created_at']),
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => UserRoleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UserRoleModel>[],
      stores: (json['stores'] as List<dynamic>?)
              ?.map((e) => UserStoreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UserStoreModel>[],
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'email': const StringOrNullJson().toJson(instance.email),
      'phone': const StringOrNullJson().toJson(instance.phone),
      'full_name': const StringOrNullJson().toJson(instance.fullName),
      'avatar_url': const StringOrNullJson().toJson(instance.avatarUrl),
      'status': const StringJson().toJson(instance.status),
      'email_verified': const BoolJson().toJson(instance.emailVerified),
      'phone_verified': const BoolJson().toJson(instance.phoneVerified),
      'created_at': const ServerDateTimeJson().toJson(instance.createdAt),
      'roles': instance.roles,
      'stores': instance.stores,
    };

_UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) =>
    _UserRoleModel(
      code:
          json['code'] == null ? '' : const StringJson().fromJson(json['code']),
      name: const StringOrNullJson().fromJson(json['name']),
    );

Map<String, dynamic> _$UserRoleModelToJson(_UserRoleModel instance) =>
    <String, dynamic>{
      'code': const StringJson().toJson(instance.code),
      'name': const StringOrNullJson().toJson(instance.name),
    };

_UserStoreModel _$UserStoreModelFromJson(Map<String, dynamic> json) =>
    _UserStoreModel(
      id: const IntJson().fromJson(json['id']),
      name: const StringOrNullJson().fromJson(json['name']),
      slug: const StringOrNullJson().fromJson(json['slug']),
      status: const StringOrNullJson().fromJson(json['status']),
    );

Map<String, dynamic> _$UserStoreModelToJson(_UserStoreModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'name': const StringOrNullJson().toJson(instance.name),
      'slug': const StringOrNullJson().toJson(instance.slug),
      'status': const StringOrNullJson().toJson(instance.status),
    };
