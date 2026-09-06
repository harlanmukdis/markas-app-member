import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'cart_add_result.freezed.dart';
part 'cart_add_result.g.dart';

/// Hasil `POST /cart/add`.
///
/// `cart_id` dikirim sebagai **string** (`"2"`) sementara `item_id` sebagai
/// **int** (`10`) — di respons yang sama. Keduanya ditangani [IntJson].
@freezed
abstract class CartAddResult with _$CartAddResult {
  const factory CartAddResult({
    @IntJson() @JsonKey(name: 'cart_id') required int cartId,
    @IntJson() @JsonKey(name: 'item_id') required int itemId,
  }) = _CartAddResult;

  factory CartAddResult.fromJson(Map<String, dynamic> json) =>
      _$CartAddResultFromJson(json);
}
