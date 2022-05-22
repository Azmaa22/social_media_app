import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/business_logic/cubits/user_cubit/user_states.dart';
import 'package:social_media_app/data/models/user_model.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_store_helper.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitStates());
  static UserCubit get(context) => BlocProvider.of(context);
  List<UserModel> users = [];

  void getAllUsers() {
    emit(GetAllUserLoadingState());

    if (users.isEmpty) {
      FirebaseStoreHelper.getUsers().then((value) {
        value.docs.forEach((element) {
          UserModel temp = UserModel.fromJson(element.data());
          if (temp.userId != SharedConstants.uId) {
            users.add(temp);
            emit(GetAllUserSuccessState());
          }
        });
      }).catchError((error) {
        emit(GetAllUserErrorState(error));
      });
    }
  }
}
