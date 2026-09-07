import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/address/address_model.dart';

/// Buku alamat member.
///
/// `owner_type` diturunkan server dari token, jadi tidak pernah dikirim dari
/// sini — client tidak bisa mengaku sebagai pemilik lain.
class AddressService {
  AddressService(this._dio);

  final Dio _dio;

  Future<ApiEnvelope<List<AddressModel>>> list() async {
    const context = 'GET /addresses';
    try {
      final response = await _dio.get<dynamic>('/addresses');
      return parseEnvelopeList(response, AddressModel.fromJson,
          context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<AddressModel>> detail(int id) =>
      _one('GET', '/addresses/$id');

  /// `POST /addresses`.
  ///
  /// [lat] dan [lng] **wajib**: server memakainya untuk menentukan zona
  /// ongkir (USR-09). Tanpa keduanya alamat itu tidak bisa dipakai checkout.
  Future<ApiEnvelope<int>> create({
    required String recipientName,
    required String phone,
    required String province,
    required String city,
    required String fullAddress,
    required double lat,
    required double lng,
    String? label,
    String? district,
    int? zoneId,
    bool? isDefault,
  }) async {
    const context = 'POST /addresses';
    try {
      final response = await _dio.post<dynamic>(
        '/addresses',
        data: {
          'recipient_name': recipientName,
          'phone': phone,
          'province': province,
          'city': city,
          'full_address': fullAddress,
          'lat': lat,
          'lng': lng,
          if (label != null && label.trim().isNotEmpty) 'label': label.trim(),
          if (district != null && district.trim().isNotEmpty)
            'district': district.trim(),
          if (zoneId != null) 'zone_id': zoneId,
          if (isDefault != null) 'is_default': isDefault,
        },
      );
      return parseEnvelope(
        response,
        (raw) => raw is Map ? (raw['id'] as num).toInt() : 0,
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `PATCH /addresses/{id}` — hanya field yang dikirim yang diubah.
  Future<ApiEnvelope<dynamic>> update(
    int id,
    Map<String, dynamic> changes,
  ) async {
    final context = 'PATCH /addresses/$id';
    try {
      final response =
          await _dio.patch<dynamic>('/addresses/$id', data: changes);
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<dynamic>> delete(int id) async {
    final context = 'DELETE /addresses/$id';
    try {
      final response = await _dio.delete<dynamic>('/addresses/$id');
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<AddressModel>> _one(String method, String path) async {
    final context = '$method $path';
    try {
      final response = await _dio.get<dynamic>(path);
      return parseEnvelope(
        response,
        (raw) => AddressModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
