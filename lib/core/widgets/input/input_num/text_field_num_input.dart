import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/input/required_label.dart';

import 'num_input_type_enum.dart';

class TextFieldNumInput extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Color? fillColor;
  final double? height;
  final bool isEnabled;
  final void Function(num?)? onChanged;
  final num? initialValue;
  final bool isRequired;
  final TextAlign? textAlign;
  final bool textAlignEndTitle;
  final double? widthTitle;
  final NumInputType numInputType;
  final bool isExpanded;
  final int flex;
  final bool isValid;

  const TextFieldNumInput({
    super.key,
    this.title,
    this.hintText = '',
    this.isEnabled = true,
    this.fillColor,
    this.height,
    this.onChanged,
    this.initialValue,
    this.isRequired = false,
    this.textAlign,
    this.textAlignEndTitle = false,
    this.widthTitle,
    required this.numInputType,
    this.isExpanded = false,
    this.flex = 1,
    this.isValid = true,
  });

  @override
  State<TextFieldNumInput> createState() => _TextFieldNumInputState();
}

class _TextFieldNumInputState extends State<TextFieldNumInput> {
  @override
  Widget build(BuildContext context) {
    return widget.isExpanded
        ? Expanded(
            flex: widget.flex,
            child: _row(),
          )
        : _row();
  }

  Widget _row() {
    return Row(
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
        widget.isExpanded
            ? Expanded(child: _textFormField())
            : _textFormField(),
      ],
    );
  }

  Widget _textFormField() {
    double effectiveHeight = widget.height ?? 36.0;
    return SizedBox(
      height: effectiveHeight,
      width:
          widget.numInputType == NumInputType.nonNegativeDecimalMax10 ? 74 : 80,
      child: TextFormField(
        style: textTheme.labelLarge?.copyWith(
          color: widget.isValid ? AppColor.c_323F4B : AppColor.c_D84226,
        ),
        keyboardType: TextInputType.numberWithOptions(
          decimal: widget.numInputType == NumInputType.nonNegativeInteger
              ? false
              : true,
          signed: widget.numInputType == NumInputType.decimal ? true : null,
        ),
        inputFormatters: widget.numInputType.inputFormatters,
        // inputFormatters: [
        //   if (widget.numInputType == NumInputType.normal) ...[
        //     FilteringTextInputFormatter.allow(
        //       RegExp(r'^\d*$'),
        //     ),
        //   ] else if (widget.numInputType ==
        //       NumInputType.nonNegativeInteger) ...[
        //     FilteringTextInputFormatter.allow(
        //       RegExp(r'^[1-9]\d*$'),
        //     ),
        //   ] else if (widget.numInputType ==
        //       NumInputType.nonNegativeDecimal) ...[
        //     FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$'))
        //   ] else if (widget.numInputType ==
        //       NumInputType.nonNegativeDecimalMax999) ...[
        //     LengthLimitingTextInputFormatter(6),
        //     FilteringTextInputFormatter.allow(
        //       RegExp(r'^([1-9]?[0-9]?[0-9]?(\.\d{0,2})?)$'),
        //     ),
        //   ] else if (widget.numInputType ==
        //       NumInputType.nonNegativeDecimalMax100) ...[
        //     LengthLimitingTextInputFormatter(6),
        //     FilteringTextInputFormatter.allow(
        //       RegExp(r'^(100|[1-9]?[0-9]?(\.\d{0,2})?)$'),
        //     ),
        //   ] else if (widget.numInputType ==
        //       NumInputType.nonNegativeDecimalMax10) ...[
        //     LengthLimitingTextInputFormatter(5),
        //     FilteringTextInputFormatter.allow(
        //       RegExp(r'^(10|[0-9]?(\.\d{0,2})?)$'),
        //     ),
        //   ] else ...[
        //     FilteringTextInputFormatter.allow(
        //       RegExp(r'^-?\d*\.?\d{0,2}$'),
        //     ),
        //   ],
        // ],
        initialValue: widget.initialValue?.toString(),
        textAlign: widget.textAlign ?? TextAlign.center,
        decoration: InputDecoration(
          enabled: widget.isEnabled,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.colorBorderGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.colorBorderGrey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.colorBorderGrey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.colorBorderGrey,
            ),
          ),
          hintText: widget.hintText,
          fillColor: widget.fillColor ??
              (widget.isEnabled ? AppColor.c_FFFFFF : AppColor.c_F5F5F5),
          hintStyle: textTheme.labelLarge?.copyWith(
            color: AppColor.c_979797,
          ),
          filled: true,
        ),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!.call(value.isEmpty ? null : num.parse(value));
          }
        },
      ),
    );
  }
}
