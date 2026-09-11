import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/address/address_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/custom_app_bar.dart';
import 'package:navy_wear/core/utils/app_routes.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_buttons.dart';
import 'package:navy_wear/ui/main/checkout/cubit/checkout_cubit.dart';
import 'package:navy_wear/ui/main/checkout/screens/address_form_sheet.dart';
import 'package:navy_wear/util/error_message.dart';

/// Layar checkout.
///
/// Mengikuti `checkout_view` kit pada bagian yang masih relevan: `customAppBar`,
/// seksi alamat dengan pilihan dan tautan "tambah alamat baru", lalu tombol
/// utama di bawah.
///
/// Yang **tidak** dibawa dari kit dan alasannya:
///
/// * **Pemilih metode pembayaran** — di API ini pembayaran adalah langkah
///   terpisah setelah order terbit (`POST /payments/initiate` butuh
///   `order_id`), dan untuk order besar metodenya dipaksa server. Memilih
///   metode di sini akan menjanjikan sesuatu yang belum bisa dipastikan.
/// * **Rincian subtotal/ongkir/total** — belum ada angkanya. Server baru
///   menghitungnya saat `POST /checkout`, dan aturan §10.4 melarang aplikasi
///   menghitung uang sendiri.
/// * **Peta & instruksi pengiriman** — tidak ada endpointnya.
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckoutCubit()
        ..loadAddresses()
        ..loadCartVouchers(),
      child: const _CheckoutBody(),
    );
  }
}

class _CheckoutBody extends StatelessWidget {
  const _CheckoutBody();

  @override
  Widget build(BuildContext context) {
    final cubit = CheckoutCubit.get(context);

    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listenWhen: (prev, next) =>
          prev.result != next.result || prev.error != next.error,
      listener: (context, state) {
        final result = state.result;
        if (result != null) {
          // Voucher yang tidak lagi memenuhi syarat dibuang server tanpa
          // menggagalkan checkout. Peringatannya dipasang sebelum pindah
          // layar dan bertahan lintas rute karena ScaffoldMessenger-nya milik
          // MaterialApp, bukan Scaffold layar ini.
          if (state.voucherSkipped) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Voucher ${state.cartVoucherCodes.join(", ")} tidak dipakai '
                  'karena pesanan akhirnya tidak memenuhi syarat voucher. '
                  'Tagihan di bawah sudah tanpa potongan itu.',
                ),
                backgroundColor: kWarningColor,
                duration: const Duration(seconds: 8),
              ),
            );
          }

          // Dua percabangan yang wajib dibedakan: order biasa langsung ke
          // pembayaran; order di atas ambang BELUM punya tagihan dan harus
          // menunggu konfirmasi toko lebih dulu.
          router.go(AppRoutes.orderDetailPath(result.orderId));
          return;
        }
        final error = state.error;
        if (error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_checkoutMessage(context, error)),
              backgroundColor: kErrorColor,
              duration: const Duration(seconds: 5),
            ),
          );
          cubit.clearError();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(context, 'Checkout'),
          body: state.isLoadingAddresses && state.addresses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: 24.psh,
                  children: [
                    16.sbh,
                    _AddressSection(state: state, cubit: cubit),
                    24.sbh,
                    _AllOrNothingSection(state: state, cubit: cubit),
                    24.sbh,
                    const _CostNotice(),
                    100.sbh,
                  ],
                ),
          bottomSheet: _BottomBar(state: state, cubit: cubit),
        );
      },
    );
  }

  /// Pesan khusus untuk kegagalan checkout.
  ///
  /// Kode-kode ini butuh penjelasan yang bisa ditindaklanjuti, bukan pesan
  /// generik: user harus tahu apa yang perlu diubah di keranjangnya.
  static String _checkoutMessage(BuildContext context, DataError error) {
    return switch (error.code) {
      'BELOW_MIN_ORDER' =>
        'Ada barang yang jumlahnya di bawah minimum order toko. Tambah '
            'jumlahnya di keranjang lalu coba lagi.',
      'OFFER_NOT_ACTIVE' =>
        'Salah satu penawaran sudah dinonaktifkan toko. Hapus dari keranjang '
            'lalu coba lagi.',
      'STOCK_RESERVATION_FAILED' =>
        'Stok keburu habis saat pesanan diproses. Muat ulang keranjang untuk '
            'melihat sisa stok.',
      'SELLER_NOT_VERIFIED' =>
        'Salah satu toko sedang tidak bisa berjualan. Hapus barang dari toko '
            'itu untuk melanjutkan.',
      'NO_WAREHOUSE' =>
        'Toko belum punya gudang terdaftar, jadi pesanan tidak bisa diproses.',
      'NO_PRICE_TIER' =>
        'Tidak ada harga yang berlaku untuk jumlah ini. Coba ubah jumlahnya '
            'di keranjang.',
      'EMPTY_CART' => 'Keranjangmu kosong.',
      'ADDRESS_NOT_FOUND' => 'Alamat tidak ditemukan. Pilih alamat lain.',
      _ => errorMessageFor(context, error),
    };
  }
}

