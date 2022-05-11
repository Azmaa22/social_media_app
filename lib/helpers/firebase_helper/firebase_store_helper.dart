import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/data/models/user.dart';

class FirebaseStoreHelper {
  //static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<dynamic> addNewUser({required UserModel user}) async {
    CollectionReference users = getYourCollection(collectionName: 'users');
    var newUser = users.doc(user.userId).set(user.toJson());

    // users.add(user.toJson()).then((value) {
    //   print('value user created : $value');
    // }).catchError((error) {
    //   print('error while create user ${error.toString()}');
    // });
    return newUser;
  }

  static CollectionReference getYourCollection(
      {required String collectionName}) {
    CollectionReference currentCollection =
        FirebaseFirestore.instance.collection(collectionName);
    return currentCollection;
  }
}
