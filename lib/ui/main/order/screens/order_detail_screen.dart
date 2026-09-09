import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/domain/model/payment/payment_model.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/custom_app_bar.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/core/widgets/custom_buttons.dart';
import 'package:navy_wear/ui/main/order/cubit/order_detail_cubit.dart';
import 'package:navy_wear/ui/main/order/widgets/order_status_chip.dart';
import 'package:navy_wear/util/error_message.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Detail pesanan, tiga lapis: order → sub-order → pengiriman.
///
/// Struktur ini yang paling sering salah dimodelkan, dan konsekuensinya nyata
/// di layar ini:
///
/// * Tombol **"Pesanan Diterima" ada di level pengiriman**, bukan order —
///   satu pesanan bisa punya beberapa pengiriman dengan status berbeda.
/// * Rincian uang dibaca apa adanya dari server; aplikasi tidak menjumlahkan
///   apa pun.
/// * Batas waktu ditampilkan sebagai **waktu absolut**, bukan hitung mundur,
///   selama bug selisih jam 5 jam di backend belum beres.
class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.orderId});

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderDetailCubit(orderId)..load(),
      child: const _OrderDetailBody(),
    );
  }
}

class _OrderDetailBody extends StatelessWidget {
  const _OrderDetailBody();

  @override
  Widget build(BuildContext context) {
    final cubit = OrderDetailCubit.get(context);

    return BlocConsumer<OrderDetailCubit, OrderDetailState>(
      listenWhen: (p, n) => p.message != n.message || p.error != n.error,
      listener: (context, state) {
        final text = state.message ??
            (state.error == null ? null : errorMessageFor(context, state.error!));
        if (text == null) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(text),
            backgroundColor: state.error == null ? kSuccessColor : kErrorColor,
          ),
        );
        cubit.clearMessage();
      },
      builder: (context, state) {
        final order = state.order;

        return Scaffold(
          appBar: customAppBar(context, 'Detail Pesanan'),
          body: switch (state) {
            OrderDetailState(isLoading: true) =>
              const Center(child: CircularProgressIndicator()),
            OrderDetailState(order: null) => Center(
                child: Padding(
                  padding: 32.pa,
                  child: Text(
                    state.error == null
                        ? 'Pesanan tidak ditemukan'
                        : errorMessageFor(context, state.error!),
                    textAlign: TextAlign.center,
                    style: AppStyles.styleRegular14(context),
                  ),
                ),
              ),
            _ => RefreshIndicator(
                onRefresh: cubit.load,
                child: ListView(
                  padding: 20.psh,
                  children: [
                    16.sbh,
                    _OrderHeader(order: order!),
                    16.sbh,
                    if (state.awaitingStockConfirmation)
                      const _AwaitingStockNotice(),
                    if (state.needsPayment) ...[
                      _PaymentSection(state: state, cubit: cubit),
                      16.sbh,
                    ],
                    _CostBreakdown(order: order),
                    16.sbh,
                    for (final sub in order.subOrders)
                      _SubOrderCard(sub: sub, state: state, cubit: cubit),
                    if (order.canCancel) ...[
                      8.sbh,
                      _CancelButton(state: state, cubit: cubit),
                    ],
                    32.sbh,
                  ],
                ),
              ),
          },
        );
      },
    );
  }
}

class _OrderHeader extends StatelessWidget {
  const _OrderHeader({required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                order.orderNo ?? 'Pesanan #${order.id}',
                style: AppStyles.styleSemiBold16(context),
              ),
            ),
            OrderStatusChip(status: order.status),
          ],
        ),
        4.sbh,
        Text(
          formatServerDateTime(order.createdDate),
          style: AppStyles.styleRegular12(context)
              .copyWith(color: kLightThirdColor),
        ),
        if (order.allOrNothing) ...[
          8.sbh,
          Text(
            'Semua atau tidak sama sekali — kalau satu toko membatalkan, '
            'seluruh pesanan dibatalkan dan dana kembali penuh.',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kLightThirdColor),
          ),
        ],
        if (order.hasCustomItem) ...[
          8.sbh,
          Text(
            'Ada barang custom di pesanan ini — tidak bisa dibatalkan setelah '
            'toko mulai memproses.',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kWarningColor),
          ),
        ],
      ],
    );
  }
}

/// Tagihan belum terbit — jangan tampilkan tombol bayar.
class _AwaitingStockNotice extends StatelessWidget {
  const _AwaitingStockNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: 12.pa,
      decoration: BoxDecoration(
        color: kWarningColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.hourglass_empty, size: 18, color: kWarningColor),
          8.sbw,
          Expanded(
            child: Text(
              'Menunggu konfirmasi ketersediaan dari toko (maksimal 1×24 jam '
              'kerja). Tagihan belum terbit, jadi belum ada yang perlu '
              'dibayar.',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kWarningColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentSection extends StatelessWidget {
  const _PaymentSection({required this.state, required this.cubit});

  final OrderDetailState state;
  final OrderDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    final payment = state.payment;
    final order = state.order!;

    return Container(
      padding: 14.pa,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pembayaran', style: AppStyles.styleSemiBold16(context)),
          if (order.paymentDeadline != null) ...[
            4.sbh,
            Text(
              formatServerDeadline(order.paymentDeadline,
                  prefix: 'Bayar sebelum'),
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kWarningColor),
            ),
          ],
          12.sbh,
          if (payment == null || !state.hasPaymentInstructions)
            _MethodPicker(state: state, cubit: cubit)
          else
            _PaymentInstructions(payment: payment),
        ],
      ),
    );
  }
}

