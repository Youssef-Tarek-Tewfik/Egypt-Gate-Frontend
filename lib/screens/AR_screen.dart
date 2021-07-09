import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';

class ArScreen extends StatelessWidget {
  Map<String, String> kingData;

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
  Map<String, String> kingData;
  MyHomePage({Key key, @required this.kingData}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UnityViewController unityViewController;
  void onCreated(UnityViewController controller) {
    unityViewController = controller;
    sendToUnity();
  }

  void onMessage(UnityViewController controller, String msg) {
    print(msg);
  }

  void sendToUnity() {
    unityViewController.send(
        'Canvas', 'SetRole', super.widget.kingData['role']);
    unityViewController.send(
        'Canvas', 'SetName', super.widget.kingData['name']);
    unityViewController.send(
        'Canvas', 'SetFamily', super.widget.kingData['family']);
    unityViewController.send(
        'Canvas', 'SetDesc', super.widget.kingData['short-description']);
    unityViewController.send('Canvas', 'SetLanguage', 'English');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnityView(
        onCreated: onCreated,
        onMessage: onMessage,
      ),
    );
  }
}
