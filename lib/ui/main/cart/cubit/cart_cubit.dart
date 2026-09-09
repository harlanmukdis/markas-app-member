import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/cart/cart_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/seller_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/repositories/catalog_repository.dart';
import 'package:navy_wear/core/domain/repositories/reference_repository.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';
import 'package:navy_wear/core/services/token_store.dart';
import 'package:navy_wear/di/injector.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : _cart = injector<CartRepository>(),
        _catalog = injector<CatalogRepository>(),
        _reference = injector<ReferenceRepository>(),
        _tokens = injector<TokenStore>(),
        super(const CartState());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository _cart;
  final CatalogRepository _catalog;
  final ReferenceRepository _reference;
  final TokenStore _tokens;

  bool get isB2B => _tokens.isB2B;

  /// Memuat keranjang dan melengkapi tiap barisnya.
  ///
  /// Butuh N+2 panggilan dan itu batasan API, bukan pilihan: `/cart/view`
  /// tidak membawa nama, harga, maupun `sku_id`, dan `GET /offers?ids=`
  /// **tidak didukung** (parameter `ids` diabaikan, yang kembali justru
  /// halaman pertama katalog — sudah diverifikasi). Jadi tiap penawaran harus
  /// diambil satu per satu, walaupun `CatalogService` men-cache-nya sehingga
  /// membuka keranjang berulang kali tidak mengulang request.
  ///
  /// Bandingkan dengan `/wishlist`, yang sudah diperkaya server.
  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null, message: null));

    final result = await _cart.view();
    if (isClosed) return;

    switch (result) {
      case DataFailed(:final error):
        emit(state.copyWith(isLoading: false, error: error));
      case DataSuccess<CartModel>(:final data):
        emit(state.copyWith(
          isLoading: false,
          groups: await _buildGroups(data),
        ));
      default:
        emit(state.copyWith(isLoading: false, groups: const []));
    }
  }

  Future<List<CartSellerGroup>> _buildGroups(CartModel cart) async {
    if (cart.isEmpty) return const [];

    final offers = <int, OfferModel>{};
    for (final item in cart.allItems) {
      final result = await _catalog.offerDetail(item.offerId);
      if (isClosed) return const [];
      if (result case DataSuccess<OfferModel>(:final data)) {
        offers[item.offerId] = data;
      }
      // Penawaran yang gagal diambil tetap tampil dengan label cadangan —
      // menghilangkannya dari keranjang jauh lebih membingungkan.
    }

    final skuIds = offers.values
        .where((o) => !o.isFreeform && o.skuId != null)
        .map((o) => o.skuId!)
        .toSet();

    var skus = <int, SkuBriefModel>{};
    if (skuIds.isNotEmpty) {
      final result = await _catalog.skusByIds(skuIds);
      if (isClosed) return const [];
      if (result case DataSuccess<Map<int, SkuBriefModel>>(:final data)) {
        skus = data;
      }
    }

    final sellerNames = await _sellerNames();
    if (isClosed) return const [];

    return [
      for (final entry in cart.groupedBySeller.entries)
        CartSellerGroup(
          sellerId: entry.key,
          sellerName: sellerNames[entry.key],
          lines: [
            for (final item in entry.value)
              CartLine(
                item: item,
                offer: offers[item.offerId],
                sku: offers[item.offerId]?.skuId == null
                    ? null
                    : skus[offers[item.offerId]!.skuId],
              ),
          ],
        ),
    ];
  }

  Future<Map<int, String>> _sellerNames() async {
    final result = await _reference.sellerDirectory(limit: 100);
    if (result case DataSuccess<List<SellerModel>>(:final data)) {
      return {for (final s in data) s.id: s.name};
    }
    return const {};
  }

  /// Mengubah qty satu baris.
  ///
  /// `POST /cart/add` **mengganti** qty, bukan menambahkannya — sudah
  /// diverifikasi (add 60 dua kali tetap menghasilkan 60). Jadi stepper
  /// cukup mengirim nilai barunya.
  Future<void> setQty(CartLine line, double qty) async {
    if (qty < 1 || state.isBusy(line.id)) return;

    final max = line.maxQty;
    if (max != null && qty > max) return;

    emit(state.copyWith(busyLineIds: {...state.busyLineIds, line.id}));

    final result = await _cart.add(
      offerId: line.offerId,
      qty: qty,
      unitId: line.item.unitId,
    );
    if (isClosed) return;

    if (result case DataFailed(:final error)) {
      emit(state.copyWith(
        busyLineIds: {...state.busyLineIds}..remove(line.id),
        error: error,
      ));
      return;
    }

    await _reloadKeepingBusy(line.id);
  }

  Future<void> removeLine(CartLine line) async {
    if (state.isBusy(line.id)) return;
    emit(state.copyWith(busyLineIds: {...state.busyLineIds, line.id}));

    final result = await _cart.remove(line.id);
    if (isClosed) return;

    if (result case DataFailed(:final error)) {
      emit(state.copyWith(
        busyLineIds: {...state.busyLineIds}..remove(line.id),
        error: error,
      ));
      return;
    }

    await _reloadKeepingBusy(line.id, message: 'Barang dihapus dari keranjang');
  }

  Future<void> clear() async {
    emit(state.copyWith(isClearing: true, error: null));
    final result = await _cart.clear();
    if (isClosed) return;

    if (result case DataFailed(:final error)) {
      emit(state.copyWith(isClearing: false, error: error));
      return;
    }
    emit(state.copyWith(isClearing: false, groups: const []));
  }

  Future<void> _reloadKeepingBusy(int lineId, {String? message}) async {
    final result = await _cart.view();
    if (isClosed) return;

    final groups = result is DataSuccess<CartModel>
        ? await _buildGroups(result.data)
        : state.groups;
    if (isClosed) return;

    emit(state.copyWith(
      groups: groups,
      busyLineIds: {...state.busyLineIds}..remove(lineId),
      message: message,
    ));
  }

  void clearMessage() => emit(state.copyWith(message: null, error: null));
}
