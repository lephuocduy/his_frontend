import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class YearField extends StatelessWidget {
  YearField({
    super.key,
    required this.yearFocusNode,
    required this.onMovePointer,
    required this.yearController,
    required this.onChangeData,
    this.isEnabled = true,
    this.initialValue,
  });

  final bool isEnabled;
  final int? initialValue;
  final FocusNode yearFocusNode;
  final VoidCallback onChangeData;
  final void Function(
      {bool? isDate,
      bool? isMonth,
      bool? isYear,
      bool? isHour,
      bool? isMinute}) onMovePointer;

  int isUnit = 0;
  String previousValue = '';

  final TextEditingController yearController;

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      yearController.text = initialValue.toString().padLeft(4, '0');
      previousValue = yearController.text;
      if (initialValue! >= 1000) {
        isUnit = 0;
      } else if (initialValue! >= 100) {
        isUnit = 3;
      } else if (initialValue! >= 10) {
        isUnit = 2;
      } else {
        isUnit = 1;
      }
    }
    return Flexible(
      child: IntrinsicWidth(
        child: TextField(
          focusNode: yearFocusNode,
          controller: yearController,
          onChanged: (value) {
            if (value == '') {
              previousValue = '';
              return;
            }
            if (isUnit > 0) {
              // case nhập data hàng chục
              isUnit++;
              final newValue = int.tryParse(previousValue + value)!;
              // trường hợp <0 hoặc >9999 thì reset về 9999
              yearController.text = (newValue > 0 && newValue < 10000)
                  ? newValue.toString().padLeft(4, '0')
                  : '9999';
              if (isUnit > 3) {
                isUnit = 0;
                onMovePointer(isYear: true);
              }
            } else {
              // case nhập data hàng đơn vị
              isUnit++;
              yearController.text = value != '0' ? '000$value' : '0001';
            }
            previousValue = yearController.text;
            onChangeData();
          },
          style: textTheme.labelLarge?.copyWith(
            color: AppColor.c_323F4B,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
            LengthLimitingTextInputFormatter(4),
          ],
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabled: isEnabled,
            contentPadding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.transparent,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.transparent,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.transparent,
              ),
            ),
            fillColor: AppColor.transparent,
            hintText: 'yyyy',
            hintStyle: textTheme.labelLarge?.copyWith(
              color: AppColor.c_979797,
            ),
            filled: true,
          ),
        ),
      ),
    );
  }
}
