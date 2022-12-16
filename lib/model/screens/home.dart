import 'package:firebasepractice_app/model/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Logout"),
        onPressed:(){
          auth.signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=> LoginScreen()));
        },
        ),
      ),
    );
  }
}