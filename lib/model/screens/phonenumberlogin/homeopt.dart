import 'package:firebasepractice_app/model/screens/app.dart';
import 'package:flutter/material.dart';
class MyHomeOpt extends StatefulWidget {
  const MyHomeOpt({Key? key}) : super(key: key);

  @override
  State<MyHomeOpt> createState() => _MyHomeOptState();
}

class _MyHomeOptState extends State<MyHomeOpt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
