import 'package:intl/intl.dart';

formatToNaira(amount) {
  if (amount is String) {
    amount = double.parse(amount);
  }
  return NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 2)
      .format(amount);
}


extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}