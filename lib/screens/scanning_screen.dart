import 'dart:developer';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path/path.dart';
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
          print("AAAAAAAAAA  " + text.data);
          String organizedText = "";
          Map<String, String> kingData = {
            'name': "",
            'family': "",
            'role': "",
            'short-description': ""
          };
          for (String text in text.data.split('!')) {
            if (text.isNotEmpty) {
              print("SSSSSS" + text);
              kingData[text.split('^')[0]] = text.split('^')[1];
            }
          }
          organizedText += ('\n\n');
          organizedText += (("Name : ") + kingData['name'] + '\n\n');
          organizedText += (("Family : ") + kingData['family'] + '\n\n');
          organizedText += (("Role : ") + kingData['role'] + '\n\n');
          /*organizedText +=
              (("Description : ") + kingData['short-description'] + '\n');*/
          /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanningScreen(imageToScanPath: temp2),
          ),
        );*/
          return Text(
            organizedText,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ); // image is ready
        } else {
          return new Scaffold(
              backgroundColor: Colors.yellowAccent[700],
              body: Center(
                  child: SpinKitPouringHourglass(
                      color: Colors.black, size: 50.0))); // placeholder
        }
      },
    );
  }
}
