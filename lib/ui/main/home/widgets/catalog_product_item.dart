import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/get_responsive_font_size.dart';
import 'package:navy_wear/core/utils/app_images.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Kartu produk untuk grid Home.
///
/// Tata letak, radius, badge, dan tombol mengambang di sini **mengikuti
/// `CustomProductItem` milik UI kit** agar tampilannya konsisten dengan
/// template. Yang berubah hanya sumber datanya dan tiga hal yang menyesuaikan
/// domain bahan bangunan:
///
/// * Gambar dari `Image.network`, bukan `AssetImage` — foto datang dari API.
/// * Harga dalam rupiah lewat [formatRupiah], bukan `$`, dan diambil dari
///   tier yang **boleh dilihat user ini** (tier `PROJECT` tidak pernah
///   dirender ke pembeli retail — aturan PRD-06).
/// * Badge diskon hanya muncul kalau tier-nya benar-benar punya
///   `strikethrough_price`; kit-nya selalu menampilkan `"X% off"`.
///
/// `CustomProductItem` yang lama dibiarkan utuh karena masih dipakai layar
/// favorites/trending/new_fashion yang belum dimigrasikan.
class CatalogProductItem extends StatelessWidget {
  const CatalogProductItem({
    super.key,
    required this.offer,
    required this.title,
    required this.isB2B,
    this.sellerName,
    this.unitName,
    this.onTap,
  });

  final OfferModel offer;
  final String title;
  final bool isB2B;

  /// Diteruskan terpisah karena `GET /offers` tidak memuat `seller_name` —
  /// hanya `GET /search` yang punya, sisanya diambil dari direktori toko.
  final String? sellerName;

  final String? unitName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tiers = offer.visibleTiers(isB2B: isB2B);
    final cheapest = tiers.isEmpty
        ? null
        : tiers.reduce((a, b) => a.price <= b.price ? a : b);
    final discountPercent = _discountPercent(cheapest);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey),
                color: isAppDarkMode() ? kDarkColor : kWhiteColor,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _Photo(url: offer.primaryPhotoUrl),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (discountPercent != null)
                            _Pill(text: '$discountPercent% off'),
                          if (offer.isFragile)
                            const _Pill(
                              text: 'Pecah belah',
                              color: kErrorColor,
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: isAppDarkMode()
                                    ? kBlackColor
                                    : Colors.white,
                                shape: const OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: isAppDarkMode()
                                        ? kBlackColor.withValues(alpha: .08)
                                        : const Color(0x14000000),
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImages.bag,
                                  width: 18,
                                  colorFilter: ColorFilter.mode(
                                    isAppDarkMode()
                                        ? kDarkSecondColor
                                        : kLightThirdColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleMedium14(context).copyWith(
              color: isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
            ),
          ),
          if (sellerName != null)
            Text(
              sellerName!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kLightThirdColor),
            ),
          Row(
            children: [
              Flexible(
                child: Text(
                  cheapest == null
                      ? 'Harga belum tersedia'
                      : formatRupiah(cheapest.price),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleSemiBold14(context),
                ),
              ),
              if (unitName != null)
                Text(
                  ' / $unitName',
                  style: AppStyles.styleRegular10(context)
                      .copyWith(color: kLightThirdColor),
                ),
            ],
          ),
          if (cheapest?.strikethroughPrice != null)
            Text(
              formatRupiah(cheapest!.strikethroughPrice),
              style: AppStyles.styleMedium10(context).copyWith(
                decoration: TextDecoration.lineThrough,
                color: isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor,
              ),
            ),
          if (offer.ongkirMulaiDari != null)
            Text(
              // Penanda estimasi wajib ada — ini bukan ongkir final (SRC-04).
              offer.ongkirIsEstimate
                  ? 'Ongkir dari ${formatRupiah(offer.ongkirMulaiDari)}*'
                  : 'Ongkir ${formatRupiah(offer.ongkirMulaiDari)}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kWarningColor),
            ),
        ],
      ),
    );
  }

  /// Persentase diskon dihitung dari `strikethrough_price`, bukan dikarang.
  static int? _discountPercent(PriceTierModel? tier) {
    final before = tier?.strikethroughPrice;
    if (tier == null || before == null || before <= tier.price) return null;
    return (((before - tier.price) / before) * 100).round();
  }
}

class _Photo extends StatelessWidget {
  const _Photo({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final placeholder = ColoredBox(
      color: isAppDarkMode() ? kDarkColor : kBorderColor,
      child: const Center(
        child: Icon(Icons.inventory_2_outlined,
            color: kLightThirdColor, size: 32),
      ),
    );

    if (url == null) return placeholder;

    return Image.network(
      url!,
      fit: BoxFit.cover,
      // Foto seed backend menunjuk ke contoh.test yang tidak bisa dijangkau,
      // jadi kegagalan gambar harus tampil rapi, bukan ikon rusak.
      errorBuilder: (_, __, ___) => placeholder,
      loadingBuilder: (_, child, progress) =>
          progress == null ? child : placeholder,
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: color ??
              (isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(
            text,
            style: AppStyles.styleMedium12(context).copyWith(
              color: kWhiteColor,
              fontSize: getResponsiveFontSize(context, fontSize: 8),
            ),
          ),
        ),
      ),
    );
  }
}