class _MethodPicker extends StatelessWidget {
  const _MethodPicker({required this.state, required this.cubit});

  final OrderDetailState state;
  final OrderDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    final forced = state.order?.forcedBankTransfer ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (forced)
          Container(
            padding: 10.pa,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: kWarningColor.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Pesanan bernilai besar hanya bisa dibayar lewat transfer bank. '
              'Detail rekening tujuan dikonfirmasi tim kami — hubungi CS '
              'setelah membuat tagihan.',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kWarningColor),
            ),
          ),
        for (final method in state.selectableMethods)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CustomButton(
              backColor: Colors.transparent,
              elevation: 0,
              onPressed: state.isInitiatingPayment
                  ? null
                  : () => cubit.initiatePayment(method),
              child: Text(
                'Bayar dengan ${method.label}',
                style: AppStyles.styleSemiBold14(context),
              ),
            ),
          ),
        if (state.isInitiatingPayment)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
      ],
    );
  }
}

/// Instruksi pembayaran.
///
/// Hanya VA dan QRIS yang punya isi untuk ditampilkan. Gateway masih **mock
/// penuh** — nomor VA dan payload QRIS adalah string palsu, jadi ini alur
/// pengujian, bukan pembayaran sungguhan.
class _PaymentInstructions extends StatelessWidget {
  const _PaymentInstructions({required this.payment});

  final PaymentModel payment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                payment.methodEnum?.label ?? payment.method ?? 'Pembayaran',
                style: AppStyles.styleMedium14(context),
              ),
            ),
            OrderStatusChip(status: payment.status),
          ],
        ),
        8.sbh,
        Text(
          formatRupiah(payment.amount),
          style: AppStyles.styleSemiBold18(context),
        ),
        if (payment.hasVirtualAccount) ...[
          12.sbh,
          Text('Nomor Virtual Account',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kLightThirdColor)),
          4.sbh,
          Row(
            children: [
              Expanded(
                child: SelectableText(
                  payment.vaNumber!,
                  style: AppStyles.styleSemiBold16(context),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, size: 18),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: payment.vaNumber!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nomor VA disalin')),
                  );
                },
              ),
            ],
          ),
        ],
        if (payment.hasQris) ...[
          12.sbh,
          Text('Kode QRIS',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kLightThirdColor)),
          4.sbh,
          // Payload QRIS belum dirender jadi gambar QR: nilainya masih string
          // palsu dari MOCK_GATEWAY, jadi QR-nya tidak akan bisa dipindai.
          SelectableText(
            payment.qrisPayload!,
            maxLines: 3,
            style: AppStyles.styleRegular12(context),
          ),
        ],
        if (payment.expiresAt != null) ...[
          12.sbh,
          Text(
            formatServerDeadline(payment.expiresAt, prefix: 'Berlaku sampai'),
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kWarningColor),
          ),
        ],
        12.sbh,
        Container(
          padding: 10.pa,
          decoration: BoxDecoration(
            color: kBorderColor.withValues(alpha: .6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Status pembayaran diperbarui otomatis setiap 10 detik. Payment '
            'gateway masih mode uji, jadi nomor di atas belum bisa dipakai '
            'membayar sungguhan.',
            style: AppStyles.styleRegular10(context)
                .copyWith(color: kLightThirdColor),
          ),
        ),
      ],
    );
  }
}

/// Rincian biaya — dibaca apa adanya dari server.
class _CostBreakdown extends StatelessWidget {
  const _CostBreakdown({required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 14.pa,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        children: [
          _row(context, 'Subtotal', order.subtotal),
          _row(context, 'Ongkir', order.shippingTotal),
          if (order.discountTotal > 0)
            _row(context, 'Diskon', -order.discountTotal),
          if (order.taxTotal > 0) _row(context, 'Pajak', order.taxTotal),
          if (order.serviceFee > 0)
            _row(context, 'Biaya layanan', order.serviceFee),
          const Divider(height: 20),
          _row(context, 'Total', order.grandTotal, emphasize: true),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, int value,
      {bool emphasize = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            label,
            style: emphasize
                ? AppStyles.styleSemiBold16(context)
                : AppStyles.styleRegular14(context),
          ),
          const Spacer(),
          Text(
            formatRupiah(value),
            style: emphasize
                ? AppStyles.styleSemiBold16(context).copyWith(
                    color: isAppDarkMode()
                        ? kDarkPrimaryColor
                        : kLightPrimaryColor,
                  )
                : AppStyles.styleMedium14(context),
          ),
        ],
      ),
    );
  }
}

