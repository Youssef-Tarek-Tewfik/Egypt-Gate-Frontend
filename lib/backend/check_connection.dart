import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart';

// Makes a simple get request to and checks if the response code is 200 "OK"
Future<bool> checkConnection() async {
  // final Request request = Request("GET", Uri.parse("https://www.google.com/"));
  // final streamedResponse = await request.send();
  // final response = await Response.fromStream(streamedResponse).timeout(
  //   Duration(seconds: 3),
  //   onTimeout: () {
  //     return Response("", 404);
  //   },
  // );
  // return (response.statusCode == 200);
  bool connected = false;
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    connected = true;
  }
  else if (connectivityResult == ConnectivityResult.wifi) {
    connected = true;
  }
  return connected;
}