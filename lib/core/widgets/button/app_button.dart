import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isEnabled;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    this.onTap,
    this.icon,
    this.title,
    this.backgroundColor,
    this.textColor,
    this.isEnabled = true,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Stack(
        children: [
          Container(
            height: height ?? 32,
            width: width,
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColor.colorButtonBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  icon!,
                ],
                if (icon != null && title != null) ...[
                  spaceW4,
                ],
                if (title != null) ...[
                  Text(
                    title!,
                    style: textTheme.bodyMedium?.copyWith(
                      color: textColor ?? AppColor.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (!isEnabled)
            Positioned.fill(
              child: Container(
                color: AppColor.white.withOpacity(0.5),
              ),
            )
        ],
      ),
    );
  }
}
