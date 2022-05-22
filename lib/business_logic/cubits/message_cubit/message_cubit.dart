import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/message_cubit/message_states.dart';
import 'package:social_media_app/data/models/message_model.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';

class MessageCubit extends Cubit<MessageStates> {
  MessageCubit() : super(MessageInitState());
  static MessageCubit get(context) => BlocProvider.of(context);
  List<MessageModel> messages = [];
  void getMessages({
    required String receiverId,
  }) {
    FirebaseStoreHelper.getAllMessages(
            senderId: SharedConstants.uId, receiverId: receiverId)
        .listen((event) {
      messages.clear();
      event.docs.forEach((element) {
        messages.add(
          MessageModel.fromJson(
            element.data(),
          ),
        );
      });
      emit(GetMessageSuccessState());
    });
  }

  void sendNewMessage({
    required String receiverId,
    required String message,
    required String dateTime,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(SharedConstants.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(MessageModel(
          senderId: SharedConstants.uId,
          receiverId: receiverId,
          messageText: message,
          dateTime: dateTime,
        ).toJson())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
    // add chat to sender
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(SharedConstants.uId)
        .collection('messages')
        .add(MessageModel(
          senderId: SharedConstants.uId,
          receiverId: receiverId,
          messageText: message,
          dateTime: dateTime,
        ).toJson())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
  }
}
