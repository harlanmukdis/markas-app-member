import 'package:flutter/material.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';
import 'package:navy_wear/core/utils/extensions.dart';
import 'package:navy_wear/util/error_message.dart';

/// Menampilkan kegagalan di dalam alur form, bukan sebagai SnackBar.
///
/// Disengaja: SnackBar menghilang sendiri dan mudah terlewat, sedangkan
/// kegagalan login/daftar adalah hal yang perlu user baca lalu tindak lanjuti.
/// Untuk kegagalan yang bisa dicoba ulang ([DataError.isRetryable]) tombol
/// "coba lagi" ditampilkan; untuk kredensial salah tidak, karena mengulang
/// request yang sama tidak akan mengubah hasilnya.
class AuthErrorBanner extends StatelessWidget {
  const AuthErrorBanner({super.key, required this.error, this.onRetry});

  final DataError error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final showRetry = onRetry != null && error.isRetryable;

    return Container(
      width: double.infinity,
      padding: 12.pa,
      decoration: BoxDecoration(
        color: kErrorColor.withValues(alpha: isAppDarkMode() ? .18 : .08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kErrorColor.withValues(alpha: .4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          if (showRetry)
            TextButton(
              onPressed: onRetry,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Coba lagi',
                style: AppStyles.styleMedium14(context)
                    .copyWith(color: kErrorColor),
              ),
            ),
        ],
      ),
    );
  }
}
