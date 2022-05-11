import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_states.dart';
import 'package:social_media_app/data/models/user.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_auth_helper.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  void signUpNewUser({required UserModel user}) async {
    print('email user ${user.email}');
    emit(SignUpLoadingState());
    var result = await FirebaseAuthHelper.signUp(
      email: user.email,
      password: user.password,
    );
    if (result is UserCredential) {
      print('true ${result.user!.uid}');
      FirebaseStoreHelper.addNewUser(
        user: UserModel(
          userId: result.user!.uid,
          username: user.username,
          email: user.email,
          password: user.password,
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
      print('false $result');
      emit(SignUpErrorState(result.toString()));
    }
  }
}
