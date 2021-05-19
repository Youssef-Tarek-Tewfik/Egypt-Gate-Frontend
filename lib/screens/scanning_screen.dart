import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
          print("AAAAAAAAAA  "+text.data);
          /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanningScreen(imageToScanPath: temp2),
          ),
        );*/
          return Text(text.data); // image is ready
        } else {
          return new Scaffold(
              backgroundColor: Colors.blue[900],
              body: Center(
                  child: SpinKitRotatingCircle(
                      color: Colors.white, size: 50.0))); // placeholder
        }
      },
    );
  }
}
