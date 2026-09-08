/// Uji alur transaksi terhadap backend Markas **v2.2 yang benar-benar jalan**.
///
/// ```bash
/// flutter test --platform chrome test/integration/
/// ```
///
/// Seluruh endpoint di sini **butuh token**, jadi di native semuanya terkena
/// bug case-sensitivity header `Authorization` dan di-skip.
///
/// Test ini **mengubah data** (menambah/mengosongkan keranjang, wishlist).
/// Semuanya dibersihkan kembali di `tearDown`, dan tidak ada yang membuat
/// order — checkout sengaja tidak dipanggil supaya tabel pesanan tidak
/// bertambah setiap kali test dijalankan.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/config/env/env.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data/datasources/remote/service/address_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/cart_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/order_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/wishlist_service.dart';

const _phone = '081100000001';
const _password = 'password123';

/// Penawaran dari dua toko berbeda (SKU jangkar 43 di data uji v2.2).
const _offerA = 65;
const _offerB = 66;

void main() {
  late CartService cart;
  late AddressService address;
  late OrderService order;
  late WishlistService wishlist;

  setUp(() async {
    final dio = DioClient.createBare(Env.apiBaseUrl);
    if (kIsWeb) {
      final session = await AuthService(DioClient.createBare(Env.apiBaseUrl))
          .login(phone: _phone, password: _password);
      dio.options.headers['Authorization'] =
          'Bearer ${session.data.accessToken}';
    }
    cart = CartService(dio);
    address = AddressService(dio);
    order = OrderService(dio);
    wishlist = WishlistService(dio);
  });

  tearDown(() async {
    if (!kIsWeb) return;
    // Kembalikan keranjang ke keadaan semula supaya test bisa diulang.
    try {
      await cart.clear();
    } catch (_) {}
  });

  const skipNative =
      'butuh token; diblokir bug header Authorization di native';

  group('alamat', () {
    test('daftar alamat membawa koordinat dan penanda default',
        skip: kIsWeb ? false : skipNative, () async {
      final env = await address.list();

      expect(env.data, isNotEmpty);
      final first = env.data.first;

      // lat/lng dikirim sebagai string desimal ("-6.2383000").
      expect(first.lat, isA<double>());
      expect(first.hasCoordinates, isTrue,
          reason: 'alamat tanpa koordinat tidak bisa dipakai checkout');
      expect(first.shortAddress, contains(first.city));

      // v2.2: owner_type bernilai MEMBER (dokumen API menyebut USER).
      expect(first.ownerType, 'MEMBER');
      expect(first.createdDate, isNotNull);
    });
  });

  group('keranjang', () {
    test('keranjang KOSONG mengembalikan array, bukan objek',
        skip: kIsWeb ? false : skipNative, () async {
      await cart.clear();
      final env = await cart.view();

      // Ini jebakan yang paling mudah meledak: PHP menghasilkan `[]` untuk
      // array asosiatif KOSONG dan `{}` saat terisi. Model yang
      // mendeklarasikan Map langsung akan CastError tepat pada keadaan
      // pertama yang dilihat setiap user baru.
      expect(env.data.isEmpty, isTrue);
      expect(env.data.groupedBySeller, isEmpty);
      expect(env.data.cartId, isNotNull);
    });

    test('keranjang TERISI dikelompokkan per toko',
        skip: kIsWeb ? false : skipNative, () async {
      await cart.clear();
      await cart.add(offerId: _offerA, qty: 60);
      await cart.add(offerId: _offerB, qty: 60);

      final env = await cart.view();

      // Dua penawaran dari toko berbeda -> dua kelompok. Pengelompokan ini
      // bukan kosmetik: minimum order, ongkir, dan pembatalan berlaku per
      // toko.
      expect(env.data.sellerCount, 2);
      expect(env.data.allItems, hasLength(2));

      final item = env.data.allItems.first;
      expect(item.qty, 60);
      expect(item.minOrderQty, greaterThan(0));
      expect(item.isOfferInactive, isFalse);
    });

    test('menghapus satu baris tidak menyentuh baris lain',
        skip: kIsWeb ? false : skipNative, () async {
      await cart.clear();
      final added = await cart.add(offerId: _offerA, qty: 60);
      await cart.add(offerId: _offerB, qty: 60);

      await cart.remove(added.data.itemId);
      final env = await cart.view();

      expect(env.data.allItems, hasLength(1));
      expect(env.data.allItems.first.offerId, _offerB);
    });

    test('qty berdesimal dipertahankan server',
        skip: kIsWeb ? false : skipNative, () async {
      await cart.clear();
      await cart.add(offerId: _offerA, qty: 60.5);

      final env = await cart.view();
      // Pasir per m³ dan cat per liter bisa pecahan — kalau qty dibulatkan
      // di mana pun, pesanannya salah jumlah.
      expect(env.data.allItems.first.qty, 60.5);
    });
  });

  group('pesanan', () {
    test('daftar pesanan membawa status dan batas bayar',
        skip: kIsWeb ? false : skipNative, () async {
      final env = await order.list();

      expect(env.data, isNotEmpty);
      final statuses = env.data.map((o) => o.status).toSet();
      expect(statuses, isNotEmpty);

      final unpaid = env.data.where((o) => o.canPay).toList();
      if (unpaid.isNotEmpty) {
        expect(unpaid.first.paymentDeadline, isNotNull);
        expect(unpaid.first.grandTotal, greaterThan(0));
      }
    });

    test('detail pesanan membawa seluruh anaknya dalam SATU panggilan',
        skip: kIsWeb ? false : skipNative, () async {
      final list = await order.list();
      final withChildren = list.data.firstWhere(
        (o) => o.status == 'SELESAI',
        orElse: () => list.data.first,
      );

      final env = await order.detail(withChildren.id);
      final o = env.data;

      expect(o.subOrders, isNotEmpty,
          reason: 'GET /orders/{id} harus cukup untuk seluruh layar detail');

      final sub = o.subOrders.first;
      expect(sub.items, isNotEmpty);
      expect(sub.sellerId, greaterThan(0));

      // Harga di item adalah SNAPSHOT saat checkout — bukan harga terbaru.
      expect(sub.items.first.unitPrice, greaterThan(0));
      expect(sub.items.first.lineSubtotal, greaterThan(0));

      // unit_name_snapshot masih placeholder "unit" di backend: resolusi
      // satuan jual belum jalan di checkout.
      expect(sub.items.first.hasRealUnitName, isFalse);
    });

    test('bug jam 5 jam terbukti pada payment_deadline',
        skip: kIsWeb ? false : skipNative, () async {
      final list = await order.list();
      final unpaid = list.data.where((o) => o.canPay).toList();
      if (unpaid.isEmpty) return;

      final o = unpaid.first;
      final created = o.createdDate!;
      final deadline = o.paymentDeadline!;
      final hours = deadline.difference(created).inHours;

      // Batas bayar seharusnya 24 jam. Backend menyimpannya 19 jam karena
      // jam PHP dan MySQL selisih 5 jam. Test ini SENGAJA memaku perilaku
      // yang salah itu supaya GAGAL begitu backend diperbaiki — saat itu
      // tinggal ubah harapannya ke 24 dan hapus catatan ini.
      expect(hours, 19,
          reason: 'kalau ini jadi 24, bug jam di backend sudah beres — '
              'perbarui test dan aktifkan hitung mundur di UI');
    });

    test('pengiriman: POD dan jendela retur terbaca',
        skip: kIsWeb ? false : skipNative, () async {
      final list = await order.list();
      for (final summary in list.data) {
        final detail = await order.detail(summary.id);
        final shipments = detail.data.allShipments;
        if (shipments.isEmpty) continue;

        final s = shipments.first;
        expect(s.status, isNotEmpty);

        if (s.isDelivered) {
          // Jendela retur dihitung dari delivered_at: 2x24 jam untuk pecah
          // belah, 7 hari untuk lainnya.
          expect(s.returnDeadline, isNotNull);
          expect(
            s.returnWindow,
            s.isFragile ? const Duration(hours: 48) : const Duration(days: 7),
          );
        }
        if (s.hasPod) expect(s.podReceiverName ?? s.podPhotoUrl, isNotNull);
        return;
      }
    });
  });

  group('wishlist', () {
    // REGRESI BACKEND v2.4: ketiga endpoint wishlist membalas
    //   403 PERMISSION_DENIED
    //   "Unknown menu_cd (server misconfiguration): WISHLIST_VIEW"
    // (juga WISHLIST_ADD dan WISHLIST_REMOVE). Servernya sendiri menyebutnya
    // salah konfigurasi: seed izin untuk ketiga menu itu tidak ikut masuk
    // pada migrasi v2.4. Ketiganya BEKERJA di v2.2 dan test ini lolos saat
    // itu.
    //
    // Endpoint lain yang butuh izin tetap normal (cart/add 201,
    // cart/clear 200, offers/{id}/reviews 200), jadi bukan sistem izinnya
    // yang rusak — hanya tiga baris seed yang hilang.
    //
    // Lapisan kliennya sudah selesai dan diuji lewat model; begitu seed-nya
    // ditambahkan, cukup hapus `skip` ini.
    const wishlistBlocked =
        'REGRESI BACKEND v2.4: seed izin WISHLIST_* hilang, ketiga endpoint '
        '403 PERMISSION_DENIED "Unknown menu_cd (server misconfiguration)"';

    test('tambah, baca, hapus — tersimpan di server',
        skip: wishlistBlocked, () async {
      await wishlist.add(_offerA);

      final afterAdd = await wishlist.list();
      final item =
          afterAdd.data.firstWhere((w) => w.offerId == _offerA);

      // Respons wishlist SUDAH diperkaya server (nama/harga/foto), berbeda
      // dari keranjang yang hanya membawa offer_id.
      expect(item.title, isNotEmpty);
      expect(item.title, isNot(startsWith('Produk #')));
      expect(item.displayPrice, greaterThan(0));
      expect(item.isOfferInactive, isFalse);

      await wishlist.remove(_offerA);
      final afterRemove = await wishlist.list();
      expect(afterRemove.data.any((w) => w.offerId == _offerA), isFalse);
    });
  });
}
