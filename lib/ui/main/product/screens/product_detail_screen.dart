import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/custom_app_bar.dart';
import 'package:navy_wear/core/utils/app_routes.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_buttons.dart';
import 'package:navy_wear/ui/main/product/cubit/product_detail_cubit.dart';
import 'package:navy_wear/ui/main/product/widgets/product_detail_sections.dart';
import 'package:navy_wear/util/error_message.dart';
import 'package:navy_wear/util/format_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Halaman detail penawaran.
///
/// **Mengikuti tata letak `product_details` milik UI kit**: `customAppBar`
/// dengan tombol bulat di kanan, `SingleChildScrollView(padding: 24.psh)`,
/// carousel + indikator, nama produk, baris harga besar dengan stepper qty
/// 27×27 khas kit, kartu berbingkai untuk deskripsi, dan `BottomAppBar`
/// berisi tombol utama.
///
/// Dua bagian kit yang digantikan karena tidak punya padanan di API:
///
/// * **Baris rating/ulasan** → info toko (skor, PKP, stok). Tidak ada tabel
///   maupun endpoint ulasan di backend, jadi bintang 4.4 dan "130 reviews"
///   di kit itu tidak bisa diisi dari mana pun.
/// * **Pemilih Color / Size** → **pemilih satuan**. Di kategori bahan
///   bangunan inilah pilihan yang sebenarnya: sak, dus, m².
///
/// Tiga bagian ditambahkan karena dituntut domainnya: kalkulator kebutuhan,
/// tabel harga bertingkat, dan daftar toko lain yang menjual barang sama.
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.offerId});

  final int offerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(offerId)..load(),
      child: const _ProductDetailBody(),
    );
  }
}

class _ProductDetailBody extends StatefulWidget {
  const _ProductDetailBody();

