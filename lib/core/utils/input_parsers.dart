double? parsePositiveNumber(String value) {
  final double? parsed = double.tryParse(value.trim());
  if (parsed == null || parsed <= 0) {
    return null;
  }

  return parsed;
}

int? parsePositiveInteger(String value) {
  final int? parsed = int.tryParse(value.trim());
  if (parsed == null || parsed <= 0) {
    return null;
  }

  return parsed;
}

double? parseNonNegativeNumber(String value) {
  final double? parsed = double.tryParse(value.trim());
  if (parsed == null || parsed < 0) {
    return null;
  }

  return parsed;
}
