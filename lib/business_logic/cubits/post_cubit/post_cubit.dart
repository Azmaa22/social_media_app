import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_states.dart';
import 'package:social_media_app/data/models/post_model.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';

class PostCubit extends Cubit<PostStates> {
  PostCubit() : super(PostInitState());
  static PostCubit get(context) => BlocProvider.of(context);
  String? postPhoto;
  final ImagePicker _picker = ImagePicker();
  void createNewPost({required PostModel post}) {
    String? postId;
    emit(CreatePostLoadingState());
    FirebaseStoreHelper.createNewPost(post: post).then((postCreated) {
      postCreated.then((postInfo) async {
        postId = postInfo.id.toString();
        await FirebaseStoreHelper.addPostId(postId: postId!);
        emit(
          CreatePostSuccessState(
            postId!,
          ),
        );
      });
    }).catchError((error) {
      emit(CreatePostErrorState(error));
    });
  }

  Future<void> uploadPostImage() async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      postPhoto = base64Encode(File(
        value!.path,
      ).readAsBytesSync());

      emit(PickedPostImageSuccessState());
    }).catchError((error) {
      print('post image error $error');
      emit(PickedPostImageErrorState());
    });
  }

  void removePickedImage() {
    postPhoto = null;
    emit(RemovePickedPostImageState());
  }
}
