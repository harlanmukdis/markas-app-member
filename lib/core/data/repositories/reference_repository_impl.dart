import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data/datasources/remote/service/reference_service.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/seller_model.dart';
import 'package:navy_wear/core/domain/model/reference/reference_models.dart';
import 'package:navy_wear/core/domain/repositories/reference_repository.dart';

class ReferenceRepositoryImpl implements ReferenceRepository {
  ReferenceRepositoryImpl(this._service);

  final ReferenceService _service;

  @override
  void clearCache() => _service.clearCache();

  @override
  Future<DataState<List<ZoneModel>>> zones({bool forceRefresh = false}) =>
      _guardList(() => _service.zones(forceRefresh: forceRefresh));

  @override
  Future<DataState<List<FleetTypeModel>>> fleetTypes({
    bool forceRefresh = false,
  }) =>
      _guardList(() => _service.fleetTypes(forceRefresh: forceRefresh));

  @override
  Future<DataState<List<ConfigParameterModel>>> configParameters(
    String group, {
    bool forceRefresh = false,
  }) =>
      _guardList(
        () => _service.configParameters(group, forceRefresh: forceRefresh),
      );

  @override
  Future<DataState<ConfigParameterModel?>> configValue({
    required String group,
    required String key,
  }) async {
    final result = await configParameters(group);
    return switch (result) {
      DataSuccess(:final data) => DataSuccess(
          data.where((p) => p.paramKey == key).firstOrNull,
        ),
      // Grup yang kosong bukan kegagalan — kuncinya memang tidak ada.
      DataEmpty() => const DataSuccess(null),
      DataFailed(:final error) => DataFailed(error),
      DataLoading() => const DataLoading(),
    };
  }

  @override
  Future<DataState<List<SellerModel>>> sellerDirectory({
    int limit = 24,
    int offset = 0,
    String? sellerType,
  }) =>
      _guardList(() => _service.sellerDirectory(
            limit: limit,
            offset: offset,
            sellerType: sellerType,
          ));

  @override
  Future<DataState<SellerModel>> sellerDetail(int id) =>
      _guard(() => _service.sellerDetail(id));

  @override
  Future<DataState<SellerResponseRateModel?>> sellerResponseRate(
    int sellerId,
  ) =>
      _guard(() => _service.sellerResponseRate(sellerId));

  Future<DataState<T>> _guard<T>(
    Future<ApiEnvelope<T>> Function() call,
  ) async {
    try {
      final env = await call();
      return DataSuccess<T>(
        env.data,
        meta: env.meta,
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  Future<DataState<List<T>>> _guardList<T>(
    Future<ApiEnvelope<List<T>>> Function() call,
  ) async {
    try {
      final env = await call();
      return env.data.isEmpty
          ? DataEmpty<List<T>>(meta: env.meta)
          : DataSuccess<List<T>>(
              env.data,
              meta: env.meta,
              statusCode: env.statusCode,
            );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }
}
