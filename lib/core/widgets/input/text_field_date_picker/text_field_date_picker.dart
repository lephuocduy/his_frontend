import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/date_time.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/day_field.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/hour_field.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/minute_field.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/month_field.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/year_field.dart';

import '../required_label.dart';

class TextFieldDatePicker extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Color? fillColor;
  final double? height;
  final bool isEnabled;
  final void Function(DateTime?)? onChanged;
  final DateTime? initialValue;
  final bool isRequired;
  final TextAlign? textAlign;
  final bool textAlignEndTitle;
  final double? widthTitle;
  final bool isCrossAxisAlignmentTopTitle;
  final int flex;
  final bool isDateTimePicker;
  final TextEditingController? controller;
  final bool? useBorder;
  const TextFieldDatePicker({
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
    this.isCrossAxisAlignmentTopTitle = false,
    this.flex = 1,
    this.isDateTimePicker = false,
    this.controller,
    this.useBorder = true,
  });

  @override
  State<TextFieldDatePicker> createState() => _TextFieldDatePickerState();
}

class _TextFieldDatePickerState extends State<TextFieldDatePicker> {
  late TextEditingController _controller;
  DateTime? _selectedDate;
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  final FocusNode dayFocusNode = FocusNode();
  final FocusNode monthFocusNode = FocusNode();
  final FocusNode yearFocusNode = FocusNode();
  final FocusNode hourFocusNode = FocusNode();
  final FocusNode minuteFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue;
    _controller = TextEditingController(
        text: _selectedDate?.format(
            pattern: widget.isDateTimePicker ? dd_MM_yyyy_hh_mm : dd_mm_yyyy));
  }

  @override
  void dispose() {
    dayFocusNode.dispose();
    monthFocusNode.dispose();
    yearFocusNode.dispose();
    hourFocusNode.dispose();
    minuteFocusNode.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  void onValidateDate() {
    int? day = int.tryParse(dayController.text);
    int? month = int.tryParse(monthController.text);
    int? year = int.tryParse(yearController.text);
    int? hour = int.tryParse(hourController.text);
    int? minute = int.tryParse(minuteController.text);

    if (day == null || month == null || year == null) {
      return;
    }

    if (widget.isDateTimePicker && (hour == null || minute == null)) return;

    DateTime correctedDate = DateTime(year, month, day, hour ?? 0, minute ?? 0);

    // if (correctedDate.year != year ||
    //     correctedDate.month != month ||
    //     correctedDate.day != day) {}
    setState(() {
      _selectedDate = correctedDate;
    });
  }

  void onChangeData() {
    int? day = int.tryParse(dayController.text);
    int? month = int.tryParse(monthController.text);
    int? year = int.tryParse(yearController.text);
    int? hour = int.tryParse(hourController.text);
    int? minute = int.tryParse(minuteController.text);

    if (day == null || month == null || year == null) {
      return;
    }

    if (widget.isDateTimePicker && (hour == null || minute == null)) return;

    DateTime correctedDate = DateTime(year, month, day, hour ?? 0, minute ?? 0);
    if (widget.onChanged != null) {
      widget.onChanged!(correctedDate);
    }
  }

  void onMovePointer({
    bool? isDate,
    bool? isMonth,
    bool? isYear,
    bool? isHour,
    bool? isMinute,
  }) {
    if (isDate == true) {
      monthFocusNode.requestFocus();
    }
    if (isMonth == true) {
      yearFocusNode.requestFocus();
    }
    if (widget.isDateTimePicker) {
      if (isYear == true) {
        hourFocusNode.requestFocus();
      }
      if (isHour == true) {
        minuteFocusNode.requestFocus();
      }
      if (isMinute == true) {
        minuteFocusNode.requestFocus();
      }
    }
    onValidateDate();
  }

  @override
  void didUpdateWidget(TextFieldDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _selectedDate = widget.initialValue;
      _controller.text = _selectedDate?.format(
              pattern:
                  widget.isDateTimePicker ? dd_MM_yyyy_hh_mm : dd_mm_yyyy) ??
          '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textFieldKey = GlobalKey();
    double effectiveHeight = widget.height ?? 36.0;
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
          Expanded(
            child: SizedBox(
              height: effectiveHeight,
              child: Stack(
                children: [
                  InputDecorator(
                    textAlign: TextAlign.center,
                    key: textFieldKey,
                    decoration: InputDecoration(
                      enabled: widget.isEnabled,
                      contentPadding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 22,
                      ),
                      enabledBorder: widget.useBorder == false
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColor.colorBorderGrey,
                              ),
                            ),
                      focusedBorder: widget.useBorder == false
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColor.colorBorderGrey,
                              ),
                            ),
                      disabledBorder: widget.useBorder == false
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColor.colorBorderGrey,
                              ),
                            ),
                      border: widget.useBorder == false
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColor.colorBorderGrey,
                              ),
                            ),
                      fillColor: widget.fillColor ??
                          (widget.isEnabled
                              ? AppColor.c_FFFFFF
                              : AppColor.c_F5F5F5),
                      filled: true,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            spaceW20,
                            DayField(
                              dayController: dayController,
                              dayFocusNode: dayFocusNode,
                              onMovePointer: onMovePointer,
                              onChangeData: onChangeData,
                              isEnabled: widget.isEnabled,
                              initialValue: _selectedDate?.day,
                            ),
                            Text(
                              '/',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColor.c_323F4B,
                              ),
                            ),
                            MonthField(
                              monthController: monthController,
                              monthFocusNode: monthFocusNode,
                              onMovePointer: onMovePointer,
                              onChangeData: onChangeData,
                              isEnabled: widget.isEnabled,
                              initialValue: _selectedDate?.month,
                            ),
                            Text(
                              '/',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColor.c_323F4B,
                              ),
                            ),
                            YearField(
                              yearController: yearController,
                              yearFocusNode: yearFocusNode,
                              onMovePointer: onMovePointer,
                              onChangeData: onChangeData,
                              isEnabled: widget.isEnabled,
                              initialValue: _selectedDate?.year,
                            ),
                            if (widget.isDateTimePicker) ...[
                              const Text(' '),
                              HourField(
                                hourController: hourController,
                                hourFocusNode: hourFocusNode,
                                onMovePointer: onMovePointer,
                                onChangeData: onChangeData,
                                isEnabled: widget.isEnabled,
                                initialValue: _selectedDate?.hour,
                              ),
                              Text(
                                ':',
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColor.c_323F4B,
                                ),
                              ),
                              MinuteField(
                                minuteController: minuteController,
                                minuteFocusNode: minuteFocusNode,
                                onMovePointer: onMovePointer,
                                onChangeData: onChangeData,
                                isEnabled: widget.isEnabled,
                                initialValue: _selectedDate?.minute,
                              ),
                            ],
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: widget.isEnabled
                            ? () async {
                                final pickedDate = await showDatePicker(
                                  context: textFieldKey.currentContext!,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(0),
                                  lastDate: DateTime(9999, 12, 31),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Localizations(
                                      locale: const Locale('vi'),
                                      delegates: const [
                                        GlobalMaterialLocalizations.delegate,
                                        GlobalWidgetsLocalizations.delegate,
                                        GlobalCupertinoLocalizations.delegate,
                                      ],
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: AppColor.colorButtonBlue,
                                            onPrimary: AppColor.c_FFFFFF,
                                            onSurface: AppColor.c_000000,
                                          ),
                                        ),
                                        child: child!,
                                      ),
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  if (widget.isDateTimePicker) {
                                    final TimeOfDay? picked =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Localizations(
                                          locale: const Locale('vi'),
                                          delegates: const [
                                            GlobalMaterialLocalizations
                                                .delegate,
                                            GlobalWidgetsLocalizations.delegate,
                                            GlobalCupertinoLocalizations
                                                .delegate,
                                          ],
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              colorScheme:
                                                  const ColorScheme.light(
                                                primary:
                                                    AppColor.colorButtonBlue,
                                                onPrimary: AppColor.c_FFFFFF,
                                                onSurface: AppColor.c_000000,
                                              ),
                                            ),
                                            child: child!,
                                          ),
                                        );
                                      },
                                    );
                                    setState(() {
                                      if (picked != null) {
                                        _selectedDate = pickedDate.copyWith(
                                          hour: picked.hour,
                                          minute: picked.minute,
                                        );
                                        _controller.text = _selectedDate!
                                            .format(pattern: dd_MM_yyyy_hh_mm);
                                        if (widget.onChanged != null) {
                                          widget.onChanged!(_selectedDate);
                                        }
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      _selectedDate = pickedDate;
                                      _controller.text = pickedDate.format(
                                          pattern: dd_mm_yyyy);
                                      if (widget.onChanged != null) {
                                        widget.onChanged!(_selectedDate);
                                      }
                                    });
                                  }
                                }
                              }
                            : null,
                        child: const Icon(Icons.calendar_month_outlined),
                      ),
                      spaceW4,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
