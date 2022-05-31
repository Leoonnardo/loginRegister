
import 'package:flutter/cupertino.dart';
import 'package:login/services/service_login.dart';

class LoginProvider extends ChangeNotifier {

  Future<String> login(emailText, passwordText) async {
    print(emailText);
    print(passwordText);
    return await serviceLogin(
      email: emailText,
      password: passwordText).then((value){
        print(value["status"]!);
        return value["status"]!;
      },
    );
  }

}