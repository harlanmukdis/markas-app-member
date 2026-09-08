import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/seller_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';
import 'package:navy_wear/core/domain/repositories/catalog_repository.dart';
import 'package:navy_wear/core/domain/repositories/reference_repository.dart';
import 'package:navy_wear/core/services/token_store.dart';
import 'package:navy_wear/di/injector.dart';

part 'product_detail_cubit.freezed.dart';
part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.offerId)
      : _catalog = injector<CatalogRepository>(),
        _reference = injector<ReferenceRepository>(),
        _cart = injector<CartRepository>(),
        _tokens = injector<TokenStore>(),
        super(const ProductDetailState());

  static ProductDetailCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final int offerId;
  final CatalogRepository _catalog;
  final ReferenceRepository _reference;
  final CartRepository _cart;
  final TokenStore _tokens;

  bool get isB2B => _tokens.isB2B;

  /// Memuat seluruh isi halaman.
  ///
  /// Empat sumber, dan tidak ada satu endpoint yang menggabungkannya:
  /// `GET /offers/{id}` untuk harga bertingkat, `GET /sku-master/{id}` untuk
  /// nama + `units[]`, `GET /offers?sku_id=` untuk penawaran toko lain, dan
  /// direktori toko untuk nama toko.
  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    final offerResult = await _catalog.offerDetail(offerId);
    if (isClosed) return;

    if (offerResult case DataFailed(:final error)) {
      emit(state.copyWith(isLoading: false, error: error));
      return;
    }
    if (offerResult is! DataSuccess<OfferModel>) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final offer = offerResult.data;
    emit(state.copyWith(offer: offer));

    // Penawaran jalur BEBAS tidak punya SKU master, jadi tidak ada `units[]`
    // maupun penawaran pembanding untuk diambil.
    SkuModel? sku;
    var others = <OfferModel>[];

    if (offer.skuId != null) {
      final results = await Future.wait([
        _catalog.skuDetail(offer.skuId!),
        _catalog.offersWithPrices(skuId: offer.skuId!),
      ]);
      if (isClosed) return;

      if (results[0] case DataSuccess<SkuModel>(data: final s)) sku = s;
      if (results[1] case DataSuccess<List<OfferModel>>(data: final list)) {
        others = list.where((o) => o.id != offer.id && o.isActive).toList();
      }
    }

    final sellers = await _sellerNames();
    if (isClosed) return;

    final defaultUnit = sku?.defaultSellUnit;

    emit(state.copyWith(
      isLoading: false,
      sku: sku,
      otherOffers: others,
      sellers: sellers,
      selectedUnit: defaultUnit,
      // Qty awal dipasang ke minimum order supaya user tidak langsung
      // ditolak `BELOW_MIN_ORDER` saat checkout — dikonversi dulu dari satuan
      // dasar ke satuan yang dipilih.
      qty: _initialQty(offer, defaultUnit),
    ));
  }

  static double _initialQty(OfferModel offer, SkuUnitModel? unit) {
    // Sampel tidak mengikuti minimum order — batasnya justru di atas.
    if (offer.isSample) return 1;

    final minBase = offer.minOrderQty;
    if (minBase <= 0) return 1;
    final factor = unit?.conversionFactorToBase ?? 1;
    if (factor <= 0) return 1;
    final needed = (minBase / factor).ceil();
    return needed < 1 ? 1 : needed.toDouble();
  }

  Future<Map<int, String>> _sellerNames() async {
    final result = await _reference.sellerDirectory(limit: 50);
    if (result case DataSuccess<List<SellerModel>>(data: final list)) {
      return {for (final s in list) s.id: s.name};
    }
    return state.sellers;
  }

  void selectUnit(SkuUnitModel unit) {
    if (unit.unitName == state.selectedUnit?.unitName) return;

    // Qty dipertahankan secara nilai fisik, bukan angkanya: 2 dus tidak boleh
    // berubah jadi 2 pcs saat user menukar satuan.
    final base = state.qtyInBaseUnit;
    final newQty = unit.conversionFactorToBase <= 0
        ? state.qty
        : (base / unit.conversionFactorToBase);

    emit(state.copyWith(
      selectedUnit: unit,
      qty: newQty < 1 ? 1 : double.parse(newQty.toStringAsFixed(2)),
      cartMessage: null,
    ));
  }

  void addQty() {
    // Penawaran sampel dibatasi 2 pcs per transaksi (ORD-16). Dibatasi di
    // sini supaya user tidak menaikkan qty lalu ditolak server dengan
    // SAMPLE_QTY_EXCEEDED saat menekan tambah-ke-keranjang.
    final max = state.offer?.maxSelectableQty;
    if (max != null && state.qty >= max) return;
    emit(state.copyWith(qty: state.qty + 1, cartMessage: null));
  }

  void minusQty() {
    if (state.qty <= 1) return;
    emit(state.copyWith(qty: state.qty - 1, cartMessage: null));
  }

  void setCalculatorInput(String raw) {
    final value = double.tryParse(raw.replaceAll(',', '.')) ?? 0;
    emit(state.copyWith(calculatorInput: value));
  }

  /// Memakai hasil kalkulator sebagai qty.
  void applyCalculator() {
    final result = state.calculatorResult;
    if (result == null || result <= 0) return;
    emit(state.copyWith(qty: result.toDouble(), cartMessage: null));
  }

  Future<void> addToCart() async {
    final offer = state.offer;
    if (offer == null || state.isAddingToCart) return;

    emit(state.copyWith(isAddingToCart: true, error: null, cartMessage: null));

    final result = await _cart.add(
      offerId: offer.id,
      // Server menerima qty dalam satuan yang ditunjuk `unit_id`; kalau tidak
      // ada satuan terpilih, qty dikirim dalam satuan dasar.
      qty: state.selectedUnit == null ? state.qtyInBaseUnit : state.qty,
      unitId: state.selectedUnit?.id,
    );
    if (isClosed) return;

    emit(switch (result) {
      DataSuccess() => state.copyWith(
          isAddingToCart: false,
          cartMessage: 'Ditambahkan ke keranjang',
        ),
      DataFailed(:final error) =>
        state.copyWith(isAddingToCart: false, error: error),
      _ => state.copyWith(isAddingToCart: false),
    });
  }

  void clearCartMessage() => emit(state.copyWith(cartMessage: null));
}
