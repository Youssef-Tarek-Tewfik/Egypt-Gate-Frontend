import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';

class ArScreen extends StatelessWidget {
  Map<String,String> kingData;

  ArScreen({Key key, @required this.kingData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unity Scene',
      home: MyHomePage(kingData: this.kingData),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Map<String,String> kingData;
  MyHomePage({Key key, @required this.kingData}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UnityViewController unityViewController;
  void onCreated(UnityViewController controller) {
    unityViewController = controller;
  }

  void onMessage(UnityViewController controller, String msg) {
    print(msg);
  }

  void _incrementCounter() {
    unityViewController.send(
      'Role',
      'SetNewText',
      super.widget.kingData['role']
    );
    unityViewController.send(
      'KingName',
      'SetNewText',
      super.widget.kingData['name']
    );
    unityViewController.send(
      'Family',
      'SetNewText',
      super.widget.kingData['family']
    );
    unityViewController.send(
      'ShortDescription',
      'SetNewText',
      //super.widget.kingData['short-description']
      'Description Here'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unity rules'),
      ),
      body: UnityView(
        onCreated: onCreated,
        onMessage: onMessage,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
        tooltip: 'Increment',
      ),
    );
  }
}
