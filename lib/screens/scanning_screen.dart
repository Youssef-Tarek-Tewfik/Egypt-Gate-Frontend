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

String apiLink = 'https://egypt-gate-backend-2nhtl.ondigitalocean.app/';
//String apiLink = 'http://c07dd37e4f69.ngrok.io/';
void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Future<String> GetData(eshta) async {
    final response = await http.get(apiLink + '/Second/' + eshta);
    print(response.body);
    return response.body;
  }

  void sendImage(File image) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(apiLink + 'Recognize'));

    //request.fields['Image'] = image.writeAsBytes();
    request.files.add(
      await http.MultipartFile.fromPath(
        'images',
        image.path,
        contentType: MediaType('application', 'jpeg'),
      ),
    );
    // var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
    // var length = await image.length();
    // var request = new http.MultipartRequest("POST",Uri.parse(apiLink + 'Recognize'));
    // var multipartFile = new http.MultipartFile('file', stream, length,
    //     filename: image.path);
    // request.files.add(multipartFile);
    print("PATH : ${request.url}");
    http.StreamedResponse r = await request.send();
    print("STATUS CODE : ${r.statusCode}");
    print(await r.stream.transform(utf8.decoder).join());
  }

//Image.network(apiLink + 'Nefertiti_10.jpg/hog/encodings.pickle')
  File image;
  Future getImage() async {
    var captured = await ImagePicker.pickImage(source: ImageSource.camera);
    image = captured;
    upload(captured);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Image'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.camera),
      ),
      body: Center(
        child: image == null
            ? Text('No image captured yet...')
            : Image(
                image: FileImage(image),
              ),
      ),
      /*body: Text(
        GetData('eshtaaa')
      ),*/
    );
  }

  upload(File imageFile) async {
    /*
  // open a bytestream
  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse(apiLink + 'Recognize');

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('ImageFile', stream, length,
      filename: basename(imageFile.path));

  // add file to multipart
  request.files.add(multipartFile);*/
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

    //print(response.body.length);
    // setState(() {
    //  image = File(response.body);
    // });
    //var stream = streamedResponse.stream;
    //var tempTany = await stream.toBytes();
    File x = image;
    print(response.body);
    setState(() {
      image = x;
    });

    //final respStr = await response.stream.bytesToString();
    //print("STATUS CODE :${response.statusCode}");
    //dynamic decodedResponse = jsonDecode(respStr);
    //print(decodedResponse);
    // listen for response
    //response.stream.transform(utf8.decoder).listen((value) {
    //print(value);
    //});
  }
}
