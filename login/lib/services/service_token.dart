import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> serviceToken() async{
  var url = "http://dev.memry.feelycom.com/rmnd/api/login";
  final response = http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8' 
    },
    body: jsonEncode(<String, String>{
      "username": "webclient",
      "password": "Th3Fl1RtRPa55W0rd"
    }),
  );
  return await response.then((value) => value.headers["authorization"]!);
}