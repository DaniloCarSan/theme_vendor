import 'package:flutter/material.dart';
import 'package:theme_vendor/theme_vendor.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Perfil Page'),
      ),

      body:Container(
        color:  ThemeVendor.of(context).getThemeWidget('App').themeData.accentColor,
        child: Center(
          child: Text('345345'),
        ),
      ),
    );
  }
}