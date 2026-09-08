/// Uji katalog & referensi terhadap backend Markas yang **benar-benar jalan**.
///
/// ```bash
/// flutter test --platform chrome test/integration/
/// ```
///
/// Id di sini mengikuti data uji **backend v2.2** (database dibangun ulang,
/// sehingga seluruh id berubah dari sebelumnya):
///
/// * `sku 44` — keramik dengan 3 satuan (pcs 1 / dus 25 / m² 6,25)
/// * `sku 43..46` — SKU jangkar, masing-masing dijual **dua** toko
/// * `seller 1` / `seller 2` — Toko dan Distributor, keduanya `VERIFIED`
///
/// Peta autentikasi, dibuktikan lewat probe langsung (dokumen API tidak
/// menyebutnya karena penanda emoji-nya hilang saat di-paste):
///
/// * **Publik** — `categories`, `sku-master`, `offers`, `search`, `zones`,
///   `fleet-types`, `sellers/directory`. Bisa dites di native maupun web.
/// * **Butuh token** — `config/parameters`, `chat/seller_response_rate`.
///   Keduanya terkena bug case-sensitivity header `Authorization`, jadi
///   di-skip di native dan hanya jalan di `--platform chrome`.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/config/env/env.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data/datasources/remote/service/catalog_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/reference_service.dart';
import 'package:navy_wear/core/domain/model/reference/reference_models.dart';

