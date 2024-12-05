import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/currency_text.dart';

class FilterCurrencyTable extends StatefulWidget {
  const FilterCurrencyTable({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.disibleSuffixIcon = false,
  });
  final num? initialValue;
  final void Function(num value) onChanged;
  final bool disibleSuffixIcon;

  @override
  State<FilterCurrencyTable> createState() => _FilterCurrencyTableState();
}

class _FilterCurrencyTableState extends State<FilterCurrencyTable> {
  late Timer _debounce;
  late TextEditingController _controller;
  final feeFormatter = currencyFormatWithoutSymbol;

  void _onChangeText(String text) {
    if (_debounce.isActive) {
      _debounce.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(feeFormatter.getUnformattedValue());
    });
  }

  @override
  void initState() {
    super.initState();
    _debounce = Timer(Duration.zero, () {});
    _controller = TextEditingController();
    _controller.text = widget.initialValue != null
        ? feeFormatter.formatString(widget.initialValue!.toInt().toString())
        : '';
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FilterCurrencyTable oldWidget) {
    if (widget.initialValue != oldWidget.initialValue) {
      final str = widget.initialValue != null
          ? feeFormatter.formatString(widget.initialValue!.toInt().toString())
          : '';

      _controller
        ..text = str
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: str.length,
          ),
        );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final limitFormat = LengthLimitingTextInputFormatter(
      99,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    );
    return SizedBox(
      height: 36,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [feeFormatter, limitFormat],
        controller: _controller,
        style: textTheme.bodyMedium?.copyWith(
          color: AppColor.c_47535D,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 12,
            left: 4,
            right: 4,
          ),
          border: InputBorder.none,
          suffixIcon: widget.disibleSuffixIcon
              ? null
              : const Icon(
                  Icons.search,
                  size: 20,
                ),
          suffixIconConstraints:
              widget.disibleSuffixIcon ? null : const BoxConstraints(),
        ),
        onChanged: (value) {
          _onChangeText(value);
        },
      ),
    );
  }
}
