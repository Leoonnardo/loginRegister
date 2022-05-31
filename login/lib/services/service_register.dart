import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/services/service_token.dart';

Future<Map<String, String>> serviceRegister({
  required String email,
  required String password,
  required String phone,
}) async {
  final authorization = await serviceToken();
  final response = http.post(
    Uri.parse("http://dev.memry.feelycom.com/rmnd/api/access/sign-in"),
    headers: <String, String> {
      'Content-Type' : 'application/json; charset=UTF-8',
      'Authorization' : authorization 
    },
    body: jsonEncode(<String, String>{
      'email' : email,
      'password' : password,
      'phone' : phone,
    }),
  );
  return await response.then(
    (value) => {
      "status" : value.statusCode.toString(),
      "message" : jsonDecode(value.body)["message"].toString(),
    },
  );
}