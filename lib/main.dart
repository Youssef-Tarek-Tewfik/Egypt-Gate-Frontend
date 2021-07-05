import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:egypt_gate/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egypt Gate',
      theme: customThemeData(),
      home: offlineScreen(),
    );
  }
}