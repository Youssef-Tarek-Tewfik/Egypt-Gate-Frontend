import 'dart:convert';
import 'dart:io';
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



Future<String> scanImage(File imageFile) async {
  String apiLink = 'http://787831e8073e.ngrok.io/';
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(apiLink + 'Recognize'),
  );
  Map<String, String> headers = {"Content-type": "multipart/form-data"};
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
  // send
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  return response.body.split('#')[0];
  //print(response.body.length);
  // setState(() {
  //  image = File(response.body); 
  // });
  //var stream = streamedResponse.stream;
  //var tempTany = await stream.toBytes();
  //final respStr = await response.stream.bytesToString();
  //print("STATUS CODE :${response.statusCode}");
  //dynamic decodedResponse = jsonDecode(respStr);
  //print(decodedResponse);
  // listen for response
  //response.stream.transform(utf8.decoder).listen((value) {
  //print(value);
  //});
}
