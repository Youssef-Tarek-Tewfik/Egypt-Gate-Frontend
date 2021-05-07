import 'package:egypt_gate/screens/splash_screen.dart';
import 'package:egypt_gate/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenRoute extends MaterialPageRoute {

  HomeScreenRoute() : super(
    builder: (context) => HomeScreen(),
  );

  // @override
  // Widget buildPage(BuildContext context, var animation, var secondaryAnimation) {
    

  //   return SizeTransition(
  //     sizeFactor: Tween<double>(
  //       begin: 0,
  //       end: 0.1,
  //     ).animate(animation),
  //     child: HomeScreen(),
  //   );
  // }
}