abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final String error;

  ProfileErrorState(this.error) {
    print('profile error $error');
  }
}

class PickedProfileImageSuccessState extends ProfileStates {}

class PickedProfileImageErrorState extends ProfileStates {}

class PickedCoverImageSuccessState extends ProfileStates {}

class PickedCoverImageErrorState extends ProfileStates {}

class EditProfileLoadingState extends ProfileStates {}

class EditProfileSuccessState extends ProfileStates {}

class EditProfileErrorState extends ProfileStates {
  final String error;

  EditProfileErrorState(this.error) {
    print('Edit profile error $error');
  }
}
