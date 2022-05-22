import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/data/models/message_model.dart';
import 'package:social_media_app/data/models/post_model.dart';
import 'package:social_media_app/data/models/user_model.dart';

class FirebaseStoreHelper {
  static CollectionReference users = getYourCollection(collectionName: 'users');
  static CollectionReference posts = getYourCollection(collectionName: 'posts');

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
    required String senderId,
    required String receiverId,
  }) {
    return users
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        // .orderBy('dateTime')
        .snapshots();
  }

  static addMessageId({
    required String senderId,
    required String receiverId,
    required String messageId,
  }) async {
    await users
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .doc(messageId)
        .update({
      'messageId': messageId,
    });
  }

  static Future<DocumentReference<Map<String, dynamic>>> sendMessage(
      {required MessageModel message}) async {
    var sentMessage = await users
        .doc(message.senderId)
        .collection('chats')
        .doc(message.receiverId)
        .collection('messages')
        .add(message.toJson());

    return sentMessage;
  }

  static Future<QuerySnapshot<Object?>> getUsers() async {
    QuerySnapshot<Object?> data = await users.get();

    return data;
  }

  static Future<QuerySnapshot<Object?>> getPosts() async {
    QuerySnapshot<Object?> data = await posts.get();

    return data;
  }

  static addPostId({required String postId}) async {
    await posts.doc(postId).update({
      'postId': postId,
    });
  }

  static Future<dynamic> likePost({
    required String postId,
    required String userId,
    required bool isLike,
  }) async {
    var postLiked =
        await posts.doc(postId).collection('likes').doc(userId).set({
      'isLike': isLike,
    });
    return postLiked;
  }

  static Future<bool?> updatePost({
    required String postId,
    required String postContent,
    required String postImage,
  }) async {
    bool? isUpdated;
    await posts.doc(postId).update({
      'postId': postId,
      'postContent': postContent,
      'postImage': postImage,
    }).then((value) {
      isUpdated = true;
    }).catchError((error) {
      isUpdated = false;
    });
    return isUpdated;
  }

  static Future<Future<DocumentReference<Object?>>> createNewPost(
      {required PostModel post}) async {
    var newPost = posts.add(post.toJson());

    return newPost;
  }

  static Future<dynamic> addNewUser({required UserModel user}) async {
    var newUser = users.doc(user.userId).set(user.toJson());

    return newUser;
  }

  static Future<DocumentSnapshot> getCurrentUser(
      {required String userId}) async {
    DocumentSnapshot currentUser = await users.doc(userId).get();

    return currentUser;
  }

  static Future<bool?> updateUser({required UserModel user}) async {
    bool? isUpdated;
    await users.doc(user.userId).update({
      'username': user.username,
      'image': user.image,
      'cover': user.cover,
      'bio': user.bio,
    }).then((value) {
      isUpdated = true;
    }).catchError((error) {
      isUpdated = false;
    });
    return isUpdated;
  }

  static CollectionReference getYourCollection(
      {required String collectionName}) {
    CollectionReference currentCollection =
        FirebaseFirestore.instance.collection(collectionName);
    return currentCollection;
  }
}
