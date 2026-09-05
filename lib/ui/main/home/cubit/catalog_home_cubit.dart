import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/model/catalog/seller_model.dart';
import 'package:navy_wear/core/domain/repositories/catalog_repository.dart';
import 'package:navy_wear/core/domain/repositories/reference_repository.dart';
import 'package:navy_wear/core/services/token_store.dart';
import 'package:navy_wear/di/injector.dart';

part 'catalog_home_cubit.freezed.dart';
part 'catalog_home_state.dart';

/// Home berbasis katalog: kategori + pencarian.
///
/// Bentuknya mengikuti apa yang **benar-benar** disediakan API, bukan tata
/// letak UI kit. Tidak ada endpoint "semua produk" dan `GET /search`
/// mewajibkan `q`, jadi tidak ada feed produk tanpa kata kunci. Yang ada:
/// telusuri per kategori, atau cari.
class CatalogHomeCubit extends Cubit<CatalogHomeState> {
  CatalogHomeCubit()
      : _repository = injector<CatalogRepository>(),
        _reference = injector<ReferenceRepository>(),
        _tokens = injector<TokenStore>(),
        super(const CatalogHomeState());

  static CatalogHomeCubit get(BuildContext context) => BlocProvider.of(context);

  final CatalogRepository _repository;
  final ReferenceRepository _reference;
  final TokenStore _tokens;

  /// Penentu apakah tier harga `PROJECT` boleh dirender (aturan PRD-06).
  bool get isB2B => _tokens.isB2B;

  /// Nama untuk sapaan di app bar. `null` kalau belum login atau profil
  /// belum termuat — app bar menampilkan "Halo" saja.
  String? get userName => _tokens.userName;

  /// Memuat katalog awal: kategori + seluruh penawaran aktif.
  ///
  /// Grid Home sengaja langsung terisi (seperti tab Trending), bukan menunggu
  /// user memilih kategori. `GET /offers` tanpa filter mengembalikan semua
  /// penawaran aktif, jadi tidak perlu kata kunci.
  Future<void> load() async {
    await Future.wait([loadCategories(), loadAllOffers()]);
  }

  /// Chip "Semua": seluruh penawaran aktif.
  Future<void> loadAllOffers() async {
    emit(state.copyWith(
      mode: CatalogHomeMode.browse,
      activeCategory: null,
      keyword: '',
      isLoadingOffers: true,
      isEmptyResult: false,
      error: null,
    ));

    final result = await _repository.offersWithPrices();
    if (isClosed) return;
    await _applyOfferResult(result);
  }

  Future<void> loadCategories({bool force = false}) async {
    if (state.categories.isNotEmpty && !force) return;

    emit(state.copyWith(isLoadingCategories: true, error: null));
    final result = await _repository.categories();
    if (isClosed) return;

    emit(switch (result) {
      DataSuccess(:final data) =>
        state.copyWith(isLoadingCategories: false, categories: data),
      DataEmpty() => state.copyWith(
          isLoadingCategories: false,
          categories: const [],
          isEmptyResult: true,
        ),
      DataFailed(:final error) =>
        state.copyWith(isLoadingCategories: false, error: error),
      DataLoading() => state,
    });
  }

  Future<void> search(String rawKeyword) async {
    final keyword = rawKeyword.trim();
    if (keyword.isEmpty) {
      showBrowse();
      return;
    }

    emit(state.copyWith(
      mode: CatalogHomeMode.searchResults,
      keyword: keyword,
      activeCategory: null,
      isLoadingOffers: true,
      isEmptyResult: false,
      error: null,
      offers: const [],
    ));

    final result = await _repository.search(keyword);
    if (isClosed) return;
    await _applyOfferResult(result);
  }

  /// Membuka satu kategori.
  ///
  /// Memakai `GET /offers?category_id=` — **satu** panggilan, bukan
  /// mengambil SKU lalu penawaran per SKU. Versi sebelumnya melakukan itu
  /// karena saya keliru mengira `/offers` hanya berkunci `sku_id`.
  ///
  /// Nama SKU dan nama toko diambil terpisah karena respons `/offers` tidak
  /// memuat keduanya, dan harga dilengkapi lewat `offersWithPrices` karena
  /// bentuk list `/offers` mengembalikan `price_tiers` kosong.
  Future<void> openCategory(CategoryModel category) async {
    emit(state.copyWith(
      mode: CatalogHomeMode.categoryOffers,
      activeCategory: category,
      keyword: '',
      isLoadingOffers: true,
      isEmptyResult: false,
      error: null,
      offers: const [],
    ));

    final result = await _repository.offersWithPrices(categoryId: category.id);
    if (isClosed) return;
    await _applyOfferResult(result);
  }

  /// Kembali ke chip "Semua".
  Future<void> showBrowse() => loadAllOffers();

  Future<void> refresh() async {
    _repository.clearCache();
    await loadCategories(force: true);
    switch (state.mode) {
      case CatalogHomeMode.searchResults:
        await search(state.keyword);
      case CatalogHomeMode.categoryOffers:
        final category = state.activeCategory;
        if (category != null) await openCategory(category);
      case CatalogHomeMode.browse:
        await loadAllOffers();
    }
  }

  /// Melengkapi hasil pencarian dengan nama SKU.
  ///
  /// `GET /search` mengembalikan penawaran tanpa nama SKU-nya, jadi tanpa
  /// langkah ini kartu produk hanya bisa menampilkan `sku_id`.
  Future<void> _applyOfferResult(DataState<List<OfferModel>> result) async {
    switch (result) {
      case DataFailed(:final error):
        emit(state.copyWith(isLoadingOffers: false, error: error));
      case DataEmpty():
        emit(state.copyWith(isLoadingOffers: false, isEmptyResult: true));
      case DataLoading():
        break;
      case DataSuccess(:final data):
        final skuIds = data
            .where((o) => !o.isFreeform && o.skuId != null)
            .map((o) => o.skuId!)
            .toSet();

        var skus = state.skus;
        if (skuIds.isNotEmpty) {
          final skuResult = await _repository.skusByIds(skuIds);
          if (isClosed) return;
          if (skuResult case DataSuccess(data: final map)) {
            skus = {...skus, ...map};
          }
        }

        emit(state.copyWith(
          isLoadingOffers: false,
          offers: data,
          skus: skus,
          sellers: await _sellerNames(),
          isEmptyResult: data.isEmpty,
        ));
    }
  }

  /// Nama toko per id.
  ///
  /// `GET /offers` tidak memuat `seller_name` (hanya `GET /search` yang
  /// punya), jadi untuk penelusuran per kategori namanya diambil dari
  /// direktori toko — satu panggilan yang di-cache service, bukan satu
  /// panggilan per penawaran.
  Future<Map<int, String>> _sellerNames() async {
    if (state.sellers.isNotEmpty) return state.sellers;

    final result = await _reference.sellerDirectory(limit: 50);
    if (result case DataSuccess<List<SellerModel>>(data: final list)) {
      return {for (final s in list) s.id: s.name};
    }
    return state.sellers;
  }
}
