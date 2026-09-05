import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_images.dart';
import 'package:navy_wear/core/utils/app_routes.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_text_form_field.dart';
import 'package:navy_wear/features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:navy_wear/generated/l10n.dart';
import 'package:navy_wear/ui/main/home/cubit/catalog_home_cubit.dart';
import 'package:navy_wear/ui/main/home/widgets/catalog_banner_carousel.dart';
import 'package:navy_wear/ui/main/home/widgets/catalog_product_item.dart';
import 'package:navy_wear/util/error_message.dart';

/// Home berbasis katalog Markas.
///
/// **Mengikuti tata letak `HomePage` milik UI kit**: app bar dengan avatar
/// pembuka drawer + sapaan + tombol notifikasi, kolom pencarian, carousel
/// banner, header kategori yang di-pin, lalu grid produk. Widget dan gaya
/// diambil dari kit (`CustomTextFormField`, `CustomDrawer`, `AppStyles`,
/// konstanta `k*`), sehingga tampilannya konsisten dengan template.
///
/// Yang berubah hanya **sumber datanya**: kategori dan produk datang dari API,
/// bukan dari 11 `ProductModel` yang di-hardcode di `HomePageCubit`. Tab
/// t-shirt/blazer/sepatu digantikan kategori sungguhan dari `/categories`.
class CatalogHomeScreen extends StatelessWidget {
  const CatalogHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogHomeCubit()..loadCategories(),
      child: const _CatalogHomeBody(),
    );
  }
}

class _CatalogHomeBody extends StatefulWidget {
  const _CatalogHomeBody();

  @override
  State<_CatalogHomeBody> createState() => _CatalogHomeBodyState();
}

