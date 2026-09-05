import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/repositories/catalog_repository.dart';
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
        _tokens = injector<TokenStore>(),
        super(const CatalogHomeState());

  static CatalogHomeCubit get(BuildContext context) => BlocProvider.of(context);

  final CatalogRepository _repository;
  final TokenStore _tokens;

  /// Penentu apakah tier harga `PROJECT` boleh dirender (aturan PRD-06).
  bool get isB2B => _tokens.isB2B;

  /// Nama untuk sapaan di app bar. `null` kalau belum login atau profil
  /// belum termuat — app bar menampilkan "Halo" saja.
  String? get userName => _tokens.userName;

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

  /// Membuka satu kategori: SKU-nya diambil, lalu penawaran untuk SKU itu.
  ///
  /// Dua tahap dengan sengaja, karena API-nya memang begitu — `/offers`
  /// berkunci `sku_id`, tidak ada endpoint "penawaran per kategori".
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

    final skuResult = await _repository.skus(categoryId: category.id);
    if (isClosed) return;

    switch (skuResult) {
      case DataFailed(:final error):
        emit(state.copyWith(isLoadingOffers: false, error: error));
        return;
      case DataEmpty():
        emit(state.copyWith(isLoadingOffers: false, isEmptyResult: true));
        return;
      case DataLoading():
        return;
      case DataSuccess(:final data):
        // Dibatasi supaya membuka kategori besar tidak memicu puluhan
        // request. Sisanya menyusul saat paginasi ditambahkan.
        final skus = data.take(_skuPreviewLimit).toList();
        final collected = <OfferModel>[];

        for (final sku in skus) {
          final offerResult = await _repository.offers(skuId: sku.id);
          if (isClosed) return;
          if (offerResult case DataSuccess(data: final list)) {
            collected.addAll(list.where((o) => o.isActive));
          }
          // Kategori yang salah satu SKU-nya gagal tetap menampilkan sisanya —
          // lebih baik daripada seluruh layar jadi error.
        }

        emit(state.copyWith(
          isLoadingOffers: false,
          offers: collected,
          skus: {for (final s in skus) s.id: s},
          isEmptyResult: collected.isEmpty,
        ));
    }
  }

  void showBrowse() {
    emit(state.copyWith(
      mode: CatalogHomeMode.browse,
      keyword: '',
      activeCategory: null,
      offers: const [],
      isEmptyResult: false,
      error: null,
    ));
  }

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
        break;
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
          isEmptyResult: data.isEmpty,
        ));
    }
  }

  static const _skuPreviewLimit = 8;
}
