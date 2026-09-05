import 'package:flutter/material.dart';
import 'package:navy_wear/core/function/components.dart';
import 'package:navy_wear/core/utils/app_styles.dart';
import 'package:navy_wear/core/utils/constant.dart';

/// Label di atas field, mengikuti gaya form yang sudah ada di UI kit.
class AuthFieldLabel extends StatelessWidget {
  const AuthFieldLabel(this.text, {super.key, this.isRequired = false});

  final String text;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.styleMedium14(context)
              .copyWith(color: isAppDarkMode() ? null : kLightThirdColor),
        ),
        if (isRequired)
          Text(
            ' *',
            style: AppStyles.styleMedium14(context).copyWith(color: kErrorColor),
          ),
      ],
    );
  }
}
