# theme_vendor

A package to dynamically change themes, add different themes for specific parts of your application


## Instalation
````
dependencies:
  theme_vendor:^0.0.1
````
### Import package 
````
import 'package:theme_vendor/theme_vendor.dart';
````
### Example usage
````
ThemeVendor(
    onSave: true,
    themes: [
      AppTheme(themeLabel: 'Theme dark',themeName: 'dark',themeData: ThemeData.dark()),
      AppTheme(themeLabel: 'Theme light',themeName: 'light',themeData: ThemeData.light()),
    ],
    widgets: [
      WidgetTheme(widgetLabel: 'Application',widgetName: 'App',themeName: 'dark'),
      WidgetTheme(widgetLabel: 'Contact Page' ,widgetName: 'ContactPage',themeName: 'light'),
    ],
    child:(getThemeWidget)=> MaterialApp(
        title: 'Flutter Demo',
        theme:getThemeWidget('App').themeData,
        home: HomePage(title: 'Flutter Demo Home Page'),
    ),
)

````
### Specify OnSave as true to persist theme changes
````
onSave:true
 
````
### Get theme specific
````
 ThemeVendor.of(context).getTheme('dark'),
````
### Get list themes 
````
 ThemeVendor.of(context).getThemes(),
````
### Get the widget theme by widgetName
````
ThemeVendor.of(context).getThemeWidget('App');
````
### Set theme Wiget
````
ThemeVendor.of(context).setThemeWidget('App','dark')
````

### Change the themes in the dialog box
````
 onPressed: ()async{
    await  showDialog(context: context,builder: (context)=>ChangeTheme());   
 } 
````
![Change the themes in the dialog box](https://raw.githubusercontent.com/DaniloCarSan/theme_vendor/master/assets/all.png)

## Change specific theme in the dialog box
````
 onPressed: ()async{
    await  showDialog(context: context,builder: (context)=>ChangeTheme(widgetName: 'App'));   
 } 
````
![Change the themes in the dialog box](https://raw.githubusercontent.com/DaniloCarSan/theme_vendor/master/assets/specific.png)

### Use the widget BuildTheme to build theme in the screen
````
BuildTheme(
  widgetName: 'ContactPage',
  child: Scaffold(

  ),
)
````
### or get the theme directly
````
Theme(
  data:ThemeVendor.of(context).getThemeWidget('ContactPage').themeData,
  child: Scaffold(
                    
  ),
);
````


##### Inspired in packges 

[dynamic_theme](https://pub.dev/packages/dynamic_theme) and [theme_provider](https://pub.dev/packages/theme_provider)

## Getting Started
For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
