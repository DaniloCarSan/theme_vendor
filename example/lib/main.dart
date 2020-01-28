import 'package:example/bloc/home_bloc.dart';
import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:theme_vendor/theme_vendor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i)=>HomeBloc())
      ],
      child: ThemeVendor(
        onSave: true,
        themes: [
          AppTheme(themeName: 'dark',themeData: ThemeData.dark()),
          AppTheme(themeName: 'light',themeData: ThemeData.light()),
          AppTheme(themeName: 'fallback',themeData: ThemeData.fallback()),
          AppTheme(themeName:'pink',themeData: ThemeData(primaryColor: Colors.pink,accentColor: Colors.pinkAccent)),
          AppTheme(themeName:'red',themeData: ThemeData(primaryColor: Colors.red,accentColor: Colors.redAccent)),
          AppTheme(themeName:'green',themeData: ThemeData(primaryColor: Colors.green,accentColor: Colors.greenAccent)),
        ],
        widgets: [
          WidgetTheme(widgetLabel: 'Application ',widgetName: 'App',themeName: 'dark',others: Colors.red),
          WidgetTheme(widgetLabel: 'Contact Page' ,widgetName: 'ContactPage',themeName: 'pink'),
        ],
        child:(getThemeWidget)=> MaterialApp(
          title: 'Flutter Demo',
          theme:getThemeWidget('App').themeData,
          home: HomePage(title: 'Flutter Demo Home Page'),
        ) ,
      ),
    );
  }
}
