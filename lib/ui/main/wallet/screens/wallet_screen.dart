import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navy_wear/core/domain/model/wallet/wallet_models.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/function/custom_app_bar.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/ui/main/wallet/cubit/wallet_cubit.dart';
import 'package:navy_wear/util/error_message.dart';
import 'package:navy_wear/util/format_helper.dart';

/// Dompet / saldo Markas.
///
/// Saldo penting bukan karena fiturnya menarik, tapi karena `SALDO` adalah
/// **satu-satunya metode pembayaran yang benar-benar tuntas** di backend ini:
/// server membalas `LUNAS` seketika. VA dan QRIS masih `MOCK_GATEWAY`, jadi
/// nomor dan payload-nya tidak bisa dibayar di mana pun.
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WalletCubit()..load(),
      child: const _WalletBody(),
    );
  }
}

class _WalletBody extends StatelessWidget {
  const _WalletBody();

  @override
  Widget build(BuildContext context) {
    final cubit = WalletCubit.get(context);

    return Scaffold(
      appBar: customAppBar(context, 'Saldo Markas'),
      body: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          if (state.isLoading && state.entries.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: cubit.load,
            child: ListView(
              padding: 16.pa,
              children: [
                _BalanceCard(balance: state.balance),
                16.sbh,
                if (state.error != null) ...[
                  _ErrorNotice(message: errorMessageFor(context, state.error!)),
                  12.sbh,
                ],
                if (state.lastTopup != null) ...[
                  _TopupInstruction(
                    topup: state.lastTopup!,
                    onDismiss: cubit.dismissTopup,
                  ),
                  12.sbh,
                ],
                _TopupSection(state: state, cubit: cubit),
                24.sbh,
                Text('Mutasi', style: AppStyles.styleSemiBold16(context)),
                8.sbh,
                if (state.isEmpty)
                  Padding(
                    padding: 24.pa,
                    child: Text(
                      'Belum ada mutasi.',
                      textAlign: TextAlign.center,
                      style: AppStyles.styleRegular14(context)
                          .copyWith(color: kLightThirdColor),
                    ),
                  )
                else
                  for (final entry in state.entries) _EntryRow(entry: entry),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.balance});

  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 20.pa,
      decoration: BoxDecoration(
        color: isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saldo tersedia',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: Colors.white70),
          ),
          6.sbh,
          Text(
            formatRupiah(balance),
            style: AppStyles.styleSemiBold24(context)
                .copyWith(color: Colors.white),
          ),
          10.sbh,
          Text(
            'Dipakai untuk membayar pesanan tanpa lewat bank. '
            'Dana pengembalian pesanan yang dibayar dengan saldo akan '
            'kembali ke saldo ini, bukan ke rekening.',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

/// Form top-up.
///
/// Nominalnya sengaja tombol-tombol tetap, bukan kolom bebas: server menerima
/// angka apa pun, tapi pembeli yang mengetik "50.000" dengan titik akan
/// mengirim nilai yang salah, dan tidak ada validasi nominal di API.
class _TopupSection extends StatefulWidget {
  const _TopupSection({required this.state, required this.cubit});

  final WalletState state;
  final WalletCubit cubit;

  @override
  State<_TopupSection> createState() => _TopupSectionState();
}

class _TopupSectionState extends State<_TopupSection> {
  static const _amounts = [100000, 250000, 500000, 1000000, 2500000];

  int _amount = 500000;
  TopupMethod _method = TopupMethod.va;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.pa,
      decoration: BoxDecoration(
        color: isAppDarkMode() ? kDarkThirdColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kLightThirdColor.withValues(alpha: .25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Isi saldo', style: AppStyles.styleSemiBold16(context)),
          12.sbh,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final amount in _amounts)
                ChoiceChip(
                  label: Text(formatRupiah(amount)),
                  selected: _amount == amount,
                  labelStyle: AppStyles.styleRegular12(context).copyWith(
                    color: _amount == amount ? Colors.white : null,
                  ),
                  selectedColor:
                      isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor,
                  onSelected: (_) => setState(() => _amount = amount),
                ),
            ],
          ),
          16.sbh,
          Text('Metode', style: AppStyles.styleSemiBold14(context)),
          8.sbh,
          Wrap(
            spacing: 8,
            children: [
              for (final method in TopupMethod.renderable)
                ChoiceChip(
                  label: Text(method.label),
                  selected: _method == method,
                  labelStyle: AppStyles.styleRegular12(context).copyWith(
                    color: _method == method ? Colors.white : null,
                  ),
                  selectedColor:
                      isAppDarkMode() ? kDarkPrimaryColor : kLightPrimaryColor,
                  onSelected: (_) => setState(() => _method = method),
                ),
            ],
          ),
          16.sbh,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.state.isSubmitting
                  ? null
                  : () => widget.cubit
                      .topup(method: _method, amount: _amount),
              child: Text(
                widget.state.isSubmitting
                    ? 'Memproses…'
                    : 'Isi ${formatRupiah(_amount)}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Instruksi top-up yang baru dibuat.
class _TopupInstruction extends StatelessWidget {
  const _TopupInstruction({required this.topup, required this.onDismiss});

  final WalletTopupModel topup;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.pa,
      decoration: BoxDecoration(
        color: kWarningColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kWarningColor.withValues(alpha: .4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Top-up dibuat — belum masuk',
                  style: AppStyles.styleSemiBold14(context),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 18),
                onPressed: onDismiss,
              ),
            ],
          ),
          if (topup.topupNo != null)
            Text('No. ${topup.topupNo}',
                style: AppStyles.styleRegular12(context)),
          8.sbh,
          if (topup.vaNumber != null && topup.vaNumber!.isNotEmpty)
            SelectableText(
              'Virtual Account: ${topup.vaNumber}',
              style: AppStyles.styleSemiBold16(context),
            ),
          if (topup.qrisPayload != null && topup.qrisPayload!.isNotEmpty)
            SelectableText(
              'Kode QRIS: ${topup.qrisPayload}',
              style: AppStyles.styleRegular12(context),
            ),
          8.sbh,
          if (topup.expiresAt != null)
            Text(
              'Bayar sebelum ${formatServerDeadline(topup.expiresAt!)}',
              style: AppStyles.styleRegular12(context),
            ),
          8.sbh,
          Text(
            'Gateway pembayaran di server ini masih mode uji, jadi nomor di '
            'atas belum bisa dibayar lewat bank mana pun dan saldo belum '
            'bertambah.',
            style: AppStyles.styleRegular12(context)
                .copyWith(color: kWarningColor),
          ),
        ],
      ),
    );
  }
}

