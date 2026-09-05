import 'package:flutter/material.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Kartu satu penawaran.
///
/// Tiga aturan bisnis yang wajib tercermin di sini, bukan opsional:
///
/// * Ongkir ditandai jelas sebagai **estimasi** kalau `ongkirIsEstimate`
///   (aturan SRC-04) — menampilkannya seperti angka final berarti menjanjikan
///   harga yang belum tentu ditagih.
/// * Harga diambil dari tier yang **boleh dilihat user ini**; tier `PROJECT`
///   tidak pernah dirender untuk pembeli retail (aturan PRD-06).
/// * Minimum order ditampilkan, karena qty di bawahnya akan ditolak server
///   saat checkout dengan `BELOW_MIN_ORDER`.
class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.offer,
    required this.title,
    required this.isB2B,
    this.unitName,
    this.onTap,
  });

  final OfferModel offer;
  final String title;
  final bool isB2B;
  final String? unitName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final price = offer.lowestVisiblePrice(isB2B: isB2B);
    final unitSuffix = unitName == null ? '' : ' / $unitName';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: 12.pa,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kBorderColor),
          color: isAppDarkMode() ? kDarkColor : kWhiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Thumbnail(url: offer.primaryPhotoUrl),
            12.sbw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleMedium14(context).copyWith(
                      color: isAppDarkMode()
                          ? kDarkSecondColor
                          : kLightSecondColor,
                    ),
                  ),
                  if (offer.sellerName != null) ...[
                    4.sbh,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            offer.sellerName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleRegular12(context)
                                .copyWith(color: kLightThirdColor),
                          ),
                        ),
                        if (offer.isPkp) const _Badge(text: 'PKP'),
                      ],
                    ),
                  ],
                  8.sbh,
                  Text(
                    price == null
                        ? 'Harga belum tersedia'
                        : '${formatRupiah(price)}$unitSuffix',
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: isAppDarkMode()
                          ? kDarkPrimaryColor
                          : kLightPrimaryColor,
                    ),
                  ),
                  4.sbh,
                  Text(
                    'Min. order ${_qty(offer.minOrderQty)}'
                    '${unitName == null ? '' : ' $unitName'}',
                    style: AppStyles.styleRegular12(context)
                        .copyWith(color: kLightThirdColor),
                  ),
                  if (offer.ongkirMulaiDari != null) ...[
                    4.sbh,
                    Text(
                      offer.ongkirIsEstimate
                          // Penanda "mulai dari" wajib ada — ini bukan ongkir
                          // final (SRC-04).
                          ? 'Ongkir mulai dari ${formatRupiah(offer.ongkirMulaiDari)} · estimasi'
                          : 'Ongkir ${formatRupiah(offer.ongkirMulaiDari)}',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: kWarningColor),
                    ),
                  ],
                  if (offer.isFragile) ...[
                    4.sbh,
                    Text(
                      'Pecah belah · jendela retur 2×24 jam',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: kErrorColor),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Qty di API berdesimal (`5.0000`). Tampilkan tanpa `.0` kalau bulat.
  static String _qty(double value) =>
      value == value.roundToDouble() ? '${value.round()}' : '$value';
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: kBorderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.inventory_2_outlined, color: kLightThirdColor),
    );

    if (url == null) return placeholder;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url!,
        width: 72,
        height: 72,
        fit: BoxFit.cover,
        // Foto seed backend menunjuk ke contoh.test yang tidak bisa diakses,
        // jadi kegagalan gambar harus tampil rapi, bukan ikon rusak.
        errorBuilder: (_, __, ___) => placeholder,
        loadingBuilder: (_, child, progress) =>
            progress == null ? child : placeholder,
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: kSuccessColor.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppStyles.styleRegular10(context).copyWith(color: kSuccessColor),
      ),
    );
  }
}
