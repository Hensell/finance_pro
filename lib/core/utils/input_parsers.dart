double? parsePositiveNumber(String value) {
  final double? parsed = parseFiniteNumber(value);
  if (parsed == null || parsed <= 0) {
    return null;
  }

  return parsed;
}

int? parsePositiveInteger(String value) {
  final int? parsed = int.tryParse(value.trim().replaceAll(' ', ''));
  if (parsed == null || parsed <= 0) {
    return null;
  }

  return parsed;
}

double? parseNonNegativeNumber(String value) {
  final double? parsed = parseFiniteNumber(value);
  if (parsed == null || parsed < 0) {
    return null;
  }

  return parsed;
}

double? parseFiniteNumber(String value) {
  final String normalized = normalizeNumberInput(value);
  final double? parsed = double.tryParse(normalized);

  if (parsed == null || !parsed.isFinite) {
    return null;
  }

  return parsed;
}

String normalizeNumberInput(String value) {
  String normalized = value.trim().replaceAll(' ', '');
  final int commaIndex = normalized.lastIndexOf(',');
  final int dotIndex = normalized.lastIndexOf('.');

  if (commaIndex >= 0 && dotIndex >= 0) {
    if (commaIndex > dotIndex) {
      normalized = normalized.replaceAll('.', '').replaceAll(',', '.');
    } else {
      normalized = normalized.replaceAll(',', '');
    }
  } else if (commaIndex >= 0) {
    normalized = normalized.replaceAll(',', '.');
  }

  return normalized;
}