class _CatalogHomeBodyState extends State<_CatalogHomeBody> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = CatalogHomeCubit.get(context);
    final l = S.of(context);

    return BlocBuilder<CatalogHomeCubit, CatalogHomeState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: _appBar(context, cubit),
          drawer: const CustomDrawer(),
          body: RefreshIndicator(
            onRefresh: cubit.refresh,
            child: NestedScrollView(
              headerSliverBuilder: (context, _) => [
                SliverToBoxAdapter(child: _searchSection(context, cubit, l)),
                if (state.error != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: 24.psh,
                      child: _ErrorBox(
                        error: state.error!,
                        onRetry: cubit.refresh,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(child: _bannerSection(context, l)),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: PinnedHeaderDelegate(
                    _categorySection(context, cubit, state, l),
                  ),
                ),
              ],
              body: _gridSection(context, cubit, state, l),
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context, CatalogHomeCubit cubit) {
    final name = cubit.userName;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name == null ? 'Halo' : 'Halo, $name',
            style: AppStyles.styleSemiBold14(context),
          ),
          Text(
            // Segmen harga ditegaskan di sini supaya user B2B tahu ia sedang
            // melihat harga proyek, bukan harga retail.
            cubit.isB2B ? 'Harga proyek (B2B)' : 'Harga retail',
            style: AppStyles.styleRegular14(context).copyWith(
              color:
                  isAppDarkMode() ? kDarkThirdColor : const Color(0xFF475467),
            ),
          ),
        ],
      ),
      leadingWidth: 61,
      leading: Padding(
        padding: 16.ps,
        child: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          child: Image.asset(
            AppImages.avatar,
            fit: BoxFit.scaleDown,
            width: 45,
            height: 45,
            errorBuilder: (_, __, ___) => const Icon(Icons.menu, size: 28),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: 16.pe,
          child: InkWell(
            onTap: () => router.push(AppRoutes.notifications),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffE8E7F1)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.notificationIcon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchSection(BuildContext context, CatalogHomeCubit cubit, S l) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 20),
      child: CustomTextFormField(
        filled: true,
        controller: _searchController,
        hintText: l.search,
        textInputAction: TextInputAction.search,
        onSubmitted: cubit.search,
        prefix: SvgPicture.asset(
          AppImages.searchNormal,
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
            BlendMode.srcIn,
          ),
        ),
        suffix: IconButton(
          icon: const Icon(Icons.arrow_forward, size: 20),
          onPressed: () => cubit.search(_searchController.text),
        ),
      ),
    );
  }

  Widget _bannerSection(BuildContext context, S l) {
    return Column(
      children: [
        Padding(
          padding: 24.psh,
          child: Row(
            children: [
              Text(l.newOffers, style: AppStyles.styleSemiBold18(context)),
            ],
          ),
        ),
        8.sbh,
        const CatalogBannerCarousel(),
      ],
    );
  }

  Widget _categorySection(
    BuildContext context,
    CatalogHomeCubit cubit,
    CatalogHomeState state,
    S l,
  ) {
    return Container(
      color: isAppDarkMode() ? kDarkColor : kWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.sbh,
          Padding(
            padding: 24.psh,
            child: Row(
              children: [
                Text(
                  state.mode == CatalogHomeMode.searchResults
                      ? 'Hasil “${state.keyword}”'
                      : 'Kategori',
                  style: AppStyles.styleSemiBold18(context),
                ),
                const Spacer(),
                if (state.activeCategory != null ||
                    state.mode == CatalogHomeMode.searchResults)
                  TextButton(
                    onPressed: () {
                      _searchController.clear();
                      cubit.showBrowse();
                    },
                    child: Text(
                      'Reset',
                      style: AppStyles.styleRegular14(context).copyWith(
                        color: isAppDarkMode()
                            ? kDarkPrimaryColor
                            : kLightPrimaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          8.sbh,
          _CategoryChips(
            categories: state.categories,
            active: state.activeCategory,
            isLoading: state.isLoadingCategories,
            onSelect: cubit.openCategory,
          ),
          10.sbh,
        ],
      ),
    );
  }

  Widget _gridSection(
    BuildContext context,
    CatalogHomeCubit cubit,
    CatalogHomeState state,
    S l,
  ) {
    if (state.isLoadingOffers) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.mode == CatalogHomeMode.browse) {
      return const _Hint(
        icon: Icons.category_outlined,
        text: 'Pilih kategori di atas, atau cari langsung lewat kolom '
            'pencarian.',
      );
    }

    if (state.isEmptyResult || state.offers.isEmpty) {
      return _Hint(
        icon: Icons.search_off,
        text: state.mode == CatalogHomeMode.searchResults
            ? 'Tidak ada hasil untuk “${state.keyword}”. Coba kata lain, '
                'misalnya nama produk atau merek.'
            : 'Belum ada penawaran di kategori ini.',
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      itemCount: state.offers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (context.screenWidth / 250).round().clamp(2, 4),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: .62,
      ),
      itemBuilder: (context, index) {
        final offer = state.offers[index];
        return CatalogProductItem(
          offer: offer,
          title: state.offerTitle(offer),
          unitName: state.offerUnit(offer),
          isB2B: cubit.isB2B,
        );
      },
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({
    required this.categories,
    required this.active,
    required this.isLoading,
    required this.onSelect,
  });

  final List<CategoryModel> categories;
  final CategoryModel? active;
  final bool isLoading;
  final ValueChanged<CategoryModel> onSelect;

  @override
  Widget build(BuildContext context) {
    if (isLoading && categories.isEmpty) {
      return const SizedBox(
        height: 35,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return SizedBox(
      height: 35,
      child: ListView.builder(
        padding: 24.ps,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final c = categories[index];
          final selected = active?.id == c.id;

          // Bentuk chip mengikuti `CategoryItems` milik kit: pill 35px,
          // radius 40, AnimatedContainer 300ms.
          return Padding(
            padding: 10.pe,
            child: InkWell(
              onTap: () => onSelect(c),
              borderRadius: BorderRadius.circular(40),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 35,
                decoration: BoxDecoration(
                  color: selected
                      ? primary
                      : (isAppDarkMode() ? kDarkColor : kWhiteColor),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: primary),
                ),
                child: Center(
                  child: Text(
                    c.name,
                    style: AppStyles.styleMedium14(context).copyWith(
                      color: selected
                          ? kWhiteColor
                          : (isAppDarkMode()
                              ? const Color(0xffDAE8FF)
                              : primary),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 32.pa,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: kLightThirdColor),
            12.sbh,
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: kLightThirdColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.error, required this.onRetry});

  final DataError error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 12.pa,
      decoration: BoxDecoration(
        color: kErrorColor.withValues(alpha: isAppDarkMode() ? .18 : .08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kErrorColor.withValues(alpha: .4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kErrorColor, size: 20),
          8.sbw,
          Expanded(
            child: Text(
              errorMessageFor(context, error),
              style: AppStyles.styleRegular14(context).copyWith(
                color: isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
              ),
            ),
          ),
          if (error.isRetryable)
            TextButton(onPressed: onRetry, child: const Text('Coba lagi')),
        ],
      ),
    );
  }
}
