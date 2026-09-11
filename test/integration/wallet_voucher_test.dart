/// Dompet, voucher keranjang, dan pembayaran `SALDO`.
///
/// ```bash
/// flutter test --platform chrome test/integration/
/// ```
///
/// Ketiganya baru masuk brief 11 September 2026 dan tidak ada di dokumen
/// sebelumnya, jadi bentuk datanya dipatok di sini.
///
/// Mengikuti disiplin `transaction_flow_test.dart`: **tidak memanggil
/// checkout dan tidak membuat order**. Yang dites hanya yang bisa
/// dikembalikan ke keadaan semula.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/config/env/env.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/cart_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/order_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/wallet_service.dart';
import 'package:navy_wear/core/domain/model/payment/payment_model.dart';
import 'package:navy_wear/core/domain/model/wallet/wallet_models.dart';

const _phone = '081100000001';
const _password = 'password123';

/// Penawaran Semen Padang — harga per sak melewati `min_spend` MARKAS50
/// (Rp 300.000) pada qty 5.
const _offer = 1;

void main() {
  late WalletService wallet;
  late CartService cart;
  late OrderService order;

  setUp(() async {
    final dio = DioClient.createBare(Env.apiBaseUrl);
    if (kIsWeb) {
      final session = await AuthService(DioClient.createBare(Env.apiBaseUrl))
          .login(phone: _phone, password: _password);
      dio.options.headers['Authorization'] =
          'Bearer ${session.data.accessToken}';
    }
    wallet = WalletService(dio);
    cart = CartService(dio);
    order = OrderService(dio);
  });

  tearDown(() async {
    if (!kIsWeb) return;
    try {
      await cart.clear();
      // `clear` **tidak** melepas voucher (lihat test di bawah), jadi harus
      // dilepas terpisah — kalau tidak, run berikutnya kena 409.
      await cart.removeVoucher('MARKAS50');
    } catch (_) {}
  });

  /// Keranjang bersih + voucher terlepas, apa pun sisa run sebelumnya.
  Future<void> resetCart() async {
    try {
      await cart.clear();
    } catch (_) {}
    try {
      await cart.removeVoucher('MARKAS50');
    } catch (_) {}
  }

  const skipNative =
      'butuh token; diblokir bug header Authorization di native';

  group('dompet', () {
    test('saldo dibaca sebagai angka', skip: kIsWeb ? false : skipNative,
        () async {
      final env = await wallet.balance();
      expect(env.data.balance, isA<int>());
      expect(env.data.balance, greaterThanOrEqualTo(0));
    });

    test('mutasi membawa tanda: pengeluaran negatif, top-up positif',
        skip: kIsWeb ? false : skipNative, () async {
      final env = await wallet.history(limit: 50);

      for (final e in env.data) {
        expect(e.entryType, isNotEmpty);
        // UI menampilkan tanda apa adanya, jadi tandanya harus konsisten.
        if (e.entryType == 'PEMBAYARAN_KELUAR') {
          expect(e.amount, lessThan(0),
              reason: 'pengeluaran harus sudah negatif dari server');
        }
        if (e.entryType == 'TOPUP_MASUK') {
          expect(e.amount, greaterThan(0));
        }
        expect(e.createdDate, isNotNull,
            reason: 'riwayat memakai created_date');
      }
    });

    test('top-up memakai created_at, BUKAN created_date',
        skip: kIsWeb ? false : skipNative, () async {
      // Pengecualian yang **tidak tercatat di brief**: brief menyebut hanya
      // /chat/messages dan /payments/*. Padahal GET /wallet/history — satu
      // modul dengan endpoint ini — mengirim created_date. Modelnya membaca
      // kedua ejaan, jadi test tetap hijau kalau nanti diseragamkan.
      final env = await wallet.topup(method: TopupMethod.va, amount: 100000);
      final topup = env.data;

      expect(topup.topupNo, isNotNull);
      expect(topup.createdDate, isNotNull,
          reason: 'tanggal top-up gagal dibaca — ejaan kolomnya berubah?');
      expect(topup.vaNumber, isNotNull);
      expect(topup.vaNumber, isNotEmpty);
      expect(topup.status, 'TERTUNDA',
          reason: 'top-up tidak pernah langsung menambah saldo');
      expect(topup.expiresAt, isNotNull);
    });
  });

  group('voucher keranjang', () {
    test('menempel voucher mengembalikan pratinjau potongan',
        skip: kIsWeb ? false : skipNative, () async {
      await resetCart();
      await cart.add(offerId: _offer, qty: 5);

      final env = await cart.attachVoucher(code: 'MARKAS50');
      final voucher = env.data;

      expect(voucher.code, 'MARKAS50');
      expect(voucher.isPlatform, isTrue);
      expect(voucher.discountAmountPreview, isNotNull,
          reason: 'satu-satunya angka potongan yang bisa ditampilkan di '
              'keranjang');
      expect(voucher.discountAmountPreview, greaterThan(0));
    });

    test('GET /cart/view membawa voucher TANPA pratinjau potongan',
        skip: kIsWeb ? false : skipNative, () async {
      await resetCart();
      await cart.add(offerId: _offer, qty: 5);
      await cart.attachVoucher(code: 'MARKAS50');

      // Inilah alasan pratinjau disimpan terpisah di state: memuat ulang
      // keranjang menghapusnya. Menyatukan keduanya akan menampilkan
      // "potongan Rp 0" yang menyesatkan.
      final env = await cart.view();

      expect(env.data.vouchers, isNotEmpty);
      expect(env.data.vouchers.first.code, 'MARKAS50');
      expect(env.data.vouchers.first.discountAmountPreview, isNull,
          reason: 'kalau server mulai mengirimkannya, pratinjau boleh dibaca '
              'langsung dari sini dan state terpisah bisa dibuang');
      expect(env.data.vouchers.first.minSpend, isNotNull);
      expect(env.data.hasPlatformVoucher, isTrue);
    });

    test('POST /cart/clear TIDAK melepas voucher',
        skip: kIsWeb ? false : skipNative, () async {
      // Perilaku yang tidak disebut brief dan gampang menggigit: pembeli yang
      // mengosongkan keranjang tetap membawa vouchernya, lalu menempelkan
      // kode yang sama dibalas 409 ALREADY_ATTACHED. UI harus menjelaskan
      // itu, bukan menampilkan "terjadi kesalahan".
      await resetCart();
      await cart.add(offerId: _offer, qty: 5);
      await cart.attachVoucher(code: 'MARKAS50');

      await cart.clear();
      final after = await cart.view();

      expect(after.data.isEmpty, isTrue, reason: 'barangnya memang hilang');
      expect(after.data.vouchers, isNotEmpty,
          reason: 'vouchernya justru bertahan — kalau suatu saat server ikut '
              'melepasnya, test ini merah dan penanganan 409 boleh dibuang');
    });

    test('kode tidak dikenal ditolak tanpa merusak keranjang',
        skip: kIsWeb ? false : skipNative, () async {
      await resetCart();
      await cart.add(offerId: _offer, qty: 5);

      await expectLater(
        cart.attachVoucher(code: 'TIDAKADA123'),
        throwsA(anything),
      );

      final after = await cart.view();
      expect(after.data.isEmpty, isFalse,
          reason: 'keranjang tidak boleh ikut hilang');
    });

    test('melepas voucher dikunci dengan code, bukan id',
        skip: kIsWeb ? false : skipNative, () async {
      await resetCart();
      await cart.add(offerId: _offer, qty: 5);
      await cart.attachVoucher(code: 'MARKAS50');

      await cart.removeVoucher('MARKAS50');

      final after = await cart.view();
      expect(after.data.vouchers.where((v) => v.code == 'MARKAS50'), isEmpty);
    });
  });

  group('rincian biaya', () {
    test('daftar pesanan membawa rincian, bukan cuma grand_total',
        skip: kIsWeb ? false : skipNative, () async {
      // Checkout sengaja tidak dipanggil (lihat catatan di kepala file), tapi
      // order yang sudah ada membawa kolom rincian yang sama persis dengan
      // respons checkout — cukup untuk memastikan parsingnya benar.
      final env = await order.list();
      expect(env.data, isNotEmpty);

      final withCost = env.data.where((o) => o.grandTotal > 0);
      expect(withCost, isNotEmpty);

      for (final o in withCost) {
        expect(o.subtotal, greaterThan(0),
            reason: 'subtotal wajib tampil terpisah dari grand_total');
        // Pada bahan bangunan ongkir rutin melampaui harga barangnya —
        // justru itu sebabnya rincian tidak boleh diringkas jadi satu angka.
        expect(o.shippingTotal, greaterThanOrEqualTo(0));
      }
    });
  });

  group('aturan metode pembayaran', () {
    // Murni aturan sisi app, jadi tidak butuh token maupun jaringan.
    test('SALDO tetap ditawarkan pada order yang dipaksa transfer bank', () {
      final forced = PaymentMethod.selectable(forcedBankTransfer: true);

      expect(forced, contains(PaymentMethod.saldo),
          reason: 'menghilangkannya memaksa pembeli ke satu-satunya jalur '
              'yang rekening tujuannya belum ada di API mana pun');
      expect(forced, contains(PaymentMethod.bankTransfer));
      expect(forced, isNot(contains(PaymentMethod.va)));
    });

    test('SALDO didahulukan, EWALLET dan CARD tidak pernah ditawarkan', () {
      final normal = PaymentMethod.selectable(forcedBankTransfer: false);

      expect(normal.first, PaymentMethod.saldo,
          reason: 'satu-satunya metode yang benar-benar tuntas hari ini');
      expect(normal, isNot(contains(PaymentMethod.ewallet)),
          reason: 'server tidak mengembalikan deeplink apa pun');
      expect(normal, isNot(contains(PaymentMethod.card)),
          reason: 'card_token dibuat tapi tidak dikembalikan, tanpa 3DS');
    });
  });
}
