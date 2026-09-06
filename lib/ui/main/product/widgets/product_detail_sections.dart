import 'package:flutter/material.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Kotak berbingkai, meniru kartu deskripsi di `product_details` kit.
class DetailCard extends StatelessWidget {
  const DetailCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: const Color(0xffDCDCDC).withValues(alpha: .5),
        ),
      ),
      child: Padding(padding: padding ?? 16.pa, child: child),
    );
  }
}

/// Pemilih satuan jual + ringkasan konversinya.
///
/// Menempati posisi baris **Color / Size** di layar kit. Untuk bahan bangunan
/// inilah elemen terpentingnya: pembeli tidak tahu 1 dus keramik itu berapa
/// m², dan tanpa konversi eksplisit mereka salah beli.
class UnitPicker extends StatelessWidget {
  const UnitPicker({
    super.key,
    required this.units,
    required this.selected,
    required this.onSelect,
    this.conversionSummary,
  });

  final List<SkuUnitModel> units;
  final SkuUnitModel? selected;
  final ValueChanged<SkuUnitModel> onSelect;
  final String? conversionSummary;

  @override
  Widget build(BuildContext context) {
    if (units.isEmpty) return const SizedBox.shrink();
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Satuan', style: AppStyles.styleMedium16(context)),
        12.sbh,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final u in units)
              InkWell(
                onTap: () => onSelect(u),
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 36,
                  decoration: BoxDecoration(
                    color: u.unitName == selected?.unitName
                        ? primary
                        : Colors.transparent,
                    border: u.unitName == selected?.unitName
                        ? null
                        : Border.all(color: primary),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      u.unitName,
                      style: AppStyles.styleMedium14(context).copyWith(
                        color: u.unitName == selected?.unitName
                            ? kWhiteColor
                            : primary,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (conversionSummary != null) ...[
          10.sbh,
          Row(
            children: [
              const Icon(Icons.swap_horiz, size: 16, color: kLightThirdColor),
              6.sbw,
              Expanded(
                child: Text(
                  conversionSummary!,
                  style: AppStyles.styleRegular12(context)
                      .copyWith(color: kLightThirdColor),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

/// Tabel harga bertingkat dari `price_tiers[]`.
///
/// Tier yang diterima di sini sudah disaring lewat
/// `OfferModel.visibleTiers(isB2B:)` — tier `PROJECT` tidak boleh sampai ke
/// pembeli retail (aturan PRD-06), dan API mengirim semua tier ke siapa pun
/// sehingga penyaringan itu tanggung jawab aplikasi.
class PriceTierTable extends StatelessWidget {
  const PriceTierTable({
    super.key,
    required this.tiers,
    required this.baseUnit,
    this.activeTierId,
  });

  final List<PriceTierModel> tiers;
  final String? baseUnit;
  final int? activeTierId;

  @override
  Widget build(BuildContext context) {
    if (tiers.isEmpty) return const SizedBox.shrink();
    final sorted = [...tiers]..sort((a, b) => a.minQty.compareTo(b.minQty));
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Harga bertingkat', style: AppStyles.styleMedium16(context)),
        6.sbh,
        Text(
          'Makin banyak, makin murah. Harga mengikuti jumlah pesanan.',
          style: AppStyles.styleRegular12(context)
              .copyWith(color: kLightThirdColor),
        ),
        12.sbh,
        DetailCard(
          padding: 12.pa,
          child: Column(
            children: [
              for (final t in sorted) ...[
                Container(
                  padding: 8.pa,
                  decoration: BoxDecoration(
                    color: t.id == activeTierId
                        ? primary.withValues(alpha: .08)
                        : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      if (t.isProjectTier) ...[
                        Icon(Icons.workspace_premium_outlined,
                            size: 14, color: primary),
                        4.sbw,
                      ],
                      Expanded(
                        child: Text(
                          '≥ ${_qty(t.minQty)}${baseUnit == null ? '' : ' $baseUnit'}'
                          '${t.isProjectTier ? ' · proyek' : ''}',
                          style: AppStyles.styleRegular14(context).copyWith(
                            color: isAppDarkMode()
                                ? kDarkSecondColor
                                : kLightSecondColor,
                          ),
                        ),
                      ),
                      Text(
                        formatRupiah(t.price),
                        style: AppStyles.styleSemiBold14(context).copyWith(
                          color: t.id == activeTierId ? primary : null,
                        ),
                      ),
                    ],
                  ),
                ),
                if (t != sorted.last)
                  Divider(
                    height: 12,
                    color: kBorderColor.withValues(alpha: .8),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  static String _qty(double v) =>
      v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(2);
}

/// Kalkulator kebutuhan: user memasukkan luas/volume, aplikasi menghitung
/// jumlah satuan jual yang perlu dibeli **termasuk cadangan 5%**.
///
/// Dokumen panduan FE menyebut ini *pembeda produk terkuat* di kategori bahan
/// bangunan, dan alasannya masuk akal: orang mengukur lantai dalam m², bukan
/// dalam dus. Cadangan 5% adalah angka waste lazim untuk pemotongan keramik —
/// tanpa itu pembeli kekurangan material di tengah pemasangan, dan sisa dus
/// dari batch berbeda bisa beda warna.
class RequirementCalculator extends StatelessWidget {
  const RequirementCalculator({
    super.key,
    required this.measureUnitName,
    required this.sellUnitName,
    required this.wastePercent,
    required this.result,
    required this.onChanged,
    required this.onApply,
  });

  final String measureUnitName;
  final String sellUnitName;
  final int wastePercent;
  final int? result;
  final ValueChanged<String> onChanged;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hitung kebutuhan', style: AppStyles.styleMedium16(context)),
        6.sbh,
        Text(
          'Masukkan luas dalam $measureUnitName — kami hitung berapa '
          '$sellUnitName yang perlu dibeli, sudah termasuk cadangan '
          '$wastePercent% untuk pemotongan.',
          style: AppStyles.styleRegular12(context)
              .copyWith(color: kLightThirdColor),
        ),
        12.sbh,
        DetailCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: onChanged,
                      style: AppStyles.styleMedium16(context),
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'mis. 30',
                        suffixText: measureUnitName,
                        hintStyle: AppStyles.styleRegular14(context)
                            .copyWith(color: kLightThirdColor),
                      ),
                    ),
                  ),
                ],
              ),
              if (result != null) ...[
                Divider(color: kBorderColor.withValues(alpha: .8)),
                8.sbh,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Perlu $result $sellUnitName',
                        style: AppStyles.styleSemiBold16(context)
                            .copyWith(color: primary),
                      ),
                    ),
                    TextButton(
                      onPressed: onApply,
                      child: Text(
                        'Pakai jumlah ini',
                        style: AppStyles.styleMedium14(context)
                            .copyWith(color: primary),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Daftar penawaran toko lain untuk SKU yang sama.
///
/// Inti nilai marketplace ini. Semen Tiga Roda dari toko A dan toko B itu
/// barang identik — yang dibandingkan pembeli hanya harga, ongkir, dan stok.
/// Kalau toko termurah kehabisan stok, pembeli tidak buntu.
class OtherSellerOffers extends StatelessWidget {
  const OtherSellerOffers({
    super.key,
    required this.offers,
    required this.sellerNames,
    required this.isB2B,
    required this.onTap,
  });

  final List<OfferModel> offers;
  final Map<int, String> sellerNames;
  final bool isB2B;
  final ValueChanged<OfferModel> onTap;

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dijual juga di toko lain',
          style: AppStyles.styleMedium16(context),
        ),
        6.sbh,
        Text(
          'Barang sama, harga dan ongkir bisa berbeda.',
          style: AppStyles.styleRegular12(context)
              .copyWith(color: kLightThirdColor),
        ),
        12.sbh,
        for (final o in offers) ...[
          InkWell(
            onTap: () => onTap(o),
            borderRadius: BorderRadius.circular(12),
            child: DetailCard(
              padding: 12.pa,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          o.sellerName ??
                              sellerNames[o.sellerId] ??
                              'Toko #${o.sellerId}',
                          style: AppStyles.styleMedium14(context),
                        ),
                        4.sbh,
                        Text(
                          [
                            if (o.availableStock != null)
                              'stok ${_qty(o.availableStock!)}',
                            if (o.ongkirMulaiDari != null)
                              'ongkir dari ${formatRupiah(o.ongkirMulaiDari)}'
                                  '${o.ongkirIsEstimate ? '*' : ''}',
                            if (o.isPkp) 'PKP',
                          ].join(' · '),
                          style: AppStyles.styleRegular10(context)
                              .copyWith(color: kLightThirdColor),
                        ),
                      ],
                    ),
                  ),
                  8.sbw,
                  Text(
                    formatRupiah(o.lowestVisiblePrice(isB2B: isB2B)),
                    style: AppStyles.styleSemiBold14(context),
                  ),
                  const Icon(Icons.chevron_right, color: kLightThirdColor),
                ],
              ),
            ),
          ),
          12.sbh,
        ],
      ],
    );
  }

  static String _qty(double v) =>
      v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(2);
}
