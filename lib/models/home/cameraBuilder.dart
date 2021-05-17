import 'dart:io';

import 'package:camera/camera.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import '../../backend/scanningApi.dart';

// Function called to capture a picture with the camera
// TO DO: Function should delegate the image to another api caller function
void captureHandler(
    Future<void> initializer, CameraController controller) async {
  await initializer;
  final temp = await getTemporaryDirectory();
  final temp2 = temp.path + "Image.jpg";
  if (await File(temp2).exists()) {
    File(temp2).delete();
  }
  await controller.takePicture(temp2);
  File image = new File(temp2);
  print(image.path);
  String x = await scanImage(image);
  print(x);
}

// Function that builds the camera preview and button widgets when the initializer is done
// Also handles what to be displayed while the initializer isn't finished
FutureBuilder<void> cameraBuilder(
    {Future<void> initializer,
    CameraController controller,
    double w,
    double h,
    bool buttonEnabled}) {
  return FutureBuilder<void>(
      future: initializer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // initialization done
          return Container(
              width: w,
              height: h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CameraPreview(controller),
                  Container(
                    height: 0.15 * h,
                    width: 0.255 * w,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: CircleBorder(
                          side: BorderSide(
                        color: buttonEnabled
                            ? CustomColors.primary
                            : Colors.grey.shade500,
                        width: 0.02 * w,
                      )),
                    ),
                    child: RaisedButton(
                      onPressed: buttonEnabled
                          ? () => captureHandler(initializer, controller)
                          : null,
                      color: Colors.transparent,
                      shape: CircleBorder(),
                      child: buttonEnabled
                          ? null
                          : Center(
                              child: Text(
                                "NO INTERNET",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: w * 0.025,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.primary,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ));
        } else {
          // initialization not done yet
          return Center(child: CircularProgressIndicator());
        }
      });
}
