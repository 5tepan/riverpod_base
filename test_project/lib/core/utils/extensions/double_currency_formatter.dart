import 'package:intl/intl.dart';

extension DoubleCurrencyFormatter on double {
  String toCurrencyString({
    String locale = 'RU_ru',
    String name = '₽',
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.simpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    );
    return formatter.format(this);
  }
}
