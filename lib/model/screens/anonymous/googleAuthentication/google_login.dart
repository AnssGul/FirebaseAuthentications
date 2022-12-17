import 'package:firebasepractice_app/model/screens/anonymous/googleAuthentication/auth_services_google.dart';
import 'package:flutter/material.dart';
class LoginPageGoogle extends StatefulWidget {
  const LoginPageGoogle({Key? key}) : super(key: key);

  @override
  State<LoginPageGoogle> createState() => _LoginPageGoogleState();
}

class _LoginPageGoogleState extends State<LoginPageGoogle> {
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Login"),
      ),
      body: Container(
        width:size.width,
        height: size.height,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: size.height*0.2,
          bottom: size.height*0.5
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
          Text("Hello,\nGoogle sign in",
          style: TextStyle(
            fontSize: 30
          ),
          ) ,
          GestureDetector(
            onTap:() {
              AuthServiceGoogle().siggInWithGoogle();
            },
child: Image.asset("images/google.png",
width: 100,),
          )
          ],
        ),
      ),
    );
  }
}
