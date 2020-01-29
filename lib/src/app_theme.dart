import 'package:flutter/material.dart';

class AppTheme {

 // The description the theme
  final String themeLabel;

  ///The name the theme [themeName]
  /// is required and unique
  final String themeName;

  /// The theme [themeData]
  ///  is required
  final ThemeData themeData;

  /// Others pararams
  final dynamic others;

  AppTheme({ @required this.themeLabel , @required this.themeName, @required this.themeData, this.others});
}
