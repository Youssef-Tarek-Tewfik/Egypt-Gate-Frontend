import 'package:egypt_gate/home_screen.dart';
import 'package:egypt_gate/splash_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:egypt_gate/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(context),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}