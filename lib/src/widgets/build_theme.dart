import 'package:flutter/material.dart';
import 'package:theme_vendor/theme_vendor.dart';

class BuildTheme extends StatelessWidget {
  
  final Widget child;

  final String widgetName;

  const BuildTheme({Key key, this.widgetName, this.child}) : super(key: key); @override

  Widget build(BuildContext context) {
    return Theme(
      data: ThemeVendor.of(context).getThemeWidget(widgetName).themeData,
      child: this.child,
    );
  }
}
