import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_services_google.dart';
class HomePageGoogle extends StatefulWidget {
  const HomePageGoogle({Key? key}) : super(key: key);

  @override
  State<HomePageGoogle> createState() => _HomePageGoogleState();
}

class _HomePageGoogleState extends State<HomePageGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight:FontWeight.bold,
                color: Colors.black87
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              padding:const EdgeInsets.all(10),
              color: Colors.green,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Text('log out',style: TextStyle(
                color: Colors.white,fontSize: 15
              ),),
              onPressed:(){
                AuthServiceGoogle().signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
