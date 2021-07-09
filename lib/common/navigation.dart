import 'package:flutter/material.dart';

PageRouteBuilder customNavigation(final Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionDuration: Duration(milliseconds: 450),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
      return ScaleTransition(scale: animation, child: child);
    },
  );
}