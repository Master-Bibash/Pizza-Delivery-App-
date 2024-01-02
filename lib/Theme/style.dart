import 'package:flutter/material.dart';

ThemeData appTheme() {
  final Color primary = Colors.white;
  return ThemeData(
    primaryColor: primary,
    backgroundColor: Colors.grey.shade50,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: primary, primary: primary),
  );
}
