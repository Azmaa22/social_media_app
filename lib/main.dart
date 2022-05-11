import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:social_media_app/presentation/screens/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:social_media_app/presentation/screens/registration_screen/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          appId: '1:743132564416:android:bb6766653e6a2c7d6bd625',
          apiKey: 'AIzaSyBLcmEWNsgx1ksnYAQZbFc2iA56S66-Q9A',
          messagingSenderId: 'my_messagingSenderId',
          projectId: 'iti-task-1fc63'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
        home: RegistrationScreen(),
        routes: {
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ProfileScreen.id: (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
