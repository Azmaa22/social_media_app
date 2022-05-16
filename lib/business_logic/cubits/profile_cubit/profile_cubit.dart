import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_states.dart';
import 'package:social_media_app/data/models/user.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? user;
  void getProfileInfo() {
    emit(ProfileLoadingState());
    FirebaseStoreHelper.getCurrentUser(
      userId: SharedConstants.uId,
    ).then(
      (value) {
        var temp = value.data();
        user = UserModel.fromJson(temp);

        emit(ProfileSuccessState());
      },
    ).catchError((error) {
      print('error $error');
      emit(ProfileErrorState(error));
    });
  }
}
