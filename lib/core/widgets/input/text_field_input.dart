import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';

import 'required_label.dart';

class TextFieldInput extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Color? fillColor;
  final double? height;
  final double? width;
  final bool isEnabled;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final bool isRequired;
  final TextAlign? textAlign;
  final Widget? prevIconWidget;
  final bool textAlignEndTitle;
  final double? widthTitle;
  final Widget? suffIconWidget;
  final int? maxLines;
  final bool isCrossAxisAlignmentTopTitle;
  final int flex;
  final int? minLines;
  final TextEditingController? controller;
  final bool? useBorder;
  final bool? usePadding;
  const TextFieldInput({
    super.key,
    this.title,
    this.hintText = '',
    this.isEnabled = true,
    this.fillColor,
    this.height = 36.0,
    this.width,
    this.onChanged,
    this.initialValue,
    this.isRequired = false,
    this.textAlign,
    this.prevIconWidget,
    this.textAlignEndTitle = false,
    this.widthTitle,
    this.suffIconWidget,
    this.maxLines,
    this.controller,
    this.minLines,
    this.isCrossAxisAlignmentTopTitle = false,
    this.flex = 1,
    this.useBorder = true,
    this.usePadding = true,
  });

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Row(
        crossAxisAlignment: widget.isCrossAxisAlignmentTopTitle
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (widget.title != null) ...[
            if (widget.isRequired) ...[
              SizedBox(
                width: widget.widthTitle,
                child: Row(
                  mainAxisAlignment: widget.textAlignEndTitle
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    RequiredLabel(
                      widget.title ?? '',
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColor.c_323F4B,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              SizedBox(
                width: widget.widthTitle,
                child: Text(
                  widget.title ?? '',
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColor.c_323F4B,
                  ),
                  textAlign: widget.textAlignEndTitle ? TextAlign.end : null,
                ),
              ),
            ],
            spaceW12,
          ],
          if (widget.prevIconWidget != null) ...[
            widget.prevIconWidget!,
            spaceW8,
          ],
          Expanded(
            child: SizedBox(
              height: widget.height,
              width: widget.width,
              child: Center(
                child: TextFormField(
                  minLines: widget.minLines,
                  initialValue: widget.initialValue,
                  controller: widget.controller,
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColor.c_323F4B,
                  ),
                  textAlign: widget.textAlign ?? TextAlign.start,
                  maxLines: widget.maxLines,
                  decoration: InputDecoration(
                    enabled: widget.isEnabled,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: widget.usePadding == true ? 22 : 0),
                    enabledBorder: widget.useBorder == true
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 1,
                              color: AppColor.colorBorderGrey,
                            ),
                          )
                        : InputBorder.none,
                    focusedBorder: widget.useBorder == true
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 1,
                              color: AppColor.colorBorderGrey,
                            ),
                          )
                        : InputBorder.none,
                    border: widget.useBorder == true
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 1,
                              color: AppColor.colorBorderGrey,
                            ),
                          )
                        : InputBorder.none,
                    disabledBorder: widget.useBorder == true
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 1,
                              color: AppColor.colorBorderGrey,
                            ),
                          )
                        : InputBorder.none,
                    hintText: widget.hintText,
                    hintMaxLines: 2,
                    fillColor: widget.fillColor ?? AppColor.c_FFFFFF,
                    hintStyle: textTheme.labelLarge?.copyWith(
                      color: AppColor.c_979797,
                    ),
                    filled: true,
                    suffixIcon: widget.suffIconWidget,
                  ),
                  onChanged: widget.onChanged,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
