import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// Kategori dari `GET /categories` dan `GET /categories/{id}`.
@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,
    @StringJson() required String name,
    @StringOrNullJson() String? slug,
    @IntOrNullJson() int? level,

    /// `MASTER` (komoditas dengan SKU baku) atau `BEBAS` (long tail).
    @StringJson() required String jalur,

    /// Kategori berisiko — dikirim sebagai `"1"`/`"0"`, bukan boolean.
    @BoolJson() @JsonKey(name: 'is_risky') @Default(false) bool isRisky,

    @ServerDateTimeJson() @JsonKey(name: 'created_date')
    DateTime? createdDate,

    /// Atribut untuk filter dinamis.
    ///
    /// Dibiarkan longgar sebagai `Map` karena backend belum punya data
    /// atribut sama sekali (`attributes: []` di semua kategori), jadi
    /// bentuknya belum bisa dipastikan. Modelkan dengan tepat begitu
    /// datanya ada — menebak sekarang justru berisiko `CastError`.
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> attributes,

    @Default(<CategoryModel>[]) List<CategoryModel> children,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// Kategori komoditas dengan SKU baku; `BEBAS` adalah long tail bebas.
  bool get isMasterJalur => jalur == 'MASTER';

  bool get isRoot => parentId == null;
  bool get hasChildren => children.isNotEmpty;
}
