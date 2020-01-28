import 'package:example/pages/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:theme_vendor/theme_vendor.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return BuildTheme(
      widgetName: 'ContactPage',
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact Page'),
        ),
        body: Center(
          child: RaisedButton(
              onPressed: ()async{
                await  showDialog(context: context,builder: (context)=>ChangeTheme(widgetName: 'ContactPage',));
              },
              child: Text('Change ContactPage widget'),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>PerfilPage())),
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}