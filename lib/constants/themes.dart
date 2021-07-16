import 'package:flutter/material.dart';

enum AppTheme { Light, Dark }

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
  ),
};
