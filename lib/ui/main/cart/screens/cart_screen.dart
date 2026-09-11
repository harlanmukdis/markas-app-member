import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_routes.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_buttons.dart';
import 'package:navy_wear/ui/main/cart/cubit/cart_cubit.dart';
import 'package:navy_wear/util/error_message.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Layar keranjang.
///
/// Mengikuti pola `my_cart` milik UI kit: header jumlah item, baris barang
/// dalam kontainer ber-radius 8 dengan shadow lembut, foto 55×55, dan stepper
/// qty `IconButton` minus/plus. Dua hal berbeda karena dituntut domainnya:
///
/// 1. **Dikelompokkan per toko.** Minimum order, ongkir, dan pembatalan
///    semuanya berlaku per toko, jadi setiap toko dapat kartunya sendiri.
/// 2. **Tidak ada total.** Kit menampilkan subtotal/ongkir/total di keranjang;
///    di sini tidak bisa dan tidak boleh. Harga **tidak dikunci di keranjang**
///    (CRT-02) dan aturan §10.4 melarang perhitungan uang di sisi tampilan —
///    server menghitung ulang semuanya saat checkout. Yang ditampilkan hanya
///    harga per satuan sebagai acuan, dengan penanda jelas.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..load(),
      child: const _CartBody(),
    );
  }
}

class _CartBody extends StatelessWidget {
  const _CartBody();

  @override
  Widget build(BuildContext context) {
    final cubit = CartCubit.get(context);

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        final message = state.message;
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          cubit.clearMessage();
          return;
        }
        final error = state.error;
        if (error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_cartMessage(context, error)),
              backgroundColor: kErrorColor,
            ),
          );
          cubit.clearMessage();
        }
      },
      builder: (context, state) {
        if (state.isLoading && state.groups.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.isEmpty) return const _EmptyCart();

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: cubit.load,
                  child: ListView(
                    padding: 16.pb,
                    children: [
                      16.sbh,
                      _Header(state: state, onClear: cubit.clear),
                      16.sbh,
                      for (final group in state.groups)
                        _SellerGroupCard(group: group, cubit: cubit),
                      16.sbh,
                      _VoucherSection(state: state, cubit: cubit),
                      16.sbh,
                      const _PriceDisclaimer(),
                    ],
                  ),
                ),
              ),
              _BottomBar(state: state),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.state, required this.onClear});

  final CartState state;
  final Future<void> Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.psh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${state.itemCount} barang di keranjang',
            style: AppStyles.styleMedium18(context),
          ),
          TextButton(
            onPressed: state.isClearing ? null : onClear,
            child: Text(
              'Kosongkan',
              style: AppStyles.styleMedium14(context)
                  .copyWith(color: kDeleteColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _SellerGroupCard extends StatelessWidget {
  const _SellerGroupCard({required this.group, required this.cubit});

  final CartSellerGroup group;
  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Padding(
      padding: 24.psh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.storefront_outlined, size: 16, color: primary),
              6.sbw,
              Expanded(
                child: Text(
                  group.displayName,
                  style:
                      AppStyles.styleMedium14(context).copyWith(color: primary),
                ),
              ),
            ],
          ),
          8.sbh,
          for (final line in group.lines)
            _CartLineTile(line: line, cubit: cubit),
          16.sbh,
        ],
      ),
    );
  }
}

class _CartLineTile extends StatelessWidget {
  const _CartLineTile({required this.line, required this.cubit});

