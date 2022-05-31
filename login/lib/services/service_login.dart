import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/services/service_token.dart';

Future<Map<String, String>> serviceLogin({
  required String email,
  required String password,
}) async {
  final authorization = await serviceToken();
  print(authorization);
  final response = http.post(
    Uri.parse("http://dev.memry.feelycom.com/rmnd/api/access/log-in"),
    headers: <String, String> {
      'Content-Type' : 'application/json; charset=UTF-8',
      'Authorization' : authorization 
    },
    body: jsonEncode(<String, String> {
      'email' : email,
      'password' : password,
    }),
  );
  return await response.then(
    (value) => {
      "status" : value.statusCode.toString(),
      "mesagge" : jsonDecode(value.body)["message"].toString(),
    },
  );
}