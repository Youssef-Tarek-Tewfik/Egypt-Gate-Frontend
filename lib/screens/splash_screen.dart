import 'dart:async';
import 'dart:io';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/home_route.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {

  void _homeCaller(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(HomeScreenRoute()),
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