class _AddressSection extends StatelessWidget {
  const _AddressSection({required this.state, required this.cubit});

  final CheckoutState state;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Alamat pengiriman', style: AppStyles.styleSemiBold16(context)),
        12.sbh,
        if (state.hasNoAddress)
          const _Notice(
            icon: Icons.location_off_outlined,
            color: kWarningColor,
            text: 'Belum ada alamat. Tambah alamat dulu — koordinatnya '
                'dipakai server untuk menghitung zona ongkir.',
          )
        else
          for (final address in state.usableAddresses)
            _AddressTile(
              address: address,
              selected: address.id == state.selectedAddressId,
              onTap: () => cubit.selectAddress(address.id),
            ),
        if (state.unusableAddresses.isNotEmpty) ...[
          8.sbh,
          _Notice(
            icon: Icons.info_outline,
            color: kWarningColor,
            text: '${state.unusableAddresses.length} alamat tidak bisa '
                'dipakai karena belum punya koordinat.',
          ),
        ],
        8.sbh,
        TextButton.icon(
          onPressed: () => showAddressFormSheet(context, cubit),
          icon: Icon(Icons.add, size: 18, color: primary),
          label: Text(
            'Tambah alamat baru',
            style: AppStyles.styleMedium14(context).copyWith(color: primary),
          ),
        ),
      ],
    );
  }
}

class _AddressTile extends StatelessWidget {
  const _AddressTile({
    required this.address,
    required this.selected,
    required this.onTap,
  });

  final AddressModel address;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: 12.pa,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: selected ? primary : kBorderColor),
            color: selected ? primary.withValues(alpha: .06) : null,
          ),
          child: Row(
            children: [
              Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 20,
                color: selected ? primary : kLightThirdColor,
              ),
              12.sbw,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          address.displayLabel,
                          style: AppStyles.styleMedium14(context),
                        ),
                        if (address.isDefault) ...[
                          6.sbw,
                          Text(
                            '· utama',
                            style: AppStyles.styleRegular10(context)
                                .copyWith(color: kSuccessColor),
                          ),
                        ],
                      ],
                    ),
                    2.sbh,
                    Text(
                      '${address.recipientName} · ${address.phone}',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: kLightThirdColor),
                    ),
                    2.sbh,
                    Text(
                      address.shortAddress,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: kLightThirdColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Opsi "semua atau tidak sama sekali" (CRT-08).
class _AllOrNothingSection extends StatelessWidget {
  const _AllOrNothingSection({required this.state, required this.cubit});

  final CheckoutState state;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 12.pa,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semua atau tidak sama sekali',
                  style: AppStyles.styleMedium14(context),
                ),
                4.sbh,
                Text(
                  'Kalau salah satu toko membatalkan, seluruh pesanan '
                  'dibatalkan dan dana dikembalikan penuh. Berguna kalau '
                  'materialnya harus datang lengkap — semen tanpa pasir '
                  'tidak berguna.',
                  style: AppStyles.styleRegular12(context)
                      .copyWith(color: kLightThirdColor),
                ),
              ],
            ),
          ),
          Switch(
            value: state.allOrNothing,
            onChanged: cubit.setAllOrNothing,
          ),
        ],
      ),
    );
  }
}

/// Penjelasan kenapa belum ada rincian biaya di layar ini.
class _CostNotice extends StatelessWidget {
  const _CostNotice();

  @override
  Widget build(BuildContext context) {
    return const _Notice(
      icon: Icons.receipt_long_outlined,
      color: kLightThirdColor,
      text: 'Subtotal, ongkir, dan total dihitung server saat pesanan dibuat, '
          'lalu ditampilkan lengkap di halaman pesanan sebelum kamu membayar.',
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({
    required this.icon,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 12.pa,
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          8.sbw,
          Expanded(
            child: Text(
              text,
              style: AppStyles.styleRegular12(context).copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.state, required this.cubit});

  final CheckoutState state;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.pa,
      color: isAppDarkMode() ? kDarkColor : kWhiteColor,
      child: CustomButton(
        onPressed: state.canSubmit ? cubit.submit : null,
        child: state.isSubmitting
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                'Buat Pesanan',
                style: AppStyles.styleSemiBold14(context)
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
