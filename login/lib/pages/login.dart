import 'package:flutter/material.dart';
import 'package:login/src/colors/colors.dart';
import 'package:login/src/widget/loginWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginWidgetState login = LoginWidgetState();
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorSelect.fund,
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
                    const Text("Login", style: TextStyle(color: Colors.white, fontSize: 34, fontFamily: "Schyler", fontWeight: FontWeight.bold)),
                    const Text("Welcome back" ,textAlign: TextAlign.start , style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Schyler")),

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
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.08)),
                  login.textFieldGeneral("Email", const Icon(Icons.email, color: Colors.black,)),
                  login.textFielPassword("Password", const Icon(Icons.password, color: Colors.black)),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.08)),
                  login.buttonGeneral(1, size, "Log in", ColorSelect.fund, Colors.white, Colors.white, "menu", context),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.02)),
                  const Text("-Or-" , style: TextStyle(fontSize: 18)),
                  Padding(padding: EdgeInsetsDirectional.only(top: size.height * 0.02)),
                  login.buttonGeneral(2, size, "Sign in", Colors.white, ColorSelect.fund, Colors.black, "register", context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
