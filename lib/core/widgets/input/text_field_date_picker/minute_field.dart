import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class MinuteField extends StatelessWidget {
  MinuteField({
    super.key,
    required this.minuteFocusNode,
    required this.onMovePointer,
    required this.minuteController,
    required this.onChangeData,
    this.isEnabled = true,
    this.initialValue,
  });

  final bool isEnabled;
  final int? initialValue;
  final FocusNode minuteFocusNode;
  final void Function(
      {bool? isDate,
      bool? isMonth,
      bool? isYear,
      bool? isHour,
      bool? isMinute}) onMovePointer;

  bool isUnit = true;
  final VoidCallback onChangeData;

  String previousValue = '';

  final TextEditingController minuteController;

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      minuteController.text = initialValue.toString().padLeft(2, '0');
      previousValue = minuteController.text;
      isUnit = initialValue! >= 10;
    }
    return Flexible(
      child: IntrinsicWidth(
        child: TextFormField(
          focusNode: minuteFocusNode,
          controller: minuteController,
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
              minuteController.text = (newValue >= 0 && newValue < 60)
                  ? newValue.toString().padLeft(2, '0')
                  : '59';
              onMovePointer(isMinute: true);
            } else {
              // case nhập data hàng đơn vị
              isUnit = false;
              minuteController.text = '0$value';
            }
            previousValue = minuteController.text;
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
            hintText: 'MM ',
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
