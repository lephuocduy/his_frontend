import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';

class AppButtonOutline extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;
  final String? title;
  final Color? backgroundColor;
  final Color? outLineColor;
  final Color? textColor;
  final bool isEnabled;
  final double? height;
  final double? width;
  final double? widthBorder;
  final double? radius;

  const AppButtonOutline({
    super.key,
    this.onTap,
    this.icon,
    this.title,
    this.backgroundColor,
    this.outLineColor,
    this.textColor,
    this.isEnabled = true,
    this.height,
    this.width,
    this.widthBorder,
    this.radius,
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
              color: backgroundColor ?? AppColor.white,
              borderRadius: BorderRadius.circular(radius ?? 6),
              border: Border.all(
                color: outLineColor ?? AppColor.colorBorderBlue,
                width: widthBorder ?? 1.5,
              ),
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
                      color: textColor ?? AppColor.c_006EA9,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
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
