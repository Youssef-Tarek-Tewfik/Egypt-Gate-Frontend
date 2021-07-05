import 'package:camera/camera.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/screens/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:egypt_gate/screens/splash_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final camera = cameras.first;

  runApp(MyApp(camera));
}

class MyApp extends StatelessWidget {

  final CameraDescription camera;

  MyApp(this.camera);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egypt Gate',
      theme: customThemeData(),
      home: SplashScreen(camera),
    );
  }
}