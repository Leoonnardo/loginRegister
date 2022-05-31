import 'package:flutter/material.dart';
import 'package:login/src/colors/colors.dart';
import 'package:login/src/widget/registerWidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterWidgetState register = RegisterWidgetState();

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorSelect.fundRegister,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 20),
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.07)),
                    const Text("Register", style: TextStyle(color: Colors.white, fontSize: 34, fontFamily: "Schyler", fontWeight: FontWeight.bold)),
                    const Text("New account" ,textAlign: TextAlign.start , style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Schyler")),

                  ],
                )
              ),
            ),
            Container(
              height: size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.01)),
                  Image.asset('asset/images/work.png', scale: 2,),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.04)),
                  register.textFieldGeneral("Email", const Icon(Icons.email, color: Colors.black,)),
                  register.textFielPassword("Password", const Icon(Icons.password, color: Colors.black)),
                  register.textFieldNumber("Phone", const Icon(Icons.phone_android, color: Colors.black,)),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.03)),
                  register.buttonGeneral(1, size, "Create account", ColorSelect.fundRegister, Colors.white, Colors.white, "menu", context),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.02)),
                  const Text("-Or-" , style: TextStyle(fontSize: 18)),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.02)),
                  register.buttonGeneral(2, size, "Log in", Colors.white, ColorSelect.fundRegister, Colors.black, "login", context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
