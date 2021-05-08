import 'dart:async';
import 'package:camera/camera.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/app_bar.dart';
import 'package:egypt_gate/models/home/cameraBuilder.dart';
import 'package:egypt_gate/models/home/drawer.dart';
import 'package:flutter/material.dart';

// Home Screen with the Camera view, called from the Splashscreen
// Receives the CameraDescription instance from the Splashscreen
class HomeScreen extends StatefulWidget {

  final CameraDescription camera;
  final bool connected;

  HomeScreen(this.camera, this.connected);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
  _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: cameraBuilder(
        initializer: _initializeControllerFuture,
        controller: _controller,
        w: w,
        h: h,
        buttonEnabled: widget.connected,
      ),
    );
  }
}