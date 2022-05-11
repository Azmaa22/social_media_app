abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String error;

  SignUpErrorState(this.error) {
    print('user sign up error $error');
  }
}

class UserCreateSuccessState extends SignUpStates {}

class UserCreateErrorState extends SignUpStates {
  final String error;

  UserCreateErrorState(this.error) {
    print('user creation error $error');
  }
}
