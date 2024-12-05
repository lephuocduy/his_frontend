import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

CurrencyTextInputFormatter get currencyFormatWithoutSymbol =>
    CurrencyTextInputFormatter.currency(
      locale: 'vi',
      decimalDigits: 0,
      symbol: '',
    );

CurrencyTextInputFormatter get defaultCurrencyFormatter =>
    CurrencyTextInputFormatter.currency(
      locale: 'vi',
      symbol: 'đ',
      decimalDigits: 0,
    );

CurrencyTextInputFormatter get defaultCurrencyVNDFormatter =>
    CurrencyTextInputFormatter.currency(
      locale: 'vi',
      symbol: 'VNĐ',
      decimalDigits: 0,
    );
