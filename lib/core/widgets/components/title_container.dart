import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
    required this.title,
    required this.child,
    this.button = const SizedBox.shrink(),
    this.backgroundColor,
  });

  final String title;
  final Widget child;
  final Widget button;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColor.colorBorderGrey.withOpacity(0.5))),
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColor.c_D8F1FD,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColor.c_323F4B,
                  ),
                ),
                button,
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
