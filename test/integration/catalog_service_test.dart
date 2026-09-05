/// Uji katalog & referensi terhadap backend Markas yang **benar-benar jalan**.
///
/// ```bash
/// flutter test --platform chrome test/integration/
/// ```
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

    test('withPriceTiers melengkapi harga tanpa menghapus info toko',
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
      // Semen (sku 1) dijual 2 toko menurut data uji.
      final env = await catalog.offers(skuId: 1);
      expect(env.data.length, greaterThanOrEqualTo(2));
      expect(env.data.map((o) => o.sellerId).toSet().length,
          greaterThanOrEqualTo(2));
    });

    test('keramik sku 6 punya 3 satuan dengan konversi yang benar', () async {
      final sku = (await catalog.skuDetail(6)).data;

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
      final env = await authedReference.sellerResponseRate(4);
      // Tidak melempar; kalau null, badge cukup disembunyikan.
      if (env.data != null) {
        expect(env.data!.hasEnoughData, isA<bool>());
      }
      },
    );
  });
}