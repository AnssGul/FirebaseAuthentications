import 'package:firebasepractice_app/model/screens/login.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Login App",
    theme: ThemeData(
accentColor: Colors.orange,
primarySwatch: Colors.blue
    ),
    home: LoginScreen(),
    );
  }
}
