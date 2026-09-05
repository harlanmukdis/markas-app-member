import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';

/// Panggilan HTTP untuk katalog: kategori, SKU master, penawaran, pencarian.
class CatalogService {
  CatalogService(this._dio);

  final Dio _dio;

  /// Cache detail SKU per id.
  ///
  /// Halaman produk dan keranjang berulang kali membutuhkan SKU yang sama
  /// (nama dan `units[]` untuk pemilih satuan). Tanpa cache, membuka daftar
  /// keranjang berisi 10 item memicu 10 request untuk data yang praktis tidak
  /// berubah.
  final Map<int, SkuModel> _skuCache = {};

  /// Kosongkan saat pull-to-refresh, supaya user punya cara memaksa data baru.
  void clearCache() => _skuCache.clear();

  /// `GET /categories` — tanpa [parentId] mengembalikan kategori level 1.
  Future<ApiEnvelope<List<CategoryModel>>> categories({int? parentId}) {
    return _list(
      path: '/categories',
      query: parentId == null ? null : {'parent_id': parentId},
      fromJson: CategoryModel.fromJson,
      context: 'GET /categories',
    );
  }

  /// `GET /categories/{id}` — kategori + `attributes[]` + `children[]`.
  Future<ApiEnvelope<CategoryModel>> categoryDetail(int id) {
    return _one(
      path: '/categories/$id',
      fromJson: CategoryModel.fromJson,
      context: 'GET /categories/$id',
    );
  }

  /// `GET /sku-master` — **salah satu** dari [q] atau [categoryId] wajib,
  /// kalau tidak server membalas `422`.
  Future<ApiEnvelope<List<SkuModel>>> skus({String? q, int? categoryId}) {
    assert(
      (q != null && q.isNotEmpty) || categoryId != null,
      'GET /sku-master butuh q atau category_id',
    );
    return _list(
      path: '/sku-master',
      query: {
        if (q != null && q.isNotEmpty) 'q': q,
        if (categoryId != null) 'category_id': categoryId,
      },
      fromJson: SkuModel.fromJson,
      context: 'GET /sku-master',
    );
  }

  /// `GET /sku-master/{id}` — SKU + `units[]` + `attributes[]`.
  ///
  /// Dijawab dari cache kalau sudah pernah diambil, kecuali [forceRefresh].
  Future<ApiEnvelope<SkuModel>> skuDetail(
    int id, {
    bool forceRefresh = false,
  }) async {
    final cached = _skuCache[id];
    if (!forceRefresh && cached != null) {
      return ApiEnvelope(data: cached, statusCode: 200);
    }

    final result = await _one(
      path: '/sku-master/$id',
      fromJson: SkuModel.fromJson,
      context: 'GET /sku-master/$id',
    );
    _skuCache[id] = result.data;
    return result;
  }

  /// Beberapa SKU sekaligus, dipotong jadi batch.
  ///
  /// Dipotong dengan sengaja: menembakkan `Future.wait` atas 50 id akan
  /// membuka 50 koneksi bersamaan dan bisa menjatuhkan server dev. Yang sudah
  /// ada di cache tidak diminta lagi.
  Future<Map<int, SkuModel>> skusByIds(
    Iterable<int> ids, {
    int batchSize = 6,
  }) async {
    final wanted = ids.toSet();
    final missing = wanted.where((id) => !_skuCache.containsKey(id)).toList();

    for (var i = 0; i < missing.length; i += batchSize) {
      final batch = missing.skip(i).take(batchSize);
      await Future.wait(
        batch.map((id) async {
          try {
            await skuDetail(id);
          } on ApiException {
            // Satu SKU yang hilang tidak boleh menggagalkan seluruh batch —
            // pemanggil melihatnya sebagai id yang tidak ada di hasil.
          }
        }),
      );
    }

    return {
      for (final id in wanted)
        if (_skuCache[id] != null) id: _skuCache[id]!,
    };
  }

  /// `GET /offers` — penawaran **ACTIVE** untuk satu SKU dari berbagai toko,
  /// atau seluruh penawaran satu toko.
  Future<ApiEnvelope<List<OfferModel>>> offers({int? skuId, int? sellerId}) {
    assert(
      skuId != null || sellerId != null,
      'GET /offers butuh sku_id atau seller_id',
    );
    return _list(
      path: '/offers',
      query: {
        if (skuId != null) 'sku_id': skuId,
        if (sellerId != null) 'seller_id': sellerId,
      },
      fromJson: OfferModel.fromJson,
      context: 'GET /offers',
    );
  }

  /// `GET /offers/{id}` — penawaran + `price_tiers[]`.
  Future<ApiEnvelope<OfferModel>> offerDetail(int id) {
    return _one(
      path: '/offers/$id',
      fromJson: OfferModel.fromJson,
      context: 'GET /offers/$id',
    );
  }

  /// `GET /search` — hasilnya penawaran beserta info toko dan estimasi ongkir.
  ///
  /// [zoneId] menyembunyikan penawaran dari toko yang tidak melayani zona itu
  /// (CRT-11). [needsTaxInvoice] memprioritaskan toko PKP di urutan hasil.
  ///
  /// `meta` membawa `count` dan `keyword`; pencarian tanpa hasil sudah dicatat
  /// server sendiri (SRC-05), app tidak perlu melakukan apa pun.
  Future<ApiEnvelope<List<OfferModel>>> search(
    String q, {
    int? zoneId,
    bool? needsTaxInvoice,
  }) {
    return _list(
      path: '/search',
      query: {
        'q': q,
        if (zoneId != null) 'zone_id': zoneId,
        if (needsTaxInvoice == true) 'needs_tax_invoice': 1,
      },
      fromJson: OfferModel.fromJson,
      context: 'GET /search',
    );
  }

  // --- Pembantu ------------------------------------------------------------

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

  Future<ApiEnvelope<T>> _one<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    required String context,
  }) async {
    try {
      final response = await _dio.get<dynamic>(path);
      return parseEnvelope(
        response,
        (raw) => fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }
}
