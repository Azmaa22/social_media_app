import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/data/models/user.dart';

class FirebaseStoreHelper {
  static CollectionReference users = getYourCollection(collectionName: 'users');
  static Future<dynamic> addNewUser({required UserModel user}) async {
    var newUser = users.doc(user.userId).set(user.toJson());

    return newUser;
  }

  static Future<DocumentSnapshot> getCurrentUser(
      {required String userId}) async {
    DocumentSnapshot currentUser = await users.doc(userId).get();

    return currentUser;
  }

  static CollectionReference getYourCollection(
      {required String collectionName}) {
    CollectionReference currentCollection =
        FirebaseFirestore.instance.collection(collectionName);
    return currentCollection;
  }
}
