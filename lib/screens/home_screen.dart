import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:egypt_gate/common/navigation.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/app_bar.dart';
import 'package:egypt_gate/models/home/cameraBuilder.dart';
import 'package:egypt_gate/models/home/drawer.dart';
import 'package:egypt_gate/screens/scanning_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Home Screen with the Camera view, called from the Splashscreen
// Receives the CameraDescription instance from the Splashscreen
class HomeScreen extends StatefulWidget {

  final CameraDescription cameraDescription;
  final bool connected;
  HomeScreen(this.cameraDescription, this.connected);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CameraController _controller;
  Future<void> _initializeControllerFuture;
  String language;

  @override
  void initState() {
    super.initState();
    language = "English";
    _controller = CameraController(
      widget.cameraDescription,
      ResolutionPreset.medium,
    );
  _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeLanguage(String lang) {
    setState(() {
      language = lang;
    });
  }

  void getGalleryImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    Navigator.of(context).push(customNavigation(ScanningScreen(imageToScanPath: image.path)));
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: customAppBar(h: h, w: w,),
      drawer: customDrawer(
        context: context,
        language: language,
        changeLanguage: changeLanguage,
        getGalleryImage: getGalleryImage,
        connected: widget.connected,
      ),
      body: cameraBuilder(
        initializer: _initializeControllerFuture,
        controller: _controller,
        w: w,
        h: h,
        buttonEnabled: widget.connected,
        language : language,
      ),
      // body: FutureBuilder<void>(
      //   future: _initializeControllerFuture,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       // If the Future is complete, display the preview.
      //       return CameraPreview(_controller);
      //     } else {
      //       // Otherwise, display a loading indicator.
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),

    );
  }
}