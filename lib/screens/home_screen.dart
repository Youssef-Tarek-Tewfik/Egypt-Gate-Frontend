import 'dart:async';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/app_bar.dart';
import 'package:egypt_gate/models/home/drawer.dart';
import 'package:egypt_gate/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: customAppBar(
        h: h,
        w: w,
      ),
      drawer: customDrawer(),
      body: Container(
        width: w,
        height: h,
        child: Column(
          children: [
            SizedBox(height: 0.7 * h),
            Container(
              height: 0.15 * h,
              child: RaisedButton(
                onPressed: () {},
                shape: CircleBorder(),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}