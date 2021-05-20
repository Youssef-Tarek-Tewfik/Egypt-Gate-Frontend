import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:egypt_gate/screens/AR_screen.dart';
import '../backend/scanningApi.dart';

class ScanningScreen extends StatefulWidget {
  String imageToScanPath;
  File image;
  String kingName;
  ScanningScreen({Key key, @required this.imageToScanPath}) : super(key: key);

  @override
  _ScanningScreenState createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  Widget build(BuildContext context) {
    widget.image = new File(widget.imageToScanPath);
    return new FutureBuilder(
      future: scanImage(widget.image),
      builder: (context, AsyncSnapshot<String> text) {
        if (text.hasData) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArScreen(kingName: text.data),
              ));
          return Stack(children: <Widget>[
            Image.asset(
              "assets/resources/pattern6.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
                body: Center(
                    child:
                        SpinKitRotatingCircle(color: Colors.white, size: 50.0)))
          ]); // image is ready
        } else {
          return Stack(children: <Widget>[
            Image.asset(
              "assets/resources/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
                body: Center(
                    child:
                        SpinKitRotatingCircle(color: Colors.white, size: 50.0)))
          ]); // placeholder
        }
      },
    );
  }
}