  @override
  State<_ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<_ProductDetailBody> {
  int _photoIndex = 0;
  final _carousel = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final cubit = ProductDetailCubit.get(context);

    return BlocConsumer<ProductDetailCubit, ProductDetailState>(
      listener: (context, state) {
        final message = state.cartMessage;
        if (message == null) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: kSuccessColor),
        );
        cubit.clearCartMessage();
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(
            context,
            'Detail Produk',
            action: Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                border: isAppDarkMode()
                    ? null
                    : Border.all(color: const Color(0xffBDD8FF), width: .2),
                shape: BoxShape.circle,
                color:
                    isAppDarkMode() ? kBlackColor : const Color(0xffF8F8F8),
              ),
              child: Icon(
                Icons.share_outlined,
                size: 20,
                color:
                    isAppDarkMode() ? kDarkSecondColor : kLightSecondColor,
              ),
            ),
          ),
          body: switch (state) {
            ProductDetailState(isLoading: true) =>
              const Center(child: CircularProgressIndicator()),
            ProductDetailState(offer: null, error: final e) when e != null =>
              _ErrorView(error: e, onRetry: cubit.load),
            ProductDetailState(offer: null) =>
              const Center(child: Text('Produk tidak ditemukan')),
            _ => _content(context, cubit, state),
          },
          bottomSheet: state.isReady ? _bottomBar(context, cubit, state) : null,
        );
      },
    );
  }

  Widget _content(
    BuildContext context,
    ProductDetailCubit cubit,
    ProductDetailState state,
  ) {
    final offer = state.offer!;
    final tiers = state.visibleTiers(isB2B: cubit.isB2B);
    final active = state.activeTier(isB2B: cubit.isB2B);

    return SingleChildScrollView(
      padding: 24.psh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.sbh,
          _photos(offer),
          16.sbh,
          Text(state.title, style: AppStyles.styleMedium16(context)),
          12.sbh,
          _sellerRow(context, state, offer),
          20.sbh,
          _priceAndQty(context, cubit, state, active),
          if (!state.meetsMinOrder) ...[
            10.sbh,
            _MinOrderWarning(
              shortfall: state.minOrderShortfall,
              baseUnit: state.sku?.baseUnit,
            ),
          ],
          28.sbh,
          UnitPicker(
            units: state.units,
            selected: state.selectedUnit,
            onSelect: cubit.selectUnit,
            conversionSummary: state.unitConversionSummary,
          ),
          if (state.hasCalculator) ...[
            28.sbh,
            RequirementCalculator(
              measureUnitName: state.measureUnit!.unitName,
              sellUnitName: state.selectedUnit!.unitName,
              wastePercent: (ProductDetailState.wasteAllowance * 100).round(),
              result: state.calculatorResult,
              onChanged: cubit.setCalculatorInput,
              onApply: cubit.applyCalculator,
            ),
          ],
          if (tiers.isNotEmpty) ...[
            28.sbh,
            PriceTierTable(
              tiers: tiers,
              baseUnit: state.sku?.baseUnit,
              activeTierId: active?.id,
            ),
          ],
          if (offer.description != null && offer.description!.isNotEmpty) ...[
            28.sbh,
            Text('Deskripsi', style: AppStyles.styleMedium16(context)),
            12.sbh,
            DetailCard(
              child: Text(
                offer.description!,
                style: AppStyles.styleRegular14(context).copyWith(
                  color: isAppDarkMode() ? kDarkThirdColor : kLightThirdColor,
                ),
              ),
            ),
          ],
          28.sbh,
          OtherSellerOffers(
            offers: state.otherOffers,
            sellerNames: state.sellers,
            isB2B: cubit.isB2B,
            onTap: (o) => router.push(AppRoutes.offerDetailPath(o.id)),
          ),
          // Ruang untuk bottomSheet, seperti di layar kit.
          100.sbh,
        ],
      ),
    );
  }

  Widget _photos(OfferModel offer) {
    final photos = offer.photos;
    if (photos.isEmpty) {
      return DetailCard(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 220,
          child: Center(
            child: Icon(
              offer.isFragile
                  ? Icons.warning_amber_outlined
                  : Icons.inventory_2_outlined,
              size: 48,
              color: kLightThirdColor,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carousel,
          itemCount: photos.length,
          options: CarouselOptions(
            aspectRatio: 1.2,
            viewportFraction: 1,
            enableInfiniteScroll: photos.length > 1,
            onPageChanged: (i, _) => setState(() => _photoIndex = i),
          ),
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              photos[index].url,
              fit: BoxFit.cover,
              width: double.infinity,
              // Foto seed menunjuk ke host contoh yang tidak dapat dijangkau.
              errorBuilder: (_, __, ___) => ColoredBox(
                color: isAppDarkMode() ? kDarkColor : kBorderColor,
                child: const Center(
                  child: Icon(Icons.image_not_supported_outlined,
                      color: kLightThirdColor, size: 40),
                ),
              ),
            ),
          ),
        ),
        if (photos.length > 1) ...[
          12.sbh,
          AnimatedSmoothIndicator(
            activeIndex: _photoIndex,
            count: photos.length,
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
      ],
    );
  }

  /// Menempati posisi baris rating di layar kit.
  ///
  /// Bintang dan jumlah ulasan tidak bisa ditampilkan: backend tidak punya
  /// tabel maupun endpoint ulasan sama sekali. Yang tersedia dan berguna:
  /// nama toko, skornya, status PKP, dan sisa stok.
  Widget _sellerRow(
    BuildContext context,
    ProductDetailState state,
    OfferModel offer,
  ) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Wrap(
      spacing: 12,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.storefront_outlined, size: 16, color: primary),
            6.sbw,
            Text(
              state.sellerName ?? 'Toko #${offer.sellerId}',
              style: AppStyles.styleMedium14(context).copyWith(color: primary),
            ),
          ],
        ),
        if (offer.sellerScore != null)
          Text(
            'skor ${offer.sellerScore!.toStringAsFixed(0)}',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kLightThirdColor),
          ),
        if (offer.isPkp)
          Text(
            'PKP · bisa faktur pajak',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kSuccessColor),
          ),
        if (offer.availableStock != null)
          Text(
            'stok ${offer.availableStock!.round()}',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kLightThirdColor),
          ),
        if (offer.isFragile)
          Text(
            'Pecah belah · retur 2×24 jam',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kErrorColor),
          ),
      ],
    );
  }

  /// Baris harga + stepper qty, mengikuti bentuk di layar kit (kotak 27×27,
  /// minus berbingkai dan plus terisi warna primer).
  Widget _priceAndQty(
    BuildContext context,
    ProductDetailCubit cubit,
    ProductDetailState state,
    PriceTierModel? active,
  ) {
    final unit = state.selectedUnit?.unitName ?? state.sku?.baseUnit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              active == null ? 'Harga belum tersedia' : formatRupiah(active.price),
              style: AppStyles.styleSemiBold24(context),
            ),
            if (active?.strikethroughPrice != null) ...[
              8.sbw,
              Text(
                formatRupiah(active!.strikethroughPrice),
                style: AppStyles.styleMedium10(context).copyWith(
                  color: const Color(0xffF76834),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
            const Spacer(),
            _StepperButton(
              icon: Icons.remove,
              filled: false,
              onPressed: cubit.minusQty,
            ),
            Padding(
              padding: 16.psh,
              child: Text(
                _qtyLabel(state.qty),
                style: AppStyles.styleSemiBold14(context).copyWith(
                  color: isAppDarkMode() ? kDarkSecondColor : null,
                ),
              ),
            ),
            _StepperButton(
              icon: Icons.add,
              filled: true,
              // Dimatikan di batas sampel, bukan dibiarkan lalu ditolak
              // server dengan SAMPLE_QTY_EXCEEDED.
              onPressed: state.atSampleLimit ? null : cubit.addQty,
            ),
          ],
        ),
        if (state.isSample) ...[
          6.sbh,
          Text(
            'Produk sampel — maksimal ${OfferModel.sampleMaxQty} pcs per '
            'transaksi.',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kWarningColor),
          ),
        ],
        6.sbh,
        Text(
          // Harga per satuan dasar, karena tier memakai satuan dasar.
          [
            if (state.sku?.baseUnit != null) 'per ${state.sku!.baseUnit}',
            if (unit != null && unit != state.sku?.baseUnit)
              'dibeli per $unit',
          ].join(' · '),
          style: AppStyles.styleRegular12(context)
              .copyWith(color: kLightThirdColor),
        ),
      ],
    );
  }

  Widget _bottomBar(
    BuildContext context,
    ProductDetailCubit cubit,
    ProductDetailState state,
  ) {
    // Kit punya dua tombol (Add to Cart + Buy Now). "Beli Sekarang" tidak
    // dibawa: alur checkout belum dibangun, dan tombol yang tidak melakukan
    // apa-apa lebih buruk daripada tidak ada tombol.
    return BottomAppBar(
      padding: 8.psv,
      color: isAppDarkMode() ? kDarkColor : kWhiteColor,
      elevation: 50,
      child: Padding(
        padding: 16.psh,
        child: CustomButton(
          onPressed: state.isAddingToCart ? null : cubit.addToCart,
          child: state.isAddingToCart
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  'Tambah ke Keranjang',
                  style: AppStyles.styleSemiBold14(context)
                      .copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }

  static String _qtyLabel(double v) =>
      v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(2);
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.icon,
    required this.filled,
    required this.onPressed,
  });

  final IconData icon;
  final bool filled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Container(
      width: 27,
      height: 27,
      decoration: ShapeDecoration(
        color: filled
            ? primary
            : (isAppDarkMode() ? const Color(0xffFAFAFA) : null),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: filled || isAppDarkMode()
              ? BorderSide.none
              : const BorderSide(width: .53, color: Color(0xFFC0C8C7)),
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: filled ? 19 : 15,
          color: filled ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

/// Peringatan minimum order.
///
/// Ditampilkan sebelum user mencoba checkout, bukan menunggu server membalas
/// `BELOW_MIN_ORDER` — aturan CRT-03 minta kekurangannya ditunjukkan.
class _MinOrderWarning extends StatelessWidget {
  const _MinOrderWarning({required this.shortfall, this.baseUnit});

  final double shortfall;
  final String? baseUnit;

  @override
  Widget build(BuildContext context) {
    final label = shortfall == shortfall.roundToDouble()
        ? '${shortfall.round()}'
        : shortfall.toStringAsFixed(2);

    return Container(
      padding: 10.pa,
      decoration: BoxDecoration(
        color: kWarningColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, size: 18, color: kWarningColor),
          8.sbw,
          Expanded(
            child: Text(
              'Kurang $label${baseUnit == null ? '' : ' $baseUnit'} lagi untuk '
              'memenuhi minimum order toko.',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kWarningColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});

  final DataError error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 32.pa,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 40, color: kErrorColor),
            12.sbh,
            Text(
              errorMessageFor(context, error),
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular14(context),
            ),
            16.sbh,
            if (error.isRetryable)
              CustomButton(
                width: 200,
                onPressed: onRetry,
                child: Text(
                  'Coba lagi',
                  style: AppStyles.styleMedium14(context)
                      .copyWith(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
