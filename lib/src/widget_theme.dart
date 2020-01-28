import 'package:flutter/material.dart';

class WidgetTheme {
  /// Description the widget [widgetLabel]
  ///  is required
  /// is visible in dialog to change theme
  String widgetLabel;

  /// The name this widget [widgetName]
  /// is required and unique name
  String widgetName;

  /// The  name the theme this widget  [themeName]
  /// is required
  String themeName;

  /// Others pararams
  final dynamic others;

  WidgetTheme(
      {@required this.widgetLabel,
      @required this.widgetName,
      @required this.themeName,
      this.others});

  setWidgetName(String value) {
    this.widgetName = value;
  }

  setThemeName(String value) {
    this.themeName = value;
  }
}
