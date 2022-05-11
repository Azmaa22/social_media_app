import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  static dynamic signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('userCredential $userCredential');
      return userCredential;
    }
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // }
    catch (e) {
      print('other error $e');
      return e;
    }
  }
}
