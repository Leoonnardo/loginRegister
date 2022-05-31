
import 'package:flutter/cupertino.dart';
import 'package:login/services/service_login.dart';
import 'package:login/services/service_register.dart';

class RegisterProvider extends ChangeNotifier {

  Future<String> register(emailText, passwordText, phone) async {
    print(emailText);
    print(passwordText);
    print(phone);
    return await serviceRegister(
      email: emailText,
      password: passwordText,
      phone: phone
    ).then((value){
        print(value["status"]!);
        return value["status"]!;
      },
    );
  }

}