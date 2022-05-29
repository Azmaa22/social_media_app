import 'package:flutter/material.dart';

class UserStates {}

class UserInitStates extends UserStates {}

class GetAllUserLoadingState extends UserStates {}

class GetAllUserSuccessState extends UserStates {}

class GetAllUserErrorState extends UserStates {
  final String error;

  GetAllUserErrorState(this.error) {
    debugPrint('Error while get all users $error');
  }
}

class GetUserLoadingState extends UserStates {}

class GetUserSuccessState extends UserStates {}

class GetUserErrorState extends UserStates {
  final String error;

  GetUserErrorState(this.error) {
    debugPrint('Error while get all users $error');
  }
}