class _EntryRow extends StatelessWidget {
  const _EntryRow({required this.entry});

  final WalletEntryModel entry;

  @override
  Widget build(BuildContext context) {
    final incoming = entry.isIncoming;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            incoming ? Icons.south_west : Icons.north_east,
            size: 18,
            color: incoming ? kSuccessColor : kErrorColor,
          ),
          10.sbw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.typeLabel,
                    style: AppStyles.styleSemiBold14(context)),
                if (entry.note != null && entry.note!.isNotEmpty)
                  Text(
                    entry.note!,
                    style: AppStyles.styleRegular12(context)
                        .copyWith(color: kLightThirdColor),
                  ),
                if (entry.createdDate != null)
                  Text(
                    formatServerDeadline(entry.createdDate!),
                    style: AppStyles.styleRegular12(context)
                        .copyWith(color: kLightThirdColor),
                  ),
              ],
            ),
          ),
          8.sbw,
          Text(
            formatRupiah(entry.amount.abs().round()),
            style: AppStyles.styleSemiBold14(context).copyWith(
              color: incoming ? kSuccessColor : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorNotice extends StatelessWidget {
  const _ErrorNotice({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 12.pa,
      decoration: BoxDecoration(
        color: kErrorColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: AppStyles.styleRegular12(context).copyWith(color: kErrorColor),
      ),
    );
  }
}
