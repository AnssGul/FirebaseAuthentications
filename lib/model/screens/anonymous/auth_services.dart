import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' hide UserCredential;
class AuthService{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  //User? get currentUser => _firebaseAuth.currentUser;
  Future signInAnon() async {
    try{
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user =  result.user;
      return user;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
    // if(currentUser==null){
    //   await FirebaseAuth.instance.signInAnonymously();
    // }
    // return currentUser;
  }
}