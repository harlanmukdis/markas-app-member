import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/seller_model.dart';
import 'package:navy_wear/core/domain/model/reference/reference_models.dart';

/// Data referensi + direktori toko.
abstract interface class ReferenceRepository {
  Future<DataState<List<ZoneModel>>> zones({bool forceRefresh = false});
  Future<DataState<List<FleetTypeModel>>> fleetTypes({
    bool forceRefresh = false,
  });

  /// Lihat [ConfigGroup] untuk daftar grup yang tersedia.
  Future<DataState<List<ConfigParameterModel>>> configParameters(
    String group, {
    bool forceRefresh = false,
  });

  /// Satu parameter langsung, `null` kalau tidak ada.
  ///
  /// Disediakan karena pemanggil hampir selalu butuh satu kunci saja (mis.
  /// ambang order besar), bukan seluruh grup.
  Future<DataState<ConfigParameterModel?>> configValue({
    required String group,
    required String key,
  });

  Future<DataState<List<SellerModel>>> sellerDirectory({
    int limit,
    int offset,
    String? sellerType,
  });

  Future<DataState<SellerModel>> sellerDetail(int id);

  Future<DataState<SellerResponseRateModel?>> sellerResponseRate(int sellerId);

  void clearCache();
}
