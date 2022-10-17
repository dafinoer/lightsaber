import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData.dark(useMaterial3: true).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
