import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';

class ArScreen extends StatelessWidget {
  String kingName;

  ArScreen({Key key, @required this.kingName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unity Scene',
      home: MyHomePage(kingName: this.kingName),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String kingName;
  MyHomePage({Key key, @required this.kingName}) : super(key: key);
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
      'First_Text',
      'SetNewTex',
      super.widget.kingName
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
