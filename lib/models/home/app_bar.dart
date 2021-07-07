import 'package:egypt_gate/common/theme.dart';
import 'package:flutter/material.dart';

// Function that returns an Appbar instance properly customized
// Receives the screen full height and width as parameters
AppBar customAppBar({double h, double w}) {
  return AppBar(
    backgroundColor: CustomColors.secondary,
    toolbarHeight: h * 0.1,
    centerTitle: true,
    iconTheme: IconThemeData(color: CustomColors.primary),
    bottom: PreferredSize( // The yellow line at the bottom of the app bar
      child: Container(
        color: CustomColors.primary,
        height: h * 0.002,       
      ),
      preferredSize: Size.fromHeight(0.002 * h),
    ),
    title: Text(
      "Egypt Gate",
      style: TextStyle(
        color: CustomColors.primary,
        fontFamily: "Cinzel",
        fontSize: w * 0.07,
        fontWeight: FontWeight.bold,
      ),
    ),
    // actions: [
    //   Image.asset("assets/logo.png", width: w * 0.15),
    // ],
  );
}