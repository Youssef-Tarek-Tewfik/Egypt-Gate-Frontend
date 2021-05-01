import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  SplashScreen(BuildContext context) {
    var stopWatch = Stopwatch()..start();
    print("start");
    // do stuff
    Timer(
      Duration(seconds: 5),
      () => Navigator.popAndPushNamed(context, "/home"),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      width: w,
      height: h,
      child: AnimatedOpacity(
        opacity: 1,
        duration: Duration(seconds: 1),
        child: Image.asset("assets/img.png"),
      ),
    );
  }
}