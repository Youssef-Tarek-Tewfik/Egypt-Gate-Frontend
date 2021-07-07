import 'dart:async';
import 'package:camera/camera.dart';
import 'package:connectivity/connectivity.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/home_route.dart';
import 'package:egypt_gate/screens/home_screen.dart';
import 'package:flutter/material.dart';


// First Screen to be displayed at App start
// Shows the Logo for a few seconds then calls HomeScreen
class SplashScreen extends StatefulWidget {

  final CameraDescription camera;

  SplashScreen(this.camera);

  // Function called at the beginning of this screen's "build", for initializations and calling the home screen
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  void _homeCaller(BuildContext context) async {

    // WidgetsFlutterBinding.ensureInitialized();
    // final cameras = await availableCameras();
    // final camera = cameras.first;

    // Check if connected to the internet
    // bool connected = false;
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   connected = true;
    // }
    // else if (connectivityResult == ConnectivityResult.wifi) {
    //   connected = true;
    // }

    Timer(
      Duration(seconds: 5), // just waits 5 seconds, like Timeout in JS
      // () => Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (c, a1, a2) => HomeScreen(widget.camera, true),
      //     transitionsBuilder: (c, anim, a2, child) => RotationTransition(turns: anim, child: child),
      //     transitionDuration: Duration(milliseconds: 3000),
      //   ),
      // ),
      () async => await Navigator.of(context).pushReplacement(HomeScreenRoute(widget.camera, true)), // !
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
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 1),
        child: Image.asset("assets/logo.png"),
        builder: (context, val, widget) {
          return Opacity(
            opacity: val,
            child: widget,
          );
        }
      ),
    );
  }
}