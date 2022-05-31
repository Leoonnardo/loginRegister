import 'package:flutter/material.dart';
import 'package:login/provider/register_provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => RegisterWidgetState();
}

class RegisterWidgetState extends State<RegisterWidget> {
  RegisterProvider provider = RegisterProvider();
  bool _security = true;
  String textEmail = "";
  String textPassword = "";
  String textPhone = "";
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Container textFieldGeneral(String text, Icon icons){
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
        onChanged: (text) {
          textPhone = text;
        },
      ),
    );
  }

  Container buttonGeneral(id, size, String text, Color colorPrimary, Color colorSide, Color colorText, String route, context){
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
              provider.register(textEmail, textPassword, textPhone).then((value) {
                if (value == "201"){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(milliseconds: 1000),
                      content: Text('Account created'),
                    ),
                  );
                  Navigator.pushNamed(context, route);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(milliseconds: 1000),
                      content: Text('Error loading data'),
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