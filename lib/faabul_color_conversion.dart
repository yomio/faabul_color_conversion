library faabul_color_conversion;

import 'dart:ui';

extension StringWebColorExtension on String {
  static final _colorParser = RegExp(r"^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$");

  /// Parses the String as a web color
  ///
  /// Accepts both #FF0088FF and #0088FF formats, case insensitive
  /// Throws [FormatException] on invalid format
  ///
  /// See also [tryParseAsColor] for a version that returns `null` instead of throwing
  Color parseAsColor() {
    final match = _colorParser.firstMatch(this)?.group(1);
    if (match == null) {
      throw FormatException(
          "Supplied color has invalid format. Expected '#FF0088FF' or '#0088FF'",
          this);
    }
    return Color(int.parse("0x${match.length == 8 ? match : 'FF$match'}"));
  }

  /// Parses the String as a web color
  ///
  /// Accepts both #FF0088FF and #0088FF formats, case insensitive
  /// Returns `null` on invalid format
  ///
  /// See also [parseAsColor] for a version that throws [FormatException] on invalid format
  Color? tryParseAsColor() {
    try {
      return parseAsColor();
    } on FormatException catch (_) {
      return null;
    }
  }
}

extension ColorWebStringExtension on Color {
  /// Returns web color representation, such as #ff4488dd
  String asWebColor() {
    String alphaHex = alpha.toRadixString(16).padLeft(2, '0');
    String redHex = red.toRadixString(16).padLeft(2, '0');
    String greenHex = green.toRadixString(16).padLeft(2, '0');
    String blueHex = blue.toRadixString(16).padLeft(2, '0');

    return '#$alphaHex$redHex$greenHex$blueHex';
  }
}
