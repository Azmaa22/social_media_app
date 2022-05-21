import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/business_logic/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_cubit.dart';

class AppBlocProvider {
  static List<BlocProvider> appBlocProvider = [
    BlocProvider<SignUpCubit>(
      create: (BuildContext context) => SignUpCubit(),
    ),
    BlocProvider<SignInCubit>(
      create: (BuildContext context) => SignInCubit(),
    ),
    BlocProvider<NavigationCubit>(
      create: (BuildContext context) => NavigationCubit(),
    ),
    BlocProvider<ProfileCubit>(
      create: (BuildContext context) => ProfileCubit()..getProfileInfo(),
    ),
    BlocProvider<PostCubit>(
      create: (BuildContext context) => PostCubit(),
    ),
  ];
}
