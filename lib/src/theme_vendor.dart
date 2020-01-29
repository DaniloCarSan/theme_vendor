import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_vendor/src/app_theme.dart';
import 'package:theme_vendor/src/widget_theme.dart';

class ThemeVendor extends StatefulWidget {
  /// If you want to keep the changes on the disk
  final bool onSave;

  /// List the themes  [ themes ]
  final List<AppTheme> themes;

  /// List the widgets
  final List<WidgetTheme> widgets;

  /// function to build child, an action is passed to obtain the widget theme [getThemeWidget]
  final Widget Function(
      AppTheme Function(String widgetThemeName) getThemeWidgetName) child;

  const ThemeVendor(
      {Key key,
      this.onSave = false,
      @required this.themes,
      @required this.widgets,
      this.child})
      : super(key: key);

  @override
  _ThemeVendorState createState() => _ThemeVendorState();

  static _ThemeVendorState of(BuildContext context) {
    return context.findAncestorStateOfType<State<ThemeVendor>>();
  }
}

class _ThemeVendorState extends State<ThemeVendor> {
  /// The name key to save in disk [_key]
  final String _key = "theme_vendor_";

  /// List the themes  [ _themes ]
  /// is required
  /// Example:
  // themes: [
  //   AppTheme(themeName: 'dark',themeData: ThemeData.dark()),
  //   AppTheme(themeName: 'light',themeData: ThemeData.light()),
  //   AppTheme(themeName:'pink',themeData: ThemeData(primaryColor: Colors.pink,accentColor: Colors.pinkAccent)),
  // ],
  List<AppTheme> _themes = [];

  /// List of widgets used in the application
  /// is required
  /// Example:
  // widgets:[
  //   WidgetTheme(widgetLabel: 'Application',widgetName: 'App',themeName: 'dark'),
  //   WidgetTheme(widgetLabel: 'Module of Authentication' ,widgetName: 'Auth',themeName: 'light'),
  // ],
  List<WidgetTheme> _widgets = [];

  /// Get the widget theme by widgetName
  AppTheme getThemeWidget(String widgetName) {
    if (_widgets == null)
      throw new Exception(' argument  `themesWidgets` is not null ');

    if (_widgets.length == 0)
      throw new Exception(' argument  `themesWidgets` is not empty ');
 
    try
    {
      WidgetTheme widgetTheme = _widgets
          .firstWhere((widgetTheme) => (widgetTheme.widgetName == widgetName));
      return _themes.firstWhere(
          (appTheme) => (appTheme.themeName == widgetTheme.themeName));
    }
    catch (e)
    {
      print('Widget or theme name not found, clear the themes save in to disk !');
      print('Got the first theme  [${_themes.first.themeName}]');
      return _themes.first;
    }
  }

  /// Change theme of widget
  /// If onSave is true then saved to disk
  setThemeWidget(String widgetName, String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var i = 0; i < _widgets.length; i++) {
      if (_widgets[i].widgetName == widgetName) {
        _widgets[i].setThemeName(themeName);

        if (widget.onSave) {
          await prefs.setString(
              '$_key${_widgets[i].widgetName}', _widgets[i].themeName);
        }
      }
    }
    setState(() {});
  }

  /// Clear themes save in disk
  Future<void>clear()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var i = 0; i < _widgets.length; i++)
    {
      WidgetTheme widgetTheme = _widgets[i];
      await prefs.remove('$_key${widgetTheme.widgetName}');
    }
  }

  /// Initialize widgets
  /// If onSave is true then saved to disk
  /// if widgetName already exists then take the saved value, if not then save it to disk
  iniWigets() async {
    if (widget.onSave) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      for (var i = 0; i < _widgets.length; i++) {
        WidgetTheme widgetTheme = _widgets[i];

        if (!prefs.containsKey('$_key${widgetTheme.widgetName}')) {
          await prefs.setString(
              '$_key${widgetTheme.widgetName}', widgetTheme.themeName);
        } else {
          _widgets[i].setThemeName(
              prefs.getString('$_key${widgetTheme.widgetName}') ??
                  widgetTheme.themeName);
        }
      }
      setState(() {});
    }
  }

  /// Get list of themes
  List<AppTheme> getThemes() {
    return _themes;
  }

  /// Get AppTheme by theme name
  AppTheme getTheme(String themeName) {
    return _themes.firstWhere((appTheme) => appTheme.themeName == themeName);
  }

  /// Get list of widgets
  List<WidgetTheme> getWidgets() {
    return _widgets;
  }

  /// Get WidgetTheme by widget name
  WidgetTheme getWidget(String widgetName) {
    return _widgets
        .firstWhere((widgetTheme) => widgetTheme.widgetName == widgetName);
  }

  @override
  void initState() {
    super.initState();
    _themes = new List.from(_themes)..addAll(widget.themes);
    _widgets = widget.widgets;
    iniWigets();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(this.getThemeWidget);
  }
}
