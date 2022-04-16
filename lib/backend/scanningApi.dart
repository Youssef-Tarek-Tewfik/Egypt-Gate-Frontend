import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as IMAGEPCKG;
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';

Future<String> scanImage(File imageFile, String language) async {
  // IMAGEPCKG.Image image = IMAGEPCKG.decodeImage(imageFile.readAsBytesSync());
  // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
  // IMAGEPCKG.Image thumbnail = IMAGEPCKG.copyResize(image, width: 500);
  // new File('out/thumbnail-test.png').writeAsBytesSync(IMAGEPCKG.encodePng(thumbnail));
  // imageFile = new File('out/thumbnail-test.png');
  // print(imageFile.path);
  String apiLink = 'https://egypt-gate-tflite.herokuapp.com/';
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(apiLink + 'Recognize'),
  );
  Map<String, String> headers = {
    "Content-type": "multipart/form-data",
    "Lang": language
  };
  request.files.add(
    http.MultipartFile(
      'ImageFile',
      imageFile.readAsBytes().asStream(),
      imageFile.lengthSync(),
      filename: "InputImage.jpg",
      contentType: MediaType('image', 'jpeg'),
    ),
  );

  request.headers.addAll(headers);
  print("request: " + request.toString());
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  print(response.body);
  return response.body;
}
