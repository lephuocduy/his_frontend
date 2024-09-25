import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class HourField extends StatelessWidget {
  HourField({
    super.key,
    required this.hourFocusNode,
    required this.onMovePointer,
    required this.hourController,
    required this.onChangeData,
    this.isEnabled = true,
    this.initialValue,
  });

  final bool isEnabled;
  final int? initialValue;
  final FocusNode hourFocusNode;
  final void Function(
      {bool? isDate,
      bool? isMonth,
      bool? isYear,
      bool? isHour,
      bool? isMinute}) onMovePointer;

  bool isUnit = true;
  final VoidCallback onChangeData;

  String previousValue = '';

  final TextEditingController hourController;

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      hourController.text = initialValue.toString().padLeft(2, '0');
      previousValue = hourController.text;
      isUnit = initialValue! >= 10;
    }
    return Flexible(
      child: IntrinsicWidth(
        child: TextFormField(
          focusNode: hourFocusNode,
          controller: hourController,
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
              hourController.text = (newValue >= 0 && newValue < 24)
                  ? newValue.toString().padLeft(2, '0')
                  : '23';
              onMovePointer(isHour: true);
            } else {
              // case nhập data hàng đơn vị
              isUnit = false;
              hourController.text = '0$value';
            }
            previousValue = hourController.text;
            onChangeData();
          },
          style: textTheme.labelLarge?.copyWith(
            color: AppColor.c_323F4B,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabled: isEnabled,
            contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
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
            hintText: 'hh',
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
