import 'package:intl/intl.dart';

String formatToMoney(String price) {
  final formatter = NumberFormat('#,###');
  return formatter.format(int.parse(price));
}

extension MoneyFormatter on String {
  String toMoney() {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(this));
  }
}
