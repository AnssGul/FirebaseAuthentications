import 'package:firebasepractice_app/model/screens/anonymous/googleAuthentication/google_login.dart';
import 'package:firebasepractice_app/model/screens/anonymous/googleAuthentication/home_page_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthServiceGoogle {
  //handleAuthState
  // signInWithGoogle
  // signOut
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePageGoogle();
        }
        else {
          return const LoginPageGoogle();
        }
      },);
  }
    siggInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
          scopes: <String>['email']).signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!
          .authentication;
      final credendials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credendials);
    }
signOut() {
  FirebaseAuth.instance.signOut();
}


}