class _SubOrderCard extends StatelessWidget {
  const _SubOrderCard({
    required this.sub,
    required this.state,
    required this.cubit,
  });

  final SubOrderModel sub;
  final OrderDetailState state;
  final OrderDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    final primary = isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: 14.pa,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.storefront_outlined, size: 16, color: primary),
              6.sbw,
              Expanded(
                child: Text(
                  sub.subOrderNo ?? 'Toko #${sub.sellerId}',
                  style:
                      AppStyles.styleMedium14(context).copyWith(color: primary),
                ),
              ),
              OrderStatusChip(status: sub.status),
            ],
          ),
          if (sub.sellerConfirmDeadline != null && sub.status.contains('MENUNGGU')) ...[
            6.sbh,
            Text(
              formatServerDeadline(sub.sellerConfirmDeadline,
                  prefix: 'Toko konfirmasi sebelum'),
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kWarningColor),
            ),
          ],
          if (sub.cancelReason != null) ...[
            6.sbh,
            Text(
              'Alasan batal: ${sub.cancelReason}',
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: kErrorColor),
            ),
          ],
          12.sbh,
          for (final item in sub.items) _ItemRow(item: item),
          if (sub.shipments.isNotEmpty) ...[
            12.sbh,
            const Divider(height: 1),
            8.sbh,
            for (final shipment in sub.shipments)
              _ShipmentTile(
                shipment: shipment,
                busy: state.isShipmentBusy(shipment.id),
                onComplete: () => cubit.completeShipment(shipment.id),
              ),
          ],
        ],
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item});

  final OrderItemModel item;

  @override
  Widget build(BuildContext context) {
    final qty = item.qty == item.qty.roundToDouble()
        ? '${item.qty.round()}'
        : item.qty.toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemName ?? 'Barang #${item.offerId}',
                  style: AppStyles.styleRegular14(context),
                ),
                2.sbh,
                Text(
                  // `unit_name_snapshot` masih selalu "unit" di backend, jadi
                  // menampilkannya justru menyesatkan — hanya qty dan harga
                  // satuan yang ditampilkan.
                  '$qty × ${formatRupiah(item.unitPrice)}',
                  style: AppStyles.styleRegular10(context)
                      .copyWith(color: kLightThirdColor),
                ),
              ],
            ),
          ),
          8.sbw,
          Text(
            formatRupiah(item.lineSubtotal),
            style: AppStyles.styleMedium14(context),
          ),
        ],
      ),
    );
  }
}

class _ShipmentTile extends StatelessWidget {
  const _ShipmentTile({
    required this.shipment,
    required this.busy,
    required this.onComplete,
  });

  final ShipmentModel shipment;
  final bool busy;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_shipping_outlined,
                  size: 16, color: kLightThirdColor),
              6.sbw,
              Expanded(
                child: Text(
                  shipment.shipmentNo ?? 'Pengiriman #${shipment.id}',
                  style: AppStyles.styleRegular12(context),
                ),
              ),
              OrderStatusChip(status: shipment.status),
            ],
          ),
          if (shipment.suratJalanNo != null) ...[
            4.sbh,
            Text(
              'Surat jalan ${shipment.suratJalanNo}',
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kLightThirdColor),
            ),
          ],
          if (shipment.hasPod) ...[
            4.sbh,
            Text(
              'Diterima ${shipment.podReceiverName ?? ''} · '
              '${formatServerDateTime(shipment.podUploadedAt)}',
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kSuccessColor),
            ),
          ],
          if (shipment.returnDeadline != null) ...[
            4.sbh,
            Text(
              // Jendela retur: 2×24 jam untuk pecah belah, 7 hari lainnya.
              formatServerDeadline(shipment.returnDeadline,
                  prefix: 'Bisa ajukan retur sampai'),
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kLightThirdColor),
            ),
          ],
          if (shipment.canComplete) ...[
            8.sbh,
            // Tombol ini ada di level PENGIRIMAN, bukan order.
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: busy ? null : onComplete,
                child: busy
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Pesanan Diterima',
                        style: AppStyles.styleSemiBold14(context)
                            .copyWith(color: Colors.white),
                      ),
              ),
            ),
            4.sbh,
            Text(
              'Kalau tidak dikonfirmasi, sistem menyelesaikannya otomatis 3 '
              'hari setelah barang sampai.',
              style: AppStyles.styleRegular10(context)
                  .copyWith(color: kLightThirdColor),
            ),
          ],
        ],
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({required this.state, required this.cubit});

  final OrderDetailState state;
  final OrderDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: state.isCancelling
          ? null
          : () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Batalkan pesanan?'),
                  content: const Text(
                    'Pesanan hanya bisa dibatalkan sebelum toko mulai '
                    'memproses. Setelah itu pembatalan butuh persetujuan toko '
                    'lewat CS.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Tidak'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Batalkan'),
                    ),
                  ],
                ),
              );
              if (confirmed == true) await cubit.cancel();
            },
      child: Text(
        'Batalkan pesanan',
        style: AppStyles.styleMedium14(context).copyWith(color: kDeleteColor),
      ),
    );
  }
}
