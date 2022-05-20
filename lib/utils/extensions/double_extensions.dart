extension DoubleExtension on double {
  String get toPriceFormat {
    return '\$${toStringAsFixed(2)}';
  }
}
