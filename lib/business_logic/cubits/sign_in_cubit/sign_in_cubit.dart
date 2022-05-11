import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_auth_helper.dart';

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
      print('User login now $result');
      emit(
        SignInSuccessState('id'),
      );
    } else {
      emit(
        SignInErrorState('error in sign in'),
      );
    }
  }
}
