import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_auth_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';
import 'package:social_media_app/helpers/shared_preferences_helper/shared_preferences_helper.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitState());
  static SignInCubit get(context) => BlocProvider.of(context);
  void signInUser({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    var result =
        await FirebaseAuthHelper.signIn(email: email, password: password);
    if (result is UserCredential) {
      SharedPreferencesHelper.saveData(
        key: 'uId',
        value: result.user?.uid,
      );
      SharedConstants.uId = result.user!.uid;
      debugPrint('from signin ${SharedConstants.uId}');
      emit(
        SignInSuccessState(
          result.user!.uid,
        ),
      );
    } else {
      emit(
        SignInErrorState('error in sign in'),
      );
    }
  }
}
