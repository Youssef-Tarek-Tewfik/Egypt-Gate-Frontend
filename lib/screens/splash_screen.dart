import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:connectivity/connectivity.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/home_route.dart';
import 'package:flutter/material.dart';

// First Screen to be displayed at App start
// Shows the Logo for a few seconds, gets the camera instance (asks for permissions for it), then calls HomeScreen
class SplashScreen extends StatelessWidget {

  // Function called at the beginning of this screen's "build", for initializations and calling the home screen
  void _homeCaller(BuildContext context) async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    // Check if connected to the internet
    bool connected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connected = true;
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      connected = true;
    }

    Timer(
      Duration(seconds: 5), // just waits 5 seconds, like Timeout in JS
      () => Navigator.of(context).pushReplacement(HomeScreenRoute(camera, true)), // !
    );
  }

  @override
  Widget build(BuildContext context) {
    _homeCaller(context);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      color: CustomColors.primary,
      width: w,
      height: h,
      child: AnimatedOpacity(
        opacity: 1,
        duration: Duration(seconds: 3),
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}