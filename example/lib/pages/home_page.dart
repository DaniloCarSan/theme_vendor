
import 'package:example/pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:theme_vendor/theme_vendor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: ()async{
                await  showDialog(context: context,builder: (context)=>ChangeTheme());   
              },
              child: Text('Change theme dialog'),
            ),
            RaisedButton(
              onPressed: ()async{
                await  showDialog(context: context,builder: (context)=>ChangeTheme(widgetName: 'App',));
              },
              child: Text('Change App widget'),
            ),
            RaisedButton(
              onPressed: ()async{
                Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>ContactPage()
                ));
              },
              child: Text('Auth'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
