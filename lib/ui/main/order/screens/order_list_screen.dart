import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/custom_app_bar.dart';
import 'package:navy_wear/core/utils/app_routes.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/ui/main/order/cubit/order_list_cubit.dart';
import 'package:navy_wear/ui/main/order/widgets/order_status_chip.dart';
import 'package:navy_wear/util/error_message.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Daftar pesanan, dikelompokkan per tab status.
///
/// Memakai `TabBar` seperti `trending_view` kit. Tab-nya mengikuti status
/// **order induk**, bukan status pengiriman: satu order bisa punya beberapa
/// pengiriman dengan status berbeda, jadi memfilter berdasarkan itu akan
/// membuat satu pesanan muncul di dua tab sekaligus.
class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderListCubit()..load(),
      child: const _OrderListBody(),
    );
  }
}

class _OrderListBody extends StatelessWidget {
  const _OrderListBody();

  @override
  Widget build(BuildContext context) {
    final cubit = OrderListCubit.get(context);

    return BlocBuilder<OrderListCubit, OrderListState>(
      builder: (context, state) {
        return DefaultTabController(
          length: OrderTab.values.length,
          child: Scaffold(
            appBar: customAppBar(context, 'Pesanan Saya'),
            body: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: isAppDarkMode()
                      ? kDarkPrimaryColor
                      : kLightPrimaryColor,
                  indicatorWeight: 3,
                  labelColor: isAppDarkMode()
                      ? kDarkSecondColor
                      : const Color(0xff222222),
                  unselectedLabelColor: kLightThirdColor,
                  labelStyle: AppStyles.styleSemiBold14(context),
                  unselectedLabelStyle: AppStyles.styleRegular14(context),
                  onTap: (i) => cubit.selectTab(OrderTab.values[i]),
                  tabs: [
                    for (final tab in OrderTab.values)
                      Tab(
                        text: state.countFor(tab) > 0
                            ? '${tab.label} (${state.countFor(tab)})'
                            : tab.label,
                      ),
                  ],
                ),
                Expanded(
                  child: switch (state) {
                    OrderListState(isLoading: true) =>
                      const Center(child: CircularProgressIndicator()),
                    OrderListState(error: final e) when e != null => Center(
                        child: Padding(
                          padding: 32.pa,
                          child: Text(
                            errorMessageFor(context, e),
                            textAlign: TextAlign.center,
                            style: AppStyles.styleRegular14(context),
                          ),
                        ),
                      ),
                    _ => RefreshIndicator(
                        onRefresh: cubit.load,
                        child: state.visibleOrders.isEmpty
                            ? _EmptyTab(tab: state.tab)
                            : ListView.builder(
                                padding: 16.pa,
                                itemCount: state.visibleOrders.length,
                                itemBuilder: (context, i) => _OrderCard(
                                  order: state.visibleOrders[i],
                                ),
                              ),
                      ),
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final needsAction = order.shipmentsAwaitingConfirmation.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => router.push(AppRoutes.orderDetailPath(order.id)),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: 14.pa,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor),
            color: isAppDarkMode() ? kDarkColor : kWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      order.orderNo ?? 'Pesanan #${order.id}',
                      style: AppStyles.styleMedium14(context),
                    ),
                  ),
                  OrderStatusChip(status: order.status),
                ],
              ),
              8.sbh,
              Text(
                '${order.subOrders.isEmpty ? '' : '${order.subOrders.length} toko · '}'
                '${formatServerDate(order.createdDate)}',
                style: AppStyles.styleRegular12(context)
                    .copyWith(color: kLightThirdColor),
              ),
              8.sbh,
              Row(
                children: [
                  Text(
                    formatRupiah(order.grandTotal),
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: isAppDarkMode()
                          ? kDarkPrimaryColor
                          : kLightPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, color: kLightThirdColor),
                ],
              ),
              if (order.canPay && order.paymentDeadline != null) ...[
                8.sbh,
                // Waktu ABSOLUT, bukan hitung mundur: batas waktu dari server
                // masih bergeser 5 jam karena bug jam PHP vs MySQL, dan
                // hitung mundur akan terasa presisi padahal salah.
                Text(
                  formatServerDeadline(order.paymentDeadline,
                      prefix: 'Bayar sebelum'),
                  style: AppStyles.styleRegular12(context)
                      .copyWith(color: kWarningColor),
                ),
              ],
              if (needsAction) ...[
                8.sbh,
                Container(
                  padding: 8.pa,
                  decoration: BoxDecoration(
                    color: kSuccessColor.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Barang sudah sampai — konfirmasi penerimaan',
                    style: AppStyles.styleRegular12(context)
                        .copyWith(color: kSuccessColor),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyTab extends StatelessWidget {
  const _EmptyTab({required this.tab});

  final OrderTab tab;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        80.sbh,
        const Icon(Icons.receipt_long_outlined,
            size: 48, color: kLightThirdColor),
        16.sbh,
        Text(
          'Tidak ada pesanan di "${tab.label}"',
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: kLightThirdColor),
        ),
      ],
    );
  }
}
