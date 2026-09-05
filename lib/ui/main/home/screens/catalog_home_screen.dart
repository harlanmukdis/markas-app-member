import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_text_form_field.dart';
import 'package:navy_wear/ui/main/home/cubit/catalog_home_cubit.dart';
import 'package:navy_wear/ui/main/home/widgets/offer_card.dart';
import 'package:navy_wear/util/error_message.dart';

/// Home berbasis katalog Markas, menggantikan `HomePage` milik UI kit.
///
/// `HomePage` lama menampilkan tab t-shirt/blazer/sepatu dari 11 objek
/// `ProductModel` yang di-hardcode di `HomePageCubit` — tidak ada kaitannya
/// dengan bahan bangunan dan tidak menyentuh API sama sekali. Layar ini
/// mengambil semuanya dari server.
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
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = CatalogHomeCubit.get(context);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: cubit.refresh,
          child: BlocBuilder<CatalogHomeCubit, CatalogHomeState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: 16.psh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.sbh,
                          _Header(isB2B: cubit.isB2B),
                          16.sbh,
                          CustomTextFormField(
                            filled: true,
                            controller: _searchController,
                            hintText: 'Cari bahan bangunan…',
                            textInputAction: TextInputAction.search,
                            prefix: const Icon(Icons.search, size: 20),
                            onSubmitted: cubit.search,
                          ),
                          16.sbh,
                          if (state.error != null) ...[
                            _ErrorBox(
                              error: state.error!,
                              onRetry: cubit.refresh,
                            ),
                            16.sbh,
                          ],
                          _Categories(
                            categories: state.categories,
                            active: state.activeCategory,
                            isLoading: state.isLoadingCategories,
                            onSelect: cubit.openCategory,
                            onClear: () {
                              _searchController.clear();
                              cubit.showBrowse();
                            },
                          ),
                          16.sbh,
                          _SectionTitle(state: state),
                          8.sbh,
                        ],
                      ),
                    ),
                  ),
                  if (state.isLoadingOffers)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (state.mode == CatalogHomeMode.browse)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: 16.psh,
                        child: Text(
                          'Pilih kategori di atas, atau cari langsung dengan '
                          'kolom pencarian.',
                          style: AppStyles.styleRegular14(context)
                              .copyWith(color: kLightThirdColor),
                        ),
                      ),
                    )
                  else if (state.isEmptyResult)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: 16.pa,
                        child: _EmptyResult(state: state),
                      ),
                    )
                  else
                    SliverList.separated(
                      itemCount: state.offers.length,
                      separatorBuilder: (_, __) => 12.sbh,
                      itemBuilder: (context, index) {
                        final offer = state.offers[index];
                        return Padding(
                          padding: 16.psh,
                          child: OfferCard(
                            offer: offer,
                            title: state.offerTitle(offer),
                            unitName: state.offerUnit(offer),
                            isB2B: cubit.isB2B,
                          ),
                        );
                      },
                    ),
                  SliverToBoxAdapter(child: 24.sbh),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.isB2B});

  final bool isB2B;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Markas Bangunan',
                style: AppStyles.styleSemiBold18(context).copyWith(
                  color:
                      isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
                ),
              ),
              4.sbh,
              Text(
                // Segmen harga ditampilkan supaya user B2B tahu ia sedang
                // melihat harga proyek, bukan harga retail.
                isB2B ? 'Harga proyek (B2B)' : 'Harga retail',
                style: AppStyles.styleRegular12(context)
                    .copyWith(color: kLightThirdColor),
              ),
            ],
          ),
        ),
        if (isB2B)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: kSuccessColor.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'B2B',
              style: AppStyles.styleMedium12(context)
                  .copyWith(color: kSuccessColor),
            ),
          ),
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({
    required this.categories,
    required this.active,
    required this.isLoading,
    required this.onSelect,
    required this.onClear,
  });

  final List<CategoryModel> categories;
  final CategoryModel? active;
  final bool isLoading;
  final ValueChanged<CategoryModel> onSelect;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    if (isLoading && categories.isEmpty) {
      return const SizedBox(
        height: 36,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    if (categories.isEmpty) return const SizedBox.shrink();

    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (active != null)
          ActionChip(
            avatar: const Icon(Icons.close, size: 16),
            label: const Text('Semua'),
            onPressed: onClear,
          ),
        for (final c in categories)
          ChoiceChip(
            selected: active?.id == c.id,
            label: Text(c.name),
            labelStyle: AppStyles.styleRegular12(context).copyWith(
              color: active?.id == c.id
                  ? primary
                  : (isAppDarkMode() ? kDarkSecondColor : kLightSecondColor),
            ),
            selectedColor: primary.withValues(alpha: .12),
            side: BorderSide(color: active?.id == c.id ? primary : kBorderColor),
            onSelected: (_) => onSelect(c),
          ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.state});

  final CatalogHomeState state;

  @override
  Widget build(BuildContext context) {
    final text = switch (state.mode) {
      CatalogHomeMode.browse => 'Kategori',
      CatalogHomeMode.searchResults => 'Hasil untuk “${state.keyword}”',
      CatalogHomeMode.categoryOffers =>
        state.activeCategory?.name ?? 'Penawaran',
    };

    return Text(
      text,
      style: AppStyles.styleSemiBold16(context).copyWith(
        color: isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
      ),
    );
  }
}

class _EmptyResult extends StatelessWidget {
  const _EmptyResult({required this.state});

  final CatalogHomeState state;

  @override
  Widget build(BuildContext context) {
    final message = state.mode == CatalogHomeMode.searchResults
        ? 'Tidak ada hasil untuk “${state.keyword}”. Coba kata lain, '
            'misalnya nama produk atau merek.'
        : 'Belum ada penawaran di kategori ini.';

    return Column(
      children: [
        const Icon(Icons.search_off, size: 40, color: kLightThirdColor),
        12.sbh,
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: kLightThirdColor),
        ),
      ],
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
                color:
                    isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
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
