import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_images.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Carousel banner, meniru `CarouselSliderWidget` milik UI kit (aspect ratio,
/// viewportFraction, autoPlay, dan indikator titik yang sama).
///
/// Bannernya masih **aset lokal**, bukan dari API: tidak ada endpoint banner
/// atau promo di dokumen API member. Begitu backend menyediakannya, cukup
/// ganti [banners] jadi daftar URL dan tukar `Image.asset` ke `Image.network`.
class CatalogBannerCarousel extends StatefulWidget {
  const CatalogBannerCarousel({super.key});

  @override
  State<CatalogBannerCarousel> createState() => _CatalogBannerCarouselState();
}

class _CatalogBannerCarouselState extends State<CatalogBannerCarousel> {
  final _controller = CarouselSliderController();
  int _currentPage = 0;

  static const banners = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: banners.length,
            options: CarouselOptions(
              aspectRatio: 300 / 100,
              autoPlay: true,
              viewportFraction: .7,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, _) =>
                  setState(() => _currentPage = index),
            ),
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: 14.pe,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    banners[index],
                    fit: BoxFit.cover,
                    // Aset banner masih placeholder di repo ini.
                    errorBuilder: (_, __, ___) => ColoredBox(
                      color: isAppDarkMode() ? kDarkColor : kBorderColor,
                    ),
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
          count: banners.length,
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
