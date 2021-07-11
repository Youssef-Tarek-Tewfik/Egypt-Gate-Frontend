import 'dart:io';
import 'package:egypt_gate/common/loading_screen.dart';
import 'package:egypt_gate/common/navigation.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/screens/recognized_screen.dart';
import 'package:egypt_gate/screens/unrecognized_screen.dart';
import 'package:flutter/material.dart';
import 'package:egypt_gate/screens/AR_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../backend/scanningApi.dart';

class ScanningScreen extends StatefulWidget {

  final String imageToScanPath;
  final String language;
  ScanningScreen({Key key, this.imageToScanPath, this.language}): super(key: key);

  @override
  _ScanningScreenState createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {

  File image;
  Map<String, String> kingData;
  
  @override
  void initState() {
    super.initState();
    image = new File(widget.imageToScanPath);
    kingData = {
      'name': "",
      'family': "",
      'role': "",
      'short-description': ""
    };
  }

  void goToAR(BuildContext context) {
    Navigator.push(
      context,
      customNavigation(ArScreen(kingData: kingData, language: widget.language))
    );
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: scanImage(image, widget.language),
      builder: (context, AsyncSnapshot<String> text) {
        if (text.hasData) {

          try {
            for (String text in text.data.split('!')) {
              if (text.isNotEmpty) {
                kingData[text.split('^')[0]] = text.split('^')[1];
              }
            }
            return RecognizedScreen(
              onClick: () => goToAR(context),
            );
          }
          catch (error) {
            return UnrecognizedScreen();
          }
        }
        // return Scaffold(
          // body: LoadingScreen(),
        // );
        return Scaffold(
          backgroundColor: CustomColors.primary,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/pattern6.jpg"), fit: BoxFit.cover),
            ),
            child: Center(
              child: SpinKitPouringHourglass(
                color: Colors.brown,
                size: 50.0,
              ),
            ),
          ),
        );
      },
    );
  }

}