void main() {
  late CatalogService catalog;
  late ReferenceService reference;

  /// Untuk endpoint yang butuh login.
  late ReferenceService authedReference;

  setUp(() async {
    // setUp, bukan setUpAll: tiap test dapat cache bersih supaya pengujian
    // cache tidak bocor antar test.
    catalog = CatalogService(DioClient.createBare(Env.apiBaseUrl));
    reference = ReferenceService(DioClient.createBare(Env.apiBaseUrl));

    final authedDio = DioClient.createBare(Env.apiBaseUrl);
    if (kIsWeb) {
      final session = await AuthService(DioClient.createBare(Env.apiBaseUrl))
          .login(phone: '081100000001', password: 'password123');
      authedDio.options.headers['Authorization'] =
          'Bearer ${session.data.accessToken}';
    }
    authedReference = ReferenceService(authedDio);
  });

  group('kategori', () {
    test('level 1 terisi dan jalur-nya dikenali', () async {
      final env = await catalog.categories();

      expect(env.data, isNotEmpty);
      final semen = env.data.firstWhere((c) => c.name.contains('Semen'));

      expect(semen.id, greaterThan(0));
      expect(semen.isRoot, isTrue);
      expect(semen.isMasterJalur, isTrue);

      // is_risky dikirim sebagai string "1"/"0", bukan boolean.
      expect(semen.isRisky, isA<bool>());

      // v2.2: kolom waktu bernama created_date, bukan created_at.
      expect(semen.createdDate, isNotNull);
    });

    test('detail memuat children dan attributes tanpa melempar', () async {
      final env = await catalog.categoryDetail(1);
      expect(env.data.id, 1);
      expect(env.data.children, isA<List>());
      expect(env.data.attributes, isA<List>());
    });
  });

  group('SKU master', () {
    test('detail mem-parse units[] dengan faktor konversi desimal', () async {
      final env = await catalog.skuDetail(1);
      final sku = env.data;

      expect(sku.name, isNotEmpty);
      expect(sku.units, isNotEmpty);

      // conversion_factor_to_base dikirim "1.0000" — desimal, bukan int.
      final unit = sku.defaultSellUnit!;
      expect(unit.unitName, isNotEmpty);
      expect(unit.conversionFactorToBase, isA<double>());
      expect(unit.toBaseQty(3), unit.conversionFactorToBase * 3);

      // weight_kg dikirim "40.000".
      expect(sku.weightKg, isNotNull);
      expect(sku.weightKg, isA<double>());
    });

    test('cache mencegah request kedua untuk id yang sama', () async {
      final first = await catalog.skuDetail(1);
      final second = await catalog.skuDetail(1);

      // Instance identik = dijawab dari cache, bukan request baru.
      expect(identical(first.data, second.data), isTrue);

      final refreshed = await catalog.skuDetail(1, forceRefresh: true);
      expect(identical(first.data, refreshed.data), isFalse);
    });

    test('skusByIds melewati id yang tidak ada tanpa menggagalkan batch',
        () async {
      final result = await catalog.skusByIds([1, 999999]);
      expect(result.containsKey(1), isTrue);
      expect(result.containsKey(999999), isFalse);
    });

    test('tanpa q dan tanpa category_id ditolak 422', () async {
      // assert() hanya aktif di debug, jadi jalur servernya tetap diuji.
      try {
        await catalog.skus(q: '');
        fail('seharusnya melempar');
      } on ApiException catch (e) {
        expect(e.error.statusCode, 422);
      } on AssertionError {
        // Assert lokal menangkapnya lebih dulu — juga hasil yang benar.
      }
    });
  });

  group('penawaran', () {
    test('detail mem-parse price_tiers dan photos_json bersarang', () async {
      final env = await catalog.offerDetail(1);
      final offer = env.data;

      expect(offer.isActive, isTrue);
      expect(offer.priceTiers, isNotEmpty);

      // photos_json adalah String berisi JSON, bukan array.
      expect(offer.photos, isNotEmpty);
      expect(offer.primaryPhotoUrl, startsWith('http'));

      // min_order_qty dikirim "5.0000".
      expect(offer.minOrderQty, isA<double>());
      expect(offer.minOrderQty, greaterThan(0));
    });

    test('tier PROJECT disembunyikan dari pembeli retail', () async {
      final offer = (await catalog.offerDetail(1)).data;

      final retail = offer.visibleTiers(isB2B: false);
      final b2b = offer.visibleTiers(isB2B: true);

      expect(retail.any((t) => t.isProjectTier), isFalse,
          reason: 'menampilkan tier PROJECT ke retail = membocorkan harga '
              'grosir (aturan PRD-06)');
      expect(b2b.length, greaterThanOrEqualTo(retail.length));

      // Harga "mulai dari" untuk retail tidak boleh berasal dari tier PROJECT.
      final lowestRetail = offer.lowestVisiblePrice(isB2B: false);
      final projectPrices =
          offer.priceTiers.where((t) => t.isProjectTier).map((t) => t.price);
      if (projectPrices.isNotEmpty) {
        expect(lowestRetail, isNot(projectPrices.reduce((a, b) => a < b ? a : b)));
      }
    });

    test('tierFor memilih minQty tertinggi yang masih terpenuhi', () async {
      final offer = (await catalog.offerDetail(1)).data;
      final retailTiers = offer.visibleTiers(isB2B: false)
        ..sort((a, b) => a.minQty.compareTo(b.minQty));

      final t = offer.tierFor(qty: retailTiers.first.minQty, segment: 'RETAIL');
      expect(t, isNotNull);
      expect(t!.minQty, lessThanOrEqualTo(retailTiers.first.minQty));

      // Qty di bawah tier terendah tidak punya tier yang berlaku.
      expect(offer.tierFor(qty: 0, segment: 'RETAIL'), isNull);
    });
  });

  group('pencarian', () {
    test('mengembalikan info toko + estimasi ongkir, dan meta keyword',
        () async {
      final env = await catalog.search('semen');

      expect(env.data, isNotEmpty);
      expect(env.meta['keyword'], 'semen');
      expect(env.meta['count'], isNotNull);

      final hit = env.data.first;
      expect(hit.sellerName, isNotEmpty);

      // ongkir_is_estimate WAJIB dihormati UI: ini "ongkir mulai dari",
      // bukan angka final (aturan SRC-04).
      expect(hit.ongkirIsEstimate, isTrue);
      expect(hit.ongkirMulaiDari, isNotNull);
      expect(hit.availableStock, isNotNull);
    });

    test('kata tanpa hasil membalas list kosong, bukan error', () async {
      final env = await catalog.search('zzzzzzzznotfound');
      expect(env.data, isEmpty);
      expect(env.meta['count'], 0);
    });
  });

  group('batasan: endpoint list tidak membawa harga', () {
    test('/offers?category_id= mengembalikan price_tiers KOSONG', () async {
      final env = await catalog.offers(categoryId: 1);

      expect(env.data, isNotEmpty,
          reason: 'category_id memang didukung — satu panggilan cukup');

      // Ini batasan backend yang sudah diverifikasi. Kalau suatu hari BE
      // menyertakan harga di respons list, test ini akan GAGAL — dan itu
      // sinyal yang benar: pelengkapan withPriceTiers bisa dihapus.
      expect(
        env.data.every((o) => o.priceTiers.isEmpty),
        isTrue,
        reason: 'kalau ini gagal, BE sudah menyertakan harga di list — '
            'hapus withPriceTiers dan test ini',
      );
    });

    test('/search juga tanpa harga, tapi PUNYA info toko dan ongkir',
        () async {
      final env = await catalog.search('semen');
      expect(env.data, isNotEmpty);

      expect(env.data.every((o) => o.priceTiers.isEmpty), isTrue);

      // Yang ini justru ada — jadi hanya harga yang perlu dilengkapi.
      expect(env.data.first.sellerName, isNotEmpty);
      expect(env.data.first.ongkirMulaiDari, isNotNull);
    });

    test('withPriceTiers memakai SATU panggilan bulk, bukan N detail',
        () async {
      final env = await catalog.search('semen');
      final enriched = await catalog.withPriceTiers(env.data);

      expect(enriched, hasLength(env.data.length));
      expect(
        enriched.any((o) => o.priceTiers.isNotEmpty),
        isTrue,
        reason: 'tanpa ini semua kartu produk menampilkan '
            '"Harga belum tersedia"',
      );

      // Penggabungan, bukan penimpaan: info toko dari /search harus selamat
      // karena endpoint detail tidak mengembalikannya.
      final first = enriched.first;
      expect(first.sellerName, isNotEmpty);
      expect(first.ongkirMulaiDari, isNotNull);
      expect(first.lowestVisiblePrice(isB2B: false), isNotNull);
    });

    test('satu SKU dijual beberapa toko — inti perbandingan harga', () async {
      // SKU jangkar 43..46 masing-masing dijual dua toko (data uji v2.2).
      final env = await catalog.offers(skuId: 44);
      expect(env.data.length, greaterThanOrEqualTo(2));
      expect(env.data.map((o) => o.sellerId).toSet().length,
          greaterThanOrEqualTo(2));
    });

    test('keramik sku 44 punya 3 satuan dengan konversi yang benar', () async {
      final sku = (await catalog.skuDetail(44)).data;

      expect(sku.units.length, 3);
      final byName = {for (final u in sku.units) u.unitName: u};
      expect(byName['pcs']!.conversionFactorToBase, 1);
      expect(byName['dus']!.conversionFactorToBase, 25);
      expect(byName['m2']!.conversionFactorToBase, 6.25);

      // "1 dus = 25 pcs = 4 m²" — bahan pemilih satuan.
      final pcsPerDus = byName['dus']!.conversionFactorToBase;
      final pcsPerM2 = byName['m2']!.conversionFactorToBase;
      expect(pcsPerDus / pcsPerM2, 4);
    });
  });

  group('fitur v2.2', () {
    test('reviews-summary mengembalikan objek ber-key offer_id', () async {
      // Bentuknya objek, BUKAN array — kalau di-parse sebagai list, seluruh
      // rating di grid hilang tanpa error.
      final env = await catalog.reviewsSummary([65, 67, 71]);

      expect(env.data.keys, containsAll([65, 67, 71]));
      expect(env.data[65]!.reviewCount, greaterThan(0));
      expect(env.data[65]!.avgRating, greaterThan(0));
      expect(env.data[65]!.hasReviews, isTrue);
    });

    test('penawaran tanpa ulasan dibedakan dari rating nol', () async {
      final env = await catalog.reviewsSummary([71]);
      final summary = env.data[71]!;

      // Backend mengirim avg_rating "0.00" untuk yang belum diulas.
      // Menampilkannya sebagai bintang 0 membuat produk baru terlihat buruk
      // padahal belum dinilai siapa pun.
      expect(summary.reviewCount, 0);
      expect(summary.avgRating, 0);
      expect(summary.hasReviews, isFalse);
    });

    test('id kosong tidak memicu request sama sekali', () async {
      final env = await catalog.reviewsSummary(const []);
      expect(env.data, isEmpty);
    });

    test('daftar ulasan membawa ringkasan dan nama pembeli', () async {
      final env = await catalog.reviews(65);

      expect(env.data.summary.reviewCount, greaterThan(0));
      expect(env.data.items, isNotEmpty);

      final first = env.data.items.first;
      expect(first.rating, inInclusiveRange(1, 5));
      expect(first.displayName, isNotEmpty);
      // v2.2: kolom waktu bernama created_date.
      expect(first.createdDate, isNotNull);
    });

    test('brands membawa penanda sertifikasi dan jumlah penawaran', () async {
      final env = await catalog.brands();

      expect(env.data, isNotEmpty);
      // is_certified dikirim "1"/"0", offer_count sebagai string.
      expect(env.data.any((b) => b.isCertified), isTrue);
      expect(env.data.every((b) => b.offerCount >= 0), isTrue);
    });

    test('facets memberi rentang harga, sebaran rating, dan merek', () async {
      final env = await catalog.facets(categoryId: 1);
      final f = env.data;

      expect(f.hasPriceRange, isTrue);
      expect(f.priceMax, greaterThan(f.priceMin!));
      expect(f.brands, isNotEmpty);

      // rating_counts KUMULATIF (">= N"), bukan histogram: nilai di "4"
      // sudah mencakup yang berating 5. Menggambarnya sebagai batang
      // histogram akan menyesatkan.
      expect(f.countAtLeast(4), greaterThanOrEqualTo(f.countAtLeast(5)));
      expect(f.countAtLeast(1), greaterThanOrEqualTo(f.countAtLeast(4)));
    });

    test('filter dan sortir baru pada /offers diterima server', () async {
      final byBrand = await catalog.offers(brandId: 4);
      expect(byBrand.data, isA<List>());

      final byPrice = await catalog.offers(priceMin: 60000, priceMax: 80000);
      expect(byPrice.data, isA<List>());

      for (final sort in OfferSort.values) {
        final env = await catalog.offers(sort: sort);
        expect(env.data, isNotEmpty, reason: 'sort=${sort.wireValue}');
      }
    });

    test('flash-sale dan best-sellers terjangkau', () async {
      expect((await catalog.flashSale(limit: 5)).data, isA<List>());

      final best = await catalog.bestSellers(limit: 5);
      expect(best.data, isA<List>());
    });
  });

  group('v2.4: paginasi & bulk lookup', () {
    test('GET /offers DIPAGINASI — meta wajib dibaca', () async {
      final env = await catalog.offers();

      // Sebelum v2.4 endpoint ini mengembalikan seluruh penawaran aktif.
      // Sekarang default 20 per halaman, DAN TIDAK ADA ERROR APA PUN kalau
      // kode memperlakukannya sebagai daftar lengkap — katalog cuma terlihat
      // lebih sedikit. Test ini memaku keberadaan meta supaya kegagalan
      // senyap itu tidak bisa terulang.
      expect(env.meta['page'], isNotNull);
      expect(env.meta['per_page'], isNotNull);
      expect(env.meta['total'], isNotNull);
      expect(env.meta['total_pages'], isNotNull);

      expect(env.data.length, lessThanOrEqualTo(20));
      expect(env.meta['total'], greaterThan(env.data.length),
          reason: 'satu respons TIDAK berisi katalog lengkap');
    });

    test('page dan per_page dihormati server', () async {
      final first = await catalog.offers(page: 1, perPage: 5);
      expect(first.data, hasLength(5));
      expect(first.meta['per_page'], 5);

      final second = await catalog.offers(page: 2, perPage: 5);
      expect(second.meta['page'], 2);

      // Halaman berbeda harus berisi penawaran berbeda.
      final firstIds = first.data.map((o) => o.id).toSet();
      final secondIds = second.data.map((o) => o.id).toSet();
      expect(firstIds.intersection(secondIds), isEmpty);
    });

    test('GET /offers/prices mengembalikan harga ber-key offer_id', () async {
      final page = await catalog.offers(perPage: 5);
      final ids = page.data.map((o) => o.id).toList();

      final env = await catalog.prices(ids);

      expect(env.data.keys, containsAll(ids));
      expect(env.data.values.every((p) => p > 0), isTrue);
    });

    test('GET /sku-master?ids= mengembalikan nama massal', () async {
      final env = await catalog.skuBriefs([1, 2]);

      expect(env.data.keys, containsAll([1, 2]));
      expect(env.data[1]!.name, isNotEmpty);
      expect(env.data[1]!.baseUnit, isNotEmpty);
      // Respons bulk TIDAK membawa units[] — itu sebabnya SkuBriefModel
      // dipisah dari SkuModel.
      expect(env.data[1]!.weightKg, isNotNull);
    });

    test('id kosong tidak memicu request pada kedua endpoint bulk', () async {
      expect((await catalog.prices(const [])).data, isEmpty);
      expect((await catalog.skuBriefs(const [])).data, isEmpty);
    });

    test('satu halaman grid butuh 4 panggilan, bukan 3xN', () async {
      // Pola yang disarankan tim backend, diuji utuh.
      final page = await catalog.offers(categoryId: 1, page: 1, perPage: 10);
      final offerIds = page.data.map((o) => o.id).toList();
      final skuIds = page.data
          .where((o) => o.skuId != null)
          .map((o) => o.skuId!)
          .toList();

      final prices = (await catalog.prices(offerIds)).data;
      final names = (await catalog.skuBriefs(skuIds)).data;
      final ratings = (await catalog.reviewsSummary(offerIds)).data;

      // Empat panggilan total, dan cukup untuk merender seluruh kartu.
      for (final offer in page.data) {
        expect(prices[offer.id], isNotNull);
        if (offer.skuId != null && !offer.isFreeform) {
          expect(names[offer.skuId!]?.name, isNotEmpty);
        }
        expect(ratings[offer.id], isNotNull);
      }
    });

    test('fleet-types membawa kapasitas & rank (jangan di-hardcode)',
        () async {
      final env = await reference.fleetTypes();
      final byCode = {for (final f in env.data) f.code: f};

      expect(byCode['MOTOR']!.maxPayloadKg, isNotNull);
      expect(byCode['TRONTON']!.maxPayloadKg,
          greaterThan(byCode['MOTOR']!.maxPayloadKg!));
      expect(byCode['MOTOR']!.sizeRank, lessThan(byCode['TRONTON']!.sizeRank!));
    });

    test('penawaran membawa penanda sampel', () async {
      final env = await catalog.offers(perPage: 50);
      // is_sample dikirim "1"/"0"; yang penting terbaca sebagai bool dan
      // batas qty-nya ikut terhitung.
      for (final o in env.data) {
        expect(o.isSample, isA<bool>());
        expect(o.maxSelectableQty, o.isSample ? 2 : isNull);
      }
    });
  });

  group('referensi', () {
    test('zones hierarkis dan di-cache', () async {
      final env = await reference.zones();
      expect(env.data, isNotEmpty);
      expect(env.data.any((z) => z.isProvince), isTrue);

      final again = await reference.zones();
      expect(identical(env.data, again.data), isTrue);
    });

    test('fleet-types berkunci code, bukan id', () async {
      final env = await reference.fleetTypes();
      expect(env.data, isNotEmpty);
      expect(env.data.map((f) => f.code), contains('CDD'));
      expect(env.data.firstWhere((f) => f.code == 'CDD').capacityKgDesc,
          isNotEmpty);
    });

    test(
      'config parameter dibaca sebagai angka, bukan string',
      skip: kIsWeb
          ? false
          : 'butuh token; diblokir bug header Authorization di native',
      () async {
      final env = await authedReference.configParameters(ConfigGroup.ambang);
      expect(env.data, isNotEmpty);

      final p = env.data.first;
      expect(p.paramGroup, ConfigGroup.ambang);
      // param_value dikirim "25000000" — harus terbaca sebagai angka supaya
      // ambang order besar tidak perlu di-hardcode di app.
      expect(p.asInt, greaterThan(0));
      },
    );

    test('direktori toko hanya yang VERIFIED, meta memuat paginasi', () async {
      final env = await reference.sellerDirectory(limit: 5);
      expect(env.data, isNotEmpty);
      expect(env.meta['limit'], 5);
      expect(env.data.first.name, isNotEmpty);
    });

    test(
      'response rate boleh null kalau belum ada data',
      skip: kIsWeb
          ? false
          : 'butuh token; diblokir bug header Authorization di native',
      () async {
      final env = await authedReference.sellerResponseRate(1);
      // Tidak melempar; kalau null, badge cukup disembunyikan.
      if (env.data != null) {
        expect(env.data!.hasEnoughData, isA<bool>());
      }
      },
    );
  });
}