  final CartLine line;
  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    final price = line.referencePrice(isB2B: cubit.isB2B);
    final busy = cubit.state.isBusy(line.id);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Dismissible(
        key: ValueKey(line.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          padding: 20.pe,
          decoration: BoxDecoration(
            color: kDeleteColor.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.delete_outline, color: kDeleteColor),
        ),
        onDismissed: (_) => cubit.removeLine(line),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0x115A6CEA).withValues(alpha: .07),
                blurRadius: 50,
                offset: const Offset(12, 26),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: isAppDarkMode() ? kLightSecondColor : kWhiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  _Thumb(url: line.photoUrl),
                  16.sbw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          line.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.styleMedium14(context).copyWith(
                            color: isAppDarkMode()
                                ? kDarkSecondColor
                                : kLightSecondColor,
                          ),
                        ),
                        4.sbh,
                        Text(
                          price == null
                              ? 'Harga belum tersedia'
                              : '${formatRupiah(price)}'
                                  '${line.unitName == null ? '' : ' / ${line.unitName}'}',
                          style: AppStyles.styleSemiBold14(context).copyWith(
                            color: isAppDarkMode()
                                ? kDarkPrimaryColor
                                : kLightPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _QtyStepper(line: line, cubit: cubit, busy: busy),
                ],
              ),
              if (line.isInactive || line.belowMinOrder) ...[
                8.sbh,
                _LineWarning(line: line),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QtyStepper extends StatelessWidget {
  const _QtyStepper({
    required this.line,
    required this.cubit,
    required this.busy,
  });

  final CartLine line;
  final CartCubit cubit;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final atMax = line.maxQty != null && line.qty >= line.maxQty!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          icon: const Icon(Icons.remove, size: 16),
          onPressed: busy || line.qty <= 1
              ? null
              : () => cubit.setQty(line, line.qty - 1),
        ),
        SizedBox(
          width: 34,
          child: busy
              ? const Center(
                  child: SizedBox(
                    height: 14,
                    width: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : Text(
                  _qtyLabel(line.qty),
                  textAlign: TextAlign.center,
                  style: AppStyles.styleSemiBold14(context),
                ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          icon: const Icon(Icons.add, size: 16),
          // Dimatikan di batas sampel (ORD-16), bukan dibiarkan lalu ditolak
          // server dengan SAMPLE_QTY_EXCEEDED.
          onPressed: busy || atMax ? null : () => cubit.setQty(line, line.qty + 1),
        ),
      ],
    );
  }

  static String _qtyLabel(double v) =>
      v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(2);
}

