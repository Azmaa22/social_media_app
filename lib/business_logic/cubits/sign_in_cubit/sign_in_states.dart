abstract class SignInStates {}

class SignInInitState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final String id;

  SignInSuccessState(this.id) {
    print('user sign in current id  $id');
  }
}

class SignInErrorState extends SignInStates {
  final String error;

  SignInErrorState(this.error) {
    print('user sign In error $error');
  }
}
