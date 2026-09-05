import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Carousel banner, meniru `CarouselSliderWidget` milik UI kit (aspect ratio,
/// viewportFraction, autoPlay, dan indikator titik yang sama).
///
/// Isinya **digambar sendiri**, bukan `Image.asset`. Dua alasan:
///
/// 1. Tidak ada endpoint banner/promo di dokumen API member, jadi tidak ada
///    gambar sungguhan untuk ditampilkan.
/// 2. Aset banner di repo ini masih placeholder, dan `Image.asset` atas
///    placeholder tersebut terbukti **tidak menggambar apa pun** di Flutter
///    web — area banner terukur 100% putih (54.000 sampel piksel), bahkan
///    `errorBuilder` tidak terpanggil. Bergantung padanya berarti menyisakan
///    ~270px ruang mati di layar utama.
///
/// Begitu backend menyediakan banner, ganti [_slides] jadi daftar URL dan
/// pakai `Image.network` dengan `errorBuilder` ke kartu ini sebagai fallback.
class CatalogBannerCarousel extends StatefulWidget {
  const CatalogBannerCarousel({super.key});

  @override
  State<CatalogBannerCarousel> createState() => _CatalogBannerCarouselState();
}

class _CatalogBannerCarouselState extends State<CatalogBannerCarousel> {
  final _controller = CarouselSliderController();
  int _currentPage = 0;

  /// Slide sementara sampai ada endpoint banner.
  static const _slides = [
    ('Bandingkan harga antar toko', 'Barang sama, ongkir dan harga beda'),
    ('Satuan majemuk', 'Sak, dus, m² — konversinya kami hitung'),
    ('Ongkir transparan', 'Terlihat sejak hasil pencarian'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: _slides.length,
            options: CarouselOptions(
              aspectRatio: 300 / 100,
              autoPlay: true,
              viewportFraction: .7,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, _) =>
                  setState(() => _currentPage = index),
            ),
            itemBuilder: (context, index, realIndex) {
              final (title, subtitle) = _slides[index];
              final primary =
                  isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

              return Padding(
                padding: 14.pe,
                child: Container(
                  padding: 20.pa,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [primary, primary.withValues(alpha: .72)],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.styleSemiBold18(context)
                            .copyWith(color: kWhiteColor),
                      ),
                      8.sbh,
                      Text(
                        subtitle,
                        style: AppStyles.styleRegular14(context).copyWith(
                          color: kWhiteColor.withValues(alpha: .85),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSmoothIndicator(
          onDotClicked: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 350),
            );
            setState(() => _currentPage = index);
          },
          duration: const Duration(milliseconds: 350),
          activeIndex: _currentPage,
          count: _slides.length,
          effect: ExpandingDotsEffect(
            spacing: 4,
            dotHeight: 8,
            dotWidth: 8,
            dotColor: const Color(0xffE0E0E0),
            activeDotColor:
                isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor,
          ),
        ),
      ],
    );
  }
}

/// Header kategori yang di-pin, meniru `SliverAppBarDelegate` milik kit.
class PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  PinnedHeaderDelegate(this.child, {this.height = 110});

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) =>
      SizedBox.expand(child: child);

  @override
  bool shouldRebuild(PinnedHeaderDelegate oldDelegate) =>
      oldDelegate.child != child || oldDelegate.height != height;
}
