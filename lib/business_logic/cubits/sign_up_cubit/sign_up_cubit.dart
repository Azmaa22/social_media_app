import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_states.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/data/models/user.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_auth_helper.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';

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
      SharedConstants.uId = result.user!.uid;
      FirebaseStoreHelper.addNewUser(
        user: UserModel(
          userId: result.user!.uid,
          username: user.username,
          email: user.email,
          password: user.password,
          image: ImageManager.profilePlaceholder,
          cover: ImageManager.coverPlaceholder,
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
      print('false $result');
      emit(SignUpErrorState(result.toString()));
    }
  }
}
