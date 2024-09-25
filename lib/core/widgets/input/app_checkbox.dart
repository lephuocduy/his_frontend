import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    this.prefixTitle,
    this.value,
    this.isEnabled,
    this.suffixTitle,
    this.onTap,
    this.styleTitle,
  });

  final String? prefixTitle;
  final bool? value;
  final bool? isEnabled;
  final String? suffixTitle;
  final VoidCallback? onTap;
  final TextStyle? styleTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixTitle != null) ...[
          Text(
            prefixTitle!,
            style: styleTitle ??
                textTheme.labelLarge?.copyWith(
                  color: AppColor.c_323F4B,
                ),
          ),
          spaceW4,
        ],
        InkWell(
          onTap: (isEnabled ?? true) ? onTap : null,
          child: (value ?? false)
              ? const Icon(
                  Icons.check_box,
                  color: AppColor.colorCheckBox,
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!(isEnabled ?? true))
                      Container(
                        width: 16,
                        height: 16,
                        color: AppColor.c_F5F5F5,
                      ),
                    const Icon(
                      Icons.check_box_outline_blank,
                      color: AppColor.colorUnCheckBox,
                    ),
                  ],
                ),
        ),
        if (suffixTitle != null) ...[
          spaceW4,
          Text(
            suffixTitle!,
            style: styleTitle ??
                textTheme.labelLarge?.copyWith(
                  color: AppColor.c_323F4B,
                ),
          ),
        ],
      ],
    );
  }
}
