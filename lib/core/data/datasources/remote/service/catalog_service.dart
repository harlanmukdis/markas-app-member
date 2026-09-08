import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/domain/model/catalog/brand_model.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/model/review/review_model.dart';
import 'package:navy_wear/util/json_converters.dart';

/// Panggilan HTTP untuk katalog: kategori, SKU master, penawaran, pencarian.
/// Urutan hasil `GET /offers` (parameter `sort`, backend v2.2).
enum OfferSort {
  /// Terbaru.
  latest('latest'),

  /// Total qty terjual sepanjang waktu — agregat nyata dari sub-order
  /// `SELESAI`, bukan skor karangan.
  popular('popular'),

  /// Qty terjual 30 hari terakhir.
  trending('trending');

  const OfferSort(this.wireValue);

  final String wireValue;
}

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

  /// Cache penawaran **lengkap** (yang sudah punya `price_tiers`) per id.
  ///
  /// Dibutuhkan karena bentuk LIST dari `/offers` tidak memuat `price_tiers`
  /// sama sekali — lihat [withPriceTiers].
  final Map<int, OfferModel> _offerCache = {};

  /// Kosongkan saat pull-to-refresh, supaya user punya cara memaksa data baru.
  void clearCache() {
    _skuCache.clear();
    _offerCache.clear();
  }

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

  /// Beberapa SKU sekaligus.
  ///
  /// Sejak backend v2.4 memakai `GET /sku-master?ids=` — **satu** panggilan,
  /// bukan satu per id dalam batch seperti sebelumnya. Yang sudah ada di
  /// cache detail dipakai apa adanya supaya `units[]`-nya tidak hilang.
  Future<Map<int, SkuBriefModel>> skusByIds(Iterable<int> ids) async {
    final wanted = ids.toSet();
    if (wanted.isEmpty) return const {};

    final fromCache = <int, SkuBriefModel>{
      for (final id in wanted)
        if (_skuCache[id] != null)
          id: SkuBriefModel(
            id: id,
            name: _skuCache[id]!.name,
            baseUnit: _skuCache[id]!.baseUnit,
            weightKg: _skuCache[id]!.weightKg,
          ),
    };

    final missing = wanted.difference(fromCache.keys.toSet());
    if (missing.isEmpty) return fromCache;

    try {
      final fetched = await skuBriefs(missing);
      return {...fromCache, ...fetched.data};
    } on ApiException {
      // Nama SKU yang gagal diambil membuat kartu memakai label cadangan,
      // bukan menggagalkan seluruh daftar.
      return fromCache;
    }
  }

  /// `GET /offers` — penawaran **ACTIVE**, disaring per SKU, per toko, atau
  /// per kategori.
  ///
  /// > **Perhatian: hasilnya TIDAK memuat `price_tiers`.** Sudah diverifikasi
  /// > ke backend — bentuk list mengembalikan `price_tiers: []` untuk semua
  /// > penawaran, sementara `price_tiers` hanya terisi di `GET /offers/{id}`.
  /// > Menampilkan kartu produk langsung dari hasil ini membuat semua harga
  /// > tampil "belum tersedia". Lengkapi dengan [withPriceTiers].
  /// >
  /// > Info toko dan ongkir (`seller_name`, `ongkir_mulai_dari`) juga tidak
  /// > ada di sini — hanya `GET /search` yang membawanya.
  ///
  /// Tanpa filter apa pun, endpoint ini mengembalikan katalog lengkap —
  /// itu yang dipakai Home untuk daftar "Semua" tanpa perlu kata kunci.
  ///
  /// > **DIPAGINASI sejak backend v2.4**, dan ini **gagal secara senyap**:
  /// > sebelumnya seluruh penawaran aktif dikembalikan sekaligus, sekarang
  /// > hanya [perPage] pertama (default server 20, maksimum 100) **tanpa
  /// > error apa pun**. Kode yang menganggap `data` berisi daftar lengkap
  /// > cuma menampilkan lebih sedikit produk dan tidak ada yang gagal.
  /// >
  /// > `meta` membawa `{page, per_page, total, total_pages}` — pakai itu
  /// > untuk paginasi, jangan pernah menganggap satu respons sudah lengkap.
  /// >
  /// > Paginasi ini **hanya untuk pemanggil pembeli/publik**. Token berperan
  /// > `SEL` masuk ke cabang lain yang tidak dipaginasi dan tidak membawa
  /// > `meta` — tidak relevan untuk aplikasi member, tapi jangan sampai pola
  /// > ini disalin apa adanya ke aplikasi toko.
  Future<ApiEnvelope<List<OfferModel>>> offers({
    int? skuId,
    int? sellerId,
    int? categoryId,
    int? brandId,
    int? priceMin,
    int? priceMax,
    int? minRating,
    OfferSort? sort,
    int? page,
    int? perPage,
  }) {
    return _list(
      path: '/offers',
      query: {
        if (skuId != null) 'sku_id': skuId,
        if (sellerId != null) 'seller_id': sellerId,
        if (categoryId != null) 'category_id': categoryId,
        if (brandId != null) 'brand_id': brandId,
        if (priceMin != null) 'price_min': priceMin,
        if (priceMax != null) 'price_max': priceMax,
        if (minRating != null) 'min_rating': minRating,
        if (sort != null) 'sort': sort.wireValue,
        if (page != null) 'page': page,
        if (perPage != null) 'per_page': perPage,
      },
      fromJson: OfferModel.fromJson,
      context: 'GET /offers',
    );
  }

  /// `GET /offers/prices?ids=` — harga tier `RETAIL` termurah per penawaran,
  /// **satu panggilan untuk banyak id** (backend v2.4).
  ///
  /// Ini yang menggantikan pelengkapan harga lewat `GET /offers/{id}` satu
  /// per satu. Definisi harganya sama dengan yang dipakai `facets()` dan
  /// filter `price_min`/`price_max`, jadi angka di kartu konsisten dengan
  /// filternya.
  ///
  /// Respons berbentuk objek ber-key `offer_id`, bukan array.
  Future<ApiEnvelope<Map<int, int>>> prices(Iterable<int> offerIds) async {
    const context = 'GET /offers/prices';
    final ids = offerIds.toSet().toList();
    if (ids.isEmpty) return const ApiEnvelope(data: {}, statusCode: 200);

    try {
      final response = await _dio.get<dynamic>(
        '/offers/prices',
        queryParameters: {'ids': ids.join(',')},
      );
      return parseEnvelope(
        response,
        (raw) {
          if (raw is! Map) return <int, int>{};
          return {
            for (final e in raw.entries)
              if (asIntOrNull(e.key) != null)
                asIntOrNull(e.key)!: asInt(e.value),
          };
        },
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /sku-master?ids=` — nama & satuan dasar SKU, **satu panggilan untuk
  /// banyak id** (backend v2.4).
  ///
  /// Hasilnya [SkuBriefModel], **bukan** [SkuModel]: respons bulk tidak
  /// membawa `units[]`. Untuk pemilih satuan tetap butuh [skuDetail].
  Future<ApiEnvelope<Map<int, SkuBriefModel>>> skuBriefs(
    Iterable<int> skuIds,
  ) async {
    const context = 'GET /sku-master?ids=';
    final ids = skuIds.toSet().toList();
    if (ids.isEmpty) return const ApiEnvelope(data: {}, statusCode: 200);

    try {
      final response = await _dio.get<dynamic>(
        '/sku-master',
        queryParameters: {'ids': ids.join(',')},
      );
      return parseEnvelope(
        response,
        (raw) {
          if (raw is! Map) return <int, SkuBriefModel>{};
          return {
            for (final e in raw.entries)
              if (asIntOrNull(e.key) != null && e.value is Map)
                asIntOrNull(e.key)!: SkuBriefModel.fromJson(
                  Map<String, dynamic>.from(e.value as Map),
                ),
          };
        },
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /offers/flash-sale` — penawaran dengan harga coret **terverifikasi**.
  ///
  /// Tidak ada hitung mundur di sini dan tidak boleh dikarang: harga coret
  /// hanya dianggap sah kalau pernah berlaku ≥14 hari, jadi ini bukan promo
  /// kilat berbatas waktu.
  Future<ApiEnvelope<List<OfferModel>>> flashSale({int limit = 10}) {
    return _list(
      path: '/offers/flash-sale',
      query: {'limit': limit},
      fromJson: OfferModel.fromJson,
      context: 'GET /offers/flash-sale',
    );
  }

  /// `GET /offers/best-sellers` — membawa `qty_sold` nyata dari sub-order
  /// yang sudah `SELESAI`.
  Future<ApiEnvelope<List<OfferModel>>> bestSellers({int limit = 10}) {
    return _list(
      path: '/offers/best-sellers',
      query: {'limit': limit},
      fromJson: OfferModel.fromJson,
      context: 'GET /offers/best-sellers',
    );
  }

  /// `GET /brands`.
  Future<ApiEnvelope<List<BrandModel>>> brands() {
    return _list(
      path: '/brands',
      fromJson: BrandModel.fromJson,
      context: 'GET /brands',
    );
  }

  /// `GET /offers/facets?category_id=` — bahan sidebar filter.
  Future<ApiEnvelope<OfferFacetsModel>> facets({int? categoryId}) async {
    final context = 'GET /offers/facets'
        '${categoryId == null ? '' : '?category_id=$categoryId'}';
    try {
      final response = await _dio.get<dynamic>(
        '/offers/facets',
        queryParameters: {if (categoryId != null) 'category_id': categoryId},
      );
      return parseEnvelope(
        response,
        (raw) =>
            OfferFacetsModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /offers/reviews-summary?ids=` — rating untuk **banyak** penawaran
  /// dalam satu panggilan.
  ///
  /// Ini yang dipakai grid/list produk. Memanggil `/offers/{id}/reviews` per
  /// kartu berarti satu request per kartu, dan grid Home sudah membayar
  /// mahal untuk melengkapi harga (lihat catatan pada [offers]).
  ///
  /// Respons berbentuk objek ber-key `offer_id`, bukan array.
  Future<ApiEnvelope<Map<int, ReviewSummaryModel>>> reviewsSummary(
    Iterable<int> offerIds,
  ) async {
    const context = 'GET /offers/reviews-summary';
    final ids = offerIds.toSet().toList();
    if (ids.isEmpty) {
      return const ApiEnvelope(data: {}, statusCode: 200);
    }

    try {
      final response = await _dio.get<dynamic>(
        '/offers/reviews-summary',
        queryParameters: {'ids': ids.join(',')},
      );
      return parseEnvelope(
        response,
        (raw) {
          if (raw is! Map) return <int, ReviewSummaryModel>{};
          return {
            for (final entry in raw.entries)
              if (asIntOrNull(entry.key) != null && entry.value is Map)
                asIntOrNull(entry.key)!: ReviewSummaryModel.fromJson(
                  Map<String, dynamic>.from(entry.value as Map),
                ),
          };
        },
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /offers/{id}/reviews` — ringkasan + daftar ulasan.
  Future<ApiEnvelope<ReviewPageModel>> reviews(
    int offerId, {
    int limit = 20,
    int offset = 0,
  }) async {
    final context = 'GET /offers/$offerId/reviews';
    try {
      final response = await _dio.get<dynamic>(
        '/offers/$offerId/reviews',
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return parseEnvelope(
        response,
        (raw) => ReviewPageModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /offers/{id}/reviews`.
  Future<ApiEnvelope<dynamic>> postReview(
    int offerId, {
    required int rating,
    String? comment,
  }) async {
    assert(rating >= 1 && rating <= 5, 'rating harus 1..5');
    final context = 'POST /offers/$offerId/reviews';
    try {
      final response = await _dio.post<dynamic>(
        '/offers/$offerId/reviews',
        data: {
          'rating': rating,
          if (comment != null && comment.trim().isNotEmpty)
            'comment': comment.trim(),
        },
      );
      return parseEnvelope(response, (raw) => raw, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// Melengkapi penawaran dengan **harga termurah** lewat
  /// `GET /offers/prices?ids=` — satu panggilan untuk seluruh daftar.
  ///
  /// Menggantikan pendekatan sebelumnya yang memanggil `GET /offers/{id}`
  /// sekali per penawaran. Dengan katalog 188 penawaran, cara lama berarti
  /// puluhan request untuk satu layar dan memaksa daftar dibatasi 24 item;
  /// sekarang tidak perlu dibatasi lagi.
  ///
  /// Yang dihasilkan adalah **satu tier sintetis** berisi harga termurah,
  /// bukan seluruh `price_tiers` — endpoint bulk hanya mengembalikan angka.
  /// Untuk tabel harga bertingkat lengkap tetap butuh [offerDetail].
  ///
  /// Penawaran yang tidak punya harga dikembalikan apa adanya, bukan
  /// dihilangkan dari daftar.
  Future<List<OfferModel>> withPriceTiers(List<OfferModel> offers) async {
    final needsPrice =
        offers.where((o) => o.priceTiers.isEmpty).map((o) => o.id).toSet();
    if (needsPrice.isEmpty) return offers;

    Map<int, int> prices;
    try {
      prices = (await this.prices(needsPrice)).data;
    } on ApiException {
      // Harga gagal diambil bukan alasan menghilangkan produk dari daftar;
      // kartunya tampil tanpa harga.
      return offers;
    }

    return offers.map((offer) {
      if (offer.priceTiers.isNotEmpty) return offer;
      final price = prices[offer.id];
      if (price == null) return offer;
      return offer.copyWith(
        priceTiers: [
          PriceTierModel(
            id: -offer.id,
            offerId: offer.id,
            segment: 'RETAIL',
            minQty: 1,
            price: price,
          ),
        ],
      );
    }).toList();
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
