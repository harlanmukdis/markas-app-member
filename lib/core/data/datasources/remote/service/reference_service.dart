import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/catalog/seller_model.dart';
import 'package:navy_wear/core/domain/model/reference/reference_models.dart';

/// Data referensi yang jarang berubah: zona, jenis armada, parameter
/// konfigurasi, dan direktori toko.
///
/// Ketiga yang pertama di-cache seumur proses karena praktis statis dalam satu
/// sesi — `zones` sendiri 32 baris dan dibutuhkan di form alamat, filter
/// pencarian, dan form RFQ.
class ReferenceService {
  ReferenceService(this._dio);

  final Dio _dio;

  List<ZoneModel>? _zones;
  List<FleetTypeModel>? _fleetTypes;
  final Map<String, List<ConfigParameterModel>> _configCache = {};

  void clearCache() {
    _zones = null;
    _fleetTypes = null;
    _configCache.clear();
  }

  /// `GET /zones` — hierarkis `PROVINCE` → `CITY` → `ZONE`.
  Future<ApiEnvelope<List<ZoneModel>>> zones({bool forceRefresh = false}) async {
    final cached = _zones;
    if (!forceRefresh && cached != null) {
      return ApiEnvelope(data: cached, statusCode: 200);
    }
    final result = await _list(
      path: '/zones',
      fromJson: ZoneModel.fromJson,
      context: 'GET /zones',
    );
    _zones = result.data;
    return result;
  }

  /// `GET /fleet-types` — dipakai di form RFQ sebagai `max_fleet_type_code`.
  Future<ApiEnvelope<List<FleetTypeModel>>> fleetTypes({
    bool forceRefresh = false,
  }) async {
    final cached = _fleetTypes;
    if (!forceRefresh && cached != null) {
      return ApiEnvelope(data: cached, statusCode: 200);
    }
    final result = await _list(
      path: '/fleet-types',
      fromJson: FleetTypeModel.fromJson,
      context: 'GET /fleet-types',
    );
    _fleetTypes = result.data;
    return result;
  }

  /// `GET /config/parameters?group=` — lihat [ConfigGroup] untuk grup yang ada.
  Future<ApiEnvelope<List<ConfigParameterModel>>> configParameters(
    String group, {
    bool forceRefresh = false,
  }) async {
    final cached = _configCache[group];
    if (!forceRefresh && cached != null) {
      return ApiEnvelope(data: cached, statusCode: 200);
    }
    final result = await _list(
      path: '/config/parameters',
      query: {'group': group},
      fromJson: ConfigParameterModel.fromJson,
      context: 'GET /config/parameters?group=$group',
    );
    _configCache[group] = result.data;
    return result;
  }

  /// `GET /sellers/directory` — hanya toko `VERIFIED`.
  ///
  /// `meta` membawa `limit` dan `offset` untuk paginasi.
  Future<ApiEnvelope<List<SellerModel>>> sellerDirectory({
    int limit = 24,
    int offset = 0,
    String? sellerType,
  }) {
    return _list(
      path: '/sellers/directory',
      query: {
        'limit': limit,
        'offset': offset,
        if (sellerType != null) 'seller_type': sellerType,
      },
      fromJson: SellerModel.fromJson,
      context: 'GET /sellers/directory',
    );
  }

  /// `GET /sellers/directory/{id}` — 404 kalau toko belum `VERIFIED`.
  Future<ApiEnvelope<SellerModel>> sellerDetail(int id) async {
    const path = '/sellers/directory';
    try {
      final response = await _dio.get<dynamic>('$path/$id');
      return parseEnvelope(
        response,
        (raw) => SellerModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: 'GET $path/$id',
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: 'GET $path/$id');
    }
  }

  /// `GET /chat/seller_response_rate` — untuk badge "biasanya membalas dalam
  /// X menit". `data` bisa null kalau belum ada data.
  Future<ApiEnvelope<SellerResponseRateModel?>> sellerResponseRate(
    int sellerId,
  ) async {
    const context = 'GET /chat/seller_response_rate';
    try {
      final response = await _dio.get<dynamic>(
        '/chat/seller_response_rate',
        queryParameters: {'seller_id': sellerId},
      );
      return parseEnvelope<SellerResponseRateModel?>(
        response,
        (raw) => raw is Map
            ? SellerResponseRateModel.fromJson(
                Map<String, dynamic>.from(raw))
            : null,
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Future<ApiEnvelope<List<T>>> _list<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    required String context,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get<dynamic>(path, queryParameters: query);
      return parseEnvelopeList(response, fromJson, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
