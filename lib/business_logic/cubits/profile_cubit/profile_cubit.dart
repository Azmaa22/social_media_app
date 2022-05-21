import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_states.dart';
import 'package:social_media_app/data/models/user.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? user;

  String? profilePhoto, coverPhoto;
  final ImagePicker _picker = ImagePicker();

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
      emit(ProfileErrorState(error));
    });
  }

  Future<void> chooseProfileImage() async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      profilePhoto = base64Encode(File(
        value!.path,
      ).readAsBytesSync());

      emit(PickedProfileImageSuccessState());
    }).catchError((error) {
      print('profile image error $error');
      emit(PickedProfileImageErrorState());
    });
  }

  Future<void> chooseCoverImage() async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      coverPhoto = base64Encode(File(
        value!.path,
      ).readAsBytesSync());
      emit(PickedCoverImageSuccessState());
    }).catchError((error) {
      print('cover image error $error');
      emit(PickedCoverImageErrorState());
    });
  }

  void editUserProfile(UserModel user) async {
    emit(EditProfileLoadingState());
    bool? result = await FirebaseStoreHelper.updateUser(
      user: user,
    );

    if (result == true) {
      emit(EditProfileSuccessState());
      getProfileInfo();
    } else if (result == false || result == null) {
      emit(EditProfileErrorState('Error while Edit Profile'));
    }
  }
}
