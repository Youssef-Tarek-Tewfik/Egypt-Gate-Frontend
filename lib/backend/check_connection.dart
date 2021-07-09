import 'package:http/http.dart';

// Makes a simple get request to and checks if the response code is 200 "OK"
Future<bool> checkConnection() async {
  final Request request = Request("GET", Uri.parse("https://www.google.com/"));
  final streamedResponse = await request.send();
  final response = await Response.fromStream(streamedResponse);
  return (response.statusCode == 200);
}