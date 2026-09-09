import 'package:flutter/material.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';

/// Label status berwarna.
///
/// Nilai status datang sebagai string dari server dan **tidak** dipetakan ke
/// enum: backend bisa menambah status kapan saja, dan status yang tidak
/// dikenal harus tetap tampil apa adanya daripada membuat layar gagal.
class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        _labelFor(status),
        style: AppStyles.styleMedium10(context).copyWith(color: color),
      ),
    );
  }

  static Color _colorFor(String status) => switch (status) {
        'MENUNGGU_BAYAR' || 'MENUNGGU_KONFIRMASI_STOK' => kWarningColor,
        'DIBAYAR' || 'DP_DIBAYAR' || 'BERJALAN' || 'DIKIRIM' ||
        'DIPROSES' || 'SIAP' =>
          kLightPrimaryColor,
        'SELESAI' || 'SAMPAI' || 'CAIR' => kSuccessColor,
        'DIBATALKAN' || 'KEDALUWARSA' || 'DIHENTIKAN' || 'GAGAL_KIRIM' =>
          kErrorColor,
        _ => kLightThirdColor,
      };

  /// Status mentah dibuat enak dibaca tanpa memetakan satu per satu, supaya
  /// status baru dari backend tetap tampil wajar.
  static String _labelFor(String status) {
    if (status.isEmpty) return '-';
    return status
        .split('_')
        .map((w) => w.isEmpty
            ? w
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
        .join(' ');
  }
}