/// Peringatan per baris, ditampilkan **sebelum** user menekan checkout.
///
/// Keduanya akan ditolak server (`OFFER_NOT_ACTIVE`, `BELOW_MIN_ORDER`), dan
/// jauh lebih baik user tahu di sini daripada setelah menekan tombol bayar.
class _LineWarning extends StatelessWidget {
  const _LineWarning({required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context) {
    final inactive = line.isInactive;
    final shortfall = line.minOrderShortfall;
    final label = shortfall == shortfall.roundToDouble()
        ? '${shortfall.round()}'
        : shortfall.toStringAsFixed(2);

    return Container(
      width: double.infinity,
      padding: 8.pa,
      decoration: BoxDecoration(
        color: (inactive ? kErrorColor : kWarningColor)
            .withValues(alpha: .1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        inactive
            ? 'Penawaran ini sudah tidak aktif. Hapus dari keranjang untuk '
                'melanjutkan.'
            : 'Kurang $label${line.unitName == null ? '' : ' ${line.unitName}'} '
                'lagi untuk memenuhi minimum order toko.',
        style: AppStyles.styleRegular12(context)
            .copyWith(color: inactive ? kErrorColor : kWarningColor),
      ),
    );
  }
}

/// Penjelasan kenapa keranjang tidak menampilkan total.
class _PriceDisclaimer extends StatelessWidget {
  const _PriceDisclaimer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.psh,
      child: Container(
        padding: 12.pa,
        decoration: BoxDecoration(
          color: kBorderColor.withValues(alpha: isAppDarkMode() ? .15 : .6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline, size: 18, color: kLightThirdColor),
            8.sbw,
            Expanded(
              child: Text(
                'Harga di atas adalah acuan per satuan. Total, ongkir, dan '
                'diskon dihitung server saat checkout — harga bisa berubah '
                'kalau stok atau tier hargamu berubah.',
                style: AppStyles.styleRegular12(context)
                    .copyWith(color: kLightThirdColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.state});

  final CartState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.pa,
      decoration: BoxDecoration(
        color: isAppDarkMode() ? kDarkColor : kWhiteColor,
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 20, offset: Offset(0, -2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (state.hasBlockingIssue) ...[
            Text(
              'Ada barang yang perlu dibereskan dulu sebelum checkout.',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kWarningColor),
            ),
            8.sbh,
          ],
          CustomButton(
            onPressed: state.hasBlockingIssue || state.itemCount == 0
                ? null
                : () => router.push(AppRoutes.checkoutOrder),
            child: Text(
              'Lanjut ke Checkout',
              style: AppStyles.styleSemiBold14(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: kBorderColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Icon(Icons.inventory_2_outlined,
          size: 22, color: kLightThirdColor),
    );
    if (url == null) return placeholder;

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        url!,
        width: 55,
        height: 55,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => placeholder,
        loadingBuilder: (_, child, p) => p == null ? child : placeholder,
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 32.pa,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag_outlined,
                size: 48, color: kLightThirdColor),
            16.sbh,
            Text(
              'Keranjangmu masih kosong',
              style: AppStyles.styleMedium16(context),
            ),
            8.sbh,
            Text(
              'Telusuri katalog atau cari bahan yang kamu butuhkan.',
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

/// Voucher keranjang.
///
/// Angka potongan yang tampil di sini datang dari `discount_amount_preview`
/// dan **hanya ada tepat setelah voucher dipasang** — `GET /cart/view` tidak
/// mengirimkannya. Karena itu setelah keranjang dimuat ulang yang tersisa
/// cuma kodenya, dan itu memang jujur: server memvalidasi ulang voucher saat
/// checkout terhadap nilai final, lalu **melewatinya diam-diam** kalau sudah
/// tidak memenuhi syarat.
class _VoucherSection extends StatefulWidget {
  const _VoucherSection({required this.state, required this.cubit});

  final CartState state;
  final CartCubit cubit;

  @override
  State<_VoucherSection> createState() => _VoucherSectionState();
}

class _VoucherSectionState extends State<_VoucherSection> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _apply() {
    widget.cubit.applyVoucher(_controller.text);
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Container(
      margin: 16.psh,
      padding: 14.pa,
      decoration: BoxDecoration(
        color: isAppDarkMode() ? kDarkThirdColor : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kLightThirdColor.withValues(alpha: .25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Voucher', style: AppStyles.styleSemiBold14(context)),
          10.sbh,
          for (final voucher in state.vouchers)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Icon(Icons.local_offer_outlined,
                      size: 16, color: kSuccessColor),
                  8.sbw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(voucher.code,
                            style: AppStyles.styleSemiBold14(context)),
                        Text(
                          voucher.isPlatform
                              ? 'Voucher Markas'
                              : 'Voucher toko',
                          style: AppStyles.styleRegular12(context)
                              .copyWith(color: kLightThirdColor),
                        ),
                      ],
                    ),
                  ),
                  if (state.discountPreviews[voucher.code] != null)
                    Text(
                      '-${formatRupiah(state.discountPreviews[voucher.code]!)}',
                      style: AppStyles.styleSemiBold14(context)
                          .copyWith(color: kSuccessColor),
                    ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: state.isVoucherBusy
                        ? null
                        : () => widget.cubit.removeVoucher(voucher.code),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  textCapitalization: TextCapitalization.characters,
                  style: AppStyles.styleRegular14(context),
                  decoration: InputDecoration(
                    hintText: 'Masukkan kode voucher',
                    hintStyle: AppStyles.styleRegular12(context)
                        .copyWith(color: kLightThirdColor),
                    isDense: true,
                    border: const OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _apply(),
                ),
              ),
              8.sbw,
              TextButton(
                onPressed: state.isVoucherBusy ? null : _apply,
                child: Text(
                  state.isVoucherBusy ? 'Memeriksa…' : 'Pakai',
                  style: AppStyles.styleSemiBold14(context),
                ),
              ),
            ],
          ),
          if (state.vouchers.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                'Potongan final dihitung ulang saat checkout.',
                style: AppStyles.styleRegular12(context)
                    .copyWith(color: kLightThirdColor),
              ),
            ),
        ],
      ),
    );
  }
}

/// Pesan untuk kegagalan yang khas keranjang.
///
/// Kode voucher tidak lewat [errorMessageFor] karena pesannya harus
/// menyebutkan **tindakan** yang bisa diambil pembeli, dan kunci l10n-nya
/// belum ada. Pola yang sama dipakai `_checkoutMessage` di layar checkout.
String _cartMessage(BuildContext context, DataError error) {
  switch (error.code) {
    case ApiErrorCode.notFound:
      return 'Kode voucher tidak ditemukan atau sudah tidak berlaku.';
    case ApiErrorCode.emptyCart:
      return 'Keranjang masih kosong — masukkan barang dulu sebelum '
          'memakai voucher.';
    case ApiErrorCode.sellerNotInCart:
      return 'Voucher ini untuk toko yang barangnya belum ada di keranjang.';
    case ApiErrorCode.alreadyAttached:
      return 'Voucher ini sudah menempel di keranjang.';
  }
  return errorMessageFor(context, error);
}
