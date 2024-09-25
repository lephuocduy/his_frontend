import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class DayField extends StatelessWidget {
  DayField({
    super.key,
    required this.dayFocusNode,
    required this.onMovePointer,
    required this.dayController,
    required this.onChangeData,
    this.isEnabled = true,
    this.initialValue,
  });

  final bool isEnabled;
  final int? initialValue;
  final FocusNode dayFocusNode;
  final void Function(
      {bool? isDate,
      bool? isMonth,
      bool? isYear,
      bool? isHour,
      bool? isMinute}) onMovePointer;
  final VoidCallback onChangeData;

  bool isUnit = true;

  String previousValue = '';

  final TextEditingController dayController;

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      dayController.text = initialValue.toString().padLeft(2, '0');
      previousValue = dayController.text;
      isUnit = initialValue! >= 10;
    }
    return Flexible(
      child: IntrinsicWidth(
        child: TextFormField(
          focusNode: dayFocusNode,
          controller: dayController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
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
              // trường hợp <0 hoặc >31 thì reset về 31
              dayController.text = (newValue > 0 && newValue < 32)
                  ? newValue.toString().padLeft(2, '0')
                  : '31';
              onMovePointer(isDate: true);
            } else {
              // case nhập data hàng đơn vị
              isUnit = false;
              dayController.text = value != '0' ? '0$value' : '01';
            }
            previousValue = dayController.text;
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
            hintText: 'dd',
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
