import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';



class ArScreen extends StatefulWidget {
  Map<String, String> kingData;
  String language;
  ArScreen({Key key, this.kingData,this.language}) : super(key: key);
  @override
  _ArScreenState createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
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
        'Canvas', 'SetRole', widget.kingData['role']);
    unityViewController.send(
        'Canvas', 'SetName', widget.kingData['name']);
    unityViewController.send(
        'Canvas', 'SetFamily', widget.kingData['family']);
    unityViewController.send(
        'Canvas', 'SetDesc', widget.kingData['short-description']);
    unityViewController.send(
        'Canvas', 'SetLanguage', widget.language);
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
