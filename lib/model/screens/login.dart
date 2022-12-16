import 'package:firebasepractice_app/model/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',

              ),
    onChanged: (value) {
      setState(() {
        _email = value.toString();
      });
    }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
             obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
              onChanged: (value){
               setState(() {
                 _password = value.toString();
               });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(

                  child: Text("Sign In")
                  ,onPressed:(){
auth.signInWithEmailAndPassword(email: _email, password: _password);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }, ),
    ElevatedButton(

    child: Text("Sign up")
    ,onPressed:(){
      auth.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=> HomeScreen()));
    }, )
            ],
          )
        ],
      ),
    );
  }
}

