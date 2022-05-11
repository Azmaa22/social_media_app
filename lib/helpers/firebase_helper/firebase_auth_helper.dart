import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static dynamic signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('userCredential $userCredential');
      return userCredential;
    } catch (e) {
      print('other error $e');
      return e;
    }
  }

  static dynamic signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      return e;
    }
  }
}
