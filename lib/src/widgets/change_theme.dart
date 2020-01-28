import 'package:flutter/material.dart';
import 'package:theme_vendor/theme_vendor.dart';


class ChangeTheme extends StatefulWidget {

  final String  widgetName;

  const ChangeTheme({Key key , this.widgetName}): super(key:key);

  @override
  _ChangeThemeState createState() =>  _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  String widgetName;

  @override
  initState() {
    super.initState();
    widgetName = widget.widgetName ?? ThemeVendor.of(context).getWidgets().first.widgetName;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: widget.widgetName == null ? DropdownButton(
        value: widgetName,
        items: ThemeVendor.of(context).getWidgets().map((widgetTheme) => DropdownMenuItem(
          child: Text(widgetTheme.widgetLabel),
          value: widgetTheme.widgetName,
        )).toList(),
        onChanged: (value) {
          setState(() {
            widgetName = value;
          });
        },
      ):Text(ThemeVendor.of(context).getWidget(widgetName).widgetLabel),
      children: ThemeVendor.of(context).getThemes().map((appTheme) => RadioListTile(
        title: Text(appTheme.themeName),
        value: appTheme.themeName,
        onChanged: (themeName)=>ThemeVendor.of(context).setThemeWidget(widgetName, themeName),
        groupValue:ThemeVendor.of(context).getThemeWidget(widgetName).themeName,
      )).toList(),
    );
  }
}
