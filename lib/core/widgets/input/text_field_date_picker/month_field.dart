import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class MonthField extends StatelessWidget {
  MonthField({
    super.key,
    required this.monthFocusNode,
    required this.onMovePointer,
    required this.monthController,
    required this.onChangeData,
    this.isEnabled = true,
    this.initialValue,
  });

  final bool isEnabled;
  final int? initialValue;
  bool isUnit = true;
  String previousValue = '';
  final TextEditingController monthController;
  final VoidCallback onChangeData;
  final FocusNode monthFocusNode;
  final void Function(
      {bool? isDate,
      bool? isMonth,
      bool? isYear,
      bool? isHour,
      bool? isMinute}) onMovePointer;

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      monthController.text = initialValue.toString().padLeft(2, '0');
      previousValue = monthController.text;
      isUnit = initialValue! >= 10;
    }
    return Flexible(
      child: IntrinsicWidth(
        child: TextField(
          focusNode: monthFocusNode,
          controller: monthController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
            LengthLimitingTextInputFormatter(2),
          ],
          onChanged: (value) {
            if (value == '') {
              previousValue = '';
              return;
            }
            if (!isUnit) {
              // case nhập data hàng chục
              isUnit = true;
              final newValue = int.tryParse(previousValue + value)!;
              // trường hợp <0 hoặc >12 thì reset về 12
              monthController.text = (newValue > 0 && newValue < 13)
                  ? newValue.toString().padLeft(2, '0')
                  : '12';
              onMovePointer(isMonth: true);
            } else {
              // case nhập data hàng đơn vị
              isUnit = false;
              monthController.text = value != '0' ? '0$value' : '01';
            }
            previousValue = monthController.text;
            onChangeData();
          },
          style: textTheme.labelLarge?.copyWith(
            color: AppColor.c_323F4B,
          ),
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
            hintText: 'mm',
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
