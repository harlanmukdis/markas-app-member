import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

/// Satu foto produk dari `photos_json`.
@freezed
abstract class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    @StringJson() required String url,
    @IntOrNullJson() int? width,
    @IntOrNullJson() int? height,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}

/// Membaca `photos_json`, yang **bukan array melainkan String berisi JSON**.
///
/// Backend mengirimnya apa adanya dari kolom database:
///
/// ```json
/// "photos_json": "[{\"url\":\"https:\\/\\/contoh.test\\/semen1.jpg\",\"width\":1200,\"height\":1200}]"
/// ```
///
/// Jadi butuh dua tahap: parse amplop respons, lalu parse string ini lagi.
/// Model yang mendeklarasikan `List<PhotoModel>` langsung akan gagal dengan
/// `CastError` begitu halaman produk dibuka.
///
/// Nilai yang tidak bisa dibaca menghasilkan list kosong, bukan exception —
/// satu foto rusak tidak boleh menggagalkan seluruh parsing produk.
class PhotosJsonConverter
    extends JsonConverter<List<PhotoModel>, Object?> {
  const PhotosJsonConverter();

  @override
  List<PhotoModel> fromJson(Object? json) {
    final raw = switch (json) {
      String s when s.trim().isEmpty => null,
      // Sudah berupa array — ditangani agar tetap benar kalau backend
      // memperbaiki tipenya nanti.
      String s => _tryDecode(s),
      List list => list,
      _ => null,
    };

    if (raw is! List) return const [];

    return raw
        .whereType<Map>()
        .map((e) => PhotoModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Object? _tryDecode(String source) {
    try {
      return jsonDecode(source);
    } catch (_) {
      return null;
    }
  }

  @override
  Object? toJson(List<PhotoModel> object) =>
      jsonEncode(object.map((e) => e.toJson()).toList());
}
