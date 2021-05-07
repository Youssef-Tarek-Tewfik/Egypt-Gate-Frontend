import 'package:egypt_gate/common/theme.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({double h, double w}) {
  return AppBar(
    backgroundColor: CustomColors.secondary,
    toolbarHeight: h * 0.1,
    centerTitle: true,
    iconTheme: IconThemeData(color: CustomColors.primary),
    bottom: PreferredSize(
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
        fontSize: w * 0.07,
      ),
    ),
  );
}