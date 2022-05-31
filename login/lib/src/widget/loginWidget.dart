import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:login/provider/login_provider.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  LoginProvider provider = LoginProvider();
  bool _security = true;
  final email = TextEditingController();
  final password = TextEditingController();

  String textEmail = "";
  String textPassword = "";


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Container textFieldGeneral(String text, Icon icons){
    return Container(
      height: 60,
      margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
      child: TextField(
        controller: email,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 18),
        autofocus: true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.black,
            )
          ),
          icon: icons,
          hintText: text,
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (text) {
          textEmail = text;
        },
      ),
    );
  }

  Container textFielPassword(String text, Icon icons){
    return Container(
      height: 60,
      margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
      child: TextField(
        controller: password,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 18),
        autofocus: true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.black,
            )
          ),
          suffix: IconButton(
            icon: Icon(_security ? Icons.visibility : Icons.visibility_off ),
            onPressed: (){
              setState(() {
                _security = !_security;
              });
            },
          ),
          icon: icons,
          hintText: text,
        ),
        obscureText: _security,
        onChanged: (text) {
          textPassword = text;
        },
      ),
    );
  }

  Container textFieldNumber(String text, Icon icons){
    return Container(
      height: 60,
      margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
      child: TextField(
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 18),
        autofocus: true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.black,
            )
          ),
          icon: icons,
          hintText: text,
        ),
        keyboardType: TextInputType.phone,
        onChanged: (text) {},
      ),
    );
  }

  Container buttonGeneral(int id, size, String text, Color colorPrimary, Color colorSide, Color colorText, String route, context){
    return Container(
      child: SizedBox(
        width: size.width - 180,
        height: 50,
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: colorText),
          ),
          onPressed: () {
            if (id == 1){
              provider.login(textEmail, textPassword).then((value) {
                if (value == "200"){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(milliseconds: 1000),
                      content: Text('Logging in'),
                    ),
                  );
                  Navigator.pushNamed(context, route);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(milliseconds: 1000),
                      content: Text('Email or password incorrect'),
                    ),
                  );
                }
              });
            } else{
              Navigator.pushNamed(context, route);
            }
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: colorSide,
            ),
            primary: colorPrimary ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
          )
        ),
      ),
    );
  }
}