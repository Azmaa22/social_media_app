import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_states.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/data/models/user_model.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_auth_helper.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';
import 'package:social_media_app/helpers/image_helper/image_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';
import 'package:social_media_app/helpers/shared_preferences_helper/shared_preferences_helper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  void signUpNewUser({required UserModel user}) async {
    emit(SignUpLoadingState());
    var result = await FirebaseAuthHelper.signUp(
      email: user.email,
      password: user.password,
    );
    if (result is UserCredential) {
      SharedPreferencesHelper.saveData(
        key: 'uId',
        value: result.user?.uid,
      );
      SharedConstants.uId = result.user!.uid;

      FirebaseStoreHelper.addNewUser(
        user: UserModel(
          userId: result.user!.uid,
          username: user.username,
          email: user.email,
          password: user.password,
          image: base64Encode(
            await ImageHelper.getNetworkImage(
              ImageManager.profilePlaceholder,
            ),
          ),
          cover: base64Encode(
            await ImageHelper.getNetworkImage(
              ImageManager.coverPlaceholder,
            ),
          ),
          bio: 'Write your bio...',
        ),
      ).then(
        (value) {
          emit(SignUpSuccessState());
          emit(UserCreateSuccessState());
        },
      ).catchError((error) {
        emit(UserCreateErrorState(error));
      });
    } else {
      emit(SignUpErrorState(result.toString()));
    }
  }
}
