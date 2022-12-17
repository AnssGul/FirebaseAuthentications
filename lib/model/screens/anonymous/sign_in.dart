import 'package:firebasepractice_app/model/screens/anonymous/auth_services.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: const Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child:ElevatedButton(
          child: const Text("Sign in anon"),
          onPressed: ()async{
           // await _auth.signInAnon();
            dynamic result = await _auth.signInAnon();
            if(result==null){
              print('error signing in');
            }else
              {
                print("sign in");
                print(result);
              }
          },
        ),
      ),
    );
  }
}
