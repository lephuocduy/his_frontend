import 'package:flutter/services.dart';

enum NumInputType {
  // chỉ nhập số
  normal('normal'),
  // số nguyên không âm
  nonNegativeInteger('nonNegativeInteger'),
  // số thập phân không âm
  nonNegativeDecimal('nonNegativeDecimal'),
  // số thập phân không âm (0-10)
  nonNegativeDecimalMax10('nonNegativeDecimalMax10'),
  // số thập phân không âm (0-100)
  nonNegativeDecimalMax100('nonNegativeDecimalMax100'),
  // số thập phân không âm (0-999)
  nonNegativeDecimalMax999('nonNegativeDecimalMax999'),
  // số thập phân
  decimal('decimal'),
  // năm (year)
  year('year');

  const NumInputType(this.value);

  final String value;

  static NumInputType from(String? value) {
    return NumInputType.values.firstWhere(
      (element) => element.value == value,
      orElse: () => NumInputType.normal,
    );
  }

  List<TextInputFormatter> get inputFormatters {
    switch (this) {
      case NumInputType.normal:
        return [
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d*$'),
          )
        ];
      case NumInputType.nonNegativeInteger:
        return [
          FilteringTextInputFormatter.allow(
            RegExp(r'^[1-9]\d*$'),
          )
        ];
      case NumInputType.nonNegativeDecimal:
        return [
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d*\.?\d{0,2}$'),
          )
        ];
      case NumInputType.nonNegativeDecimalMax999:
        return [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.allow(
            RegExp(r'^([1-9]?[0-9]?[0-9]?(\.\d{0,2})?)$'),
          )
        ];
      case NumInputType.nonNegativeDecimalMax100:
        return [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.allow(
            RegExp(r'^(100|[1-9]?[0-9]?(\.\d{0,2})?)$'),
          )
        ];
      case NumInputType.nonNegativeDecimalMax10:
        return [
          LengthLimitingTextInputFormatter(5),
          FilteringTextInputFormatter.allow(
            RegExp(r'^(10|[0-9]?(\.\d{0,2})?)$'),
          )
        ];
      case NumInputType.decimal:
        return [
          FilteringTextInputFormatter.allow(
            RegExp(r'^-?\d*\.?\d{0,2}$'),
          )
        ];
      case NumInputType.year:
        return [
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d{0,4}$'),
          )
        ];
    }
  }
}
