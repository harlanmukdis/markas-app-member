import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/ui/main/product/cubit/product_detail_cubit.dart';

/// Keramik dari data uji: `sku_id 6`, satuan pcs / dus / m².
const _pcs = SkuUnitModel(id: 1, unitName: 'pcs', conversionFactorToBase: 1);
const _dus = SkuUnitModel(id: 2, unitName: 'dus', conversionFactorToBase: 25);
const _m2 = SkuUnitModel(id: 3, unitName: 'm2', conversionFactorToBase: 6.25);

const _keramik = SkuModel(
  id: 6,
  name: 'Keramik Lantai 40x40 Putih Polos',
  baseUnit: 'pcs',
  handlingClass: 'PECAH_BELAH',
  units: [_pcs, _dus, _m2],
);

const _offer = OfferModel(
  id: 5,
  sellerId: 4,
  skuId: 6,
  minOrderQty: 10,
  priceTiers: [
    PriceTierModel(id: 1, segment: 'RETAIL', minQty: 1, price: 68000),
    PriceTierModel(id: 2, segment: 'RETAIL', minQty: 20, price: 65000),
    PriceTierModel(id: 3, segment: 'PROJECT', minQty: 500, price: 61000),
  ],
);

ProductDetailState _state({
  SkuUnitModel? unit = _dus,
  double qty = 1,
  double calc = 0,
}) =>
    ProductDetailState(
      isLoading: false,
      offer: _offer,
      sku: _keramik,
      selectedUnit: unit,
      qty: qty,
      calculatorInput: calc,
    );

void main() {
  group('konversi satuan', () {
    test('ringkasan menampilkan rantai konversi yang bisa dibaca', () {
      // Ini elemen paling menentukan di kategori bahan bangunan: pembeli
      // tidak tahu 1 dus keramik itu berapa m².
      expect(_state().unitConversionSummary, '1 dus = 25 pcs = 4 m2');
    });

    test('satuan dasar tidak perlu ringkasan konversi', () {
      expect(_state(unit: _pcs).unitConversionSummary, isNull);
    });

    test('qty dikonversi ke satuan dasar untuk penentuan tier', () {
      expect(_state(unit: _dus, qty: 2).qtyInBaseUnit, 50);
      expect(_state(unit: _pcs, qty: 2).qtyInBaseUnit, 2);
      expect(_state(unit: _m2, qty: 4).qtyInBaseUnit, 25);
    });
  });

  group('kalkulator kebutuhan', () {
    test('30 m² jadi 8 dus, termasuk cadangan 5%', () {
      // 30 m² x 6,25 pcs/m² = 187,5 pcs -> +5% = 196,875 -> /25 per dus
      // = 7,875 -> dibulatkan ke ATAS jadi 8 dus.
      //
      // Pembulatan ke atas bukan pilihan estetika: barang dijual per satuan
      // utuh, dan kekurangan material di tengah pemasangan jauh lebih mahal
      // daripada sisa satu dus.
      expect(_state(calc: 30).calculatorResult, 8);
    });

    test('cadangan 5% benar-benar diperhitungkan', () {
      // 100 m² = 625 pcs = tepat 25 dus tanpa cadangan.
      // Dengan cadangan 5% jadi 656,25 pcs = 26,25 dus -> 27 dus.
      expect(_state(calc: 100).calculatorResult, 27);
      expect(ProductDetailState.wasteAllowance, 0.05);
    });

    test('hasil mengikuti satuan yang dipilih', () {
      expect(_state(unit: _pcs, calc: 30).calculatorResult, 197);
      expect(_state(unit: _dus, calc: 30).calculatorResult, 8);
    });

    test('input kosong atau nol tidak menghasilkan apa-apa', () {
      expect(_state(calc: 0).calculatorResult, isNull);
      expect(_state(calc: -5).calculatorResult, isNull);
    });

    test('kalkulator hanya ada kalau SKU punya satuan luas/volume', () {
      expect(_state().hasCalculator, isTrue);
      expect(_state().measureUnit?.unitName, 'm2');

      // Semen per sak: tidak ada yang bisa dihitung dari luas.
      const semen = SkuModel(
        id: 1,
        name: 'Semen Tiga Roda 40 kg',
        baseUnit: 'sak',
        units: [SkuUnitModel(id: 9, unitName: 'sak')],
      );
      final state = _state().copyWith(sku: semen);
      expect(state.measureUnit, isNull);
      expect(state.hasCalculator, isFalse);
    });
  });

  group('tier harga', () {
    test('tier dipilih berdasarkan qty dalam SATUAN DASAR', () {
      // 1 dus = 25 pcs, jadi sudah melewati tier "≥ 20 pcs".
      // Kalau perbandingannya memakai qty mentah (1), tier yang terpilih
      // salah dan harga yang ditampilkan lebih mahal dari seharusnya.
      expect(_state(unit: _dus, qty: 1).activeTier(isB2B: false)?.price, 65000);
      expect(_state(unit: _pcs, qty: 1).activeTier(isB2B: false)?.price, 68000);
    });

    test('tier PROJECT tidak pernah terpilih untuk pembeli retail', () {
      // 40 dus = 1000 pcs, di atas ambang tier PROJECT (500).
      final retail = _state(unit: _dus, qty: 40).activeTier(isB2B: false);
      expect(retail?.segment, 'RETAIL');
      expect(retail?.price, 65000);

      final b2b = _state(unit: _dus, qty: 40).activeTier(isB2B: true);
      expect(b2b?.segment, 'PROJECT');
      expect(b2b?.price, 61000);
    });

    test('daftar tier yang tampil menyaring PROJECT untuk retail', () {
      expect(_state().visibleTiers(isB2B: false).length, 2);
      expect(_state().visibleTiers(isB2B: true).length, 3);
    });
  });

  group('minimum order', () {
    test('kekurangan dihitung dalam satuan dasar', () {
      // min order 10 pcs; 1 pcs berarti kurang 9.
      final short = _state(unit: _pcs, qty: 1);
      expect(short.meetsMinOrder, isFalse);
      expect(short.minOrderShortfall, 9);

      // 1 dus = 25 pcs, sudah lewat.
      final ok = _state(unit: _dus, qty: 1);
      expect(ok.meetsMinOrder, isTrue);
      expect(ok.minOrderShortfall, 0);
    });
  });
}
