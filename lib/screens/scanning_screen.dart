import 'dart:developer';
import 'dart:io';
import 'package:egypt_gate/common/loading_screen.dart';
import 'package:egypt_gate/common/navigation.dart';
import 'package:egypt_gate/screens/recognized_screen.dart';
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
  
  @override
  void initState() {
    super.initState();
    widget.image = new File(widget.imageToScanPath);
  }
  


  void goToAR(BuildContext context, kingData) {
    Navigator.push(
      context,
      customNavigation(ArScreen(kingData: kingData, language: widget.language))
    );
  }

  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: scanImage(widget.image,widget.language),
      builder: (context, AsyncSnapshot<String> text) {
        if (text.hasData) {
          Map<String, String> kingData = {
            'name': "",
            'family': "",
            'role': "",
            'short-description': ""
          };
          for (String text in text.data.split('!')) {
            if (text.isNotEmpty) {
              kingData[text.split('^')[0]] = text.split('^')[1];
            }
          }

          return RecognizedScreen(
            onClick: () => goToAR(context, kingData),
          ); // image is ready
        }
        // image is ready

        else {
          return LoadingScreen();
        }
      },
    );
  }

}
