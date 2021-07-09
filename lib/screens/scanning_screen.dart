import 'dart:developer';
import 'dart:io';
import 'package:egypt_gate/common/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:egypt_gate/screens/AR_screen.dart';
import 'package:path/path.dart';
import '../backend/scanningApi.dart';

class ScanningScreen extends StatefulWidget {
  String imageToScanPath;
  File image;
  String kingName;
  String language;
  ScanningScreen({Key key, this.imageToScanPath, this.language})
      : super(key: key);

  @override
  _ScanningScreenState createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  void goToAR(BuildContext context, kingData) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ArScreen(kingData: kingData, language: widget.language),
        ));
  }

  Widget build(BuildContext context) {
    widget.image = new File(widget.imageToScanPath);
    return new FutureBuilder(
      future: scanImage(widget.image),
      builder: (context, AsyncSnapshot<String> text) {
        if (text.hasData) {
          String organizedText = "";
          Map<String, String> kingData = {
            'name': "",
            'family': "",
            'role': "",
            'short-description': ""
          };
          for (String text in text.data.split('!')) {
            if (text.isNotEmpty) {
              /*if (text.split('^')[0] == "short-description") {
                String temp = "";

                for (String line in text.split('^')[1].split('.')) {
                  temp += (line + '\n');
                }
                kingData[text.split('^')[0]] = temp;
              } else {
                print("SSSSSS" + text);
              }*/
              kingData[text.split('^')[0]] = text.split('^')[1];
            }
          }
          //goToAR(kingData);
          organizedText += ('\n\n\n\n');
          organizedText += (("Name : ") + kingData['name'] + '\n\n');
          organizedText += (("Family : ") + kingData['family'] + '\n\n');
          organizedText += (("Role : ") + kingData['role'] + '\n\n');
          organizedText +=
              (("Short-Desc : ") + kingData['short-description'] + '\n\n');

          organizedText += ('\n\n');
          organizedText += "Press the below button to go to the AR mode ";
          /*organizedText +=
              (("Description : ") + kingData['short-description'] + '\n');*/
          return Scaffold(
            body: Text(
              organizedText,
              textScaleFactor: 2,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => goToAR(context, kingData),
              child: Icon(Icons.arrow_right),
            ),
          ); // image is ready
        }
        // image is ready

        else {
          return LoadingScreen();
          /*return Scaffold(
              backgroundColor: Colors.yellowAccent[700],
              body: Center(
                  child: SpinKitPouringHourglass(
                      color: Colors.black, size: 50.0)));*/
          // placeholder
        }
      },
    );
  }
}
