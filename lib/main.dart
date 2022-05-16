import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:social_media_app/business_logic/cubits/app_bloc_provider.dart';
import 'package:social_media_app/business_logic/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:social_media_app/constants/theme_manager.dart';
import 'package:social_media_app/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:social_media_app/presentation/screens/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/presentation/screens/navigation_container/navigation_container.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:social_media_app/presentation/screens/registration_screen/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        appId: '1:743132564416:android:bb6766653e6a2c7d6bd625',
        apiKey: 'AIzaSyBLcmEWNsgx1ksnYAQZbFc2iA56S66-Q9A',
        messagingSenderId: 'my_messagingSenderId',
        projectId: 'iti-task-1fc63'),
  );
  await SharedPreferencesHelper.initSharedPreferences();

  Widget widget;

  var userId = SharedPreferencesHelper.getData(key: 'uId');

  if (userId != null) {
    widget = const NavigationContainer();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.appBlocProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme,
        home: startWidget,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        routes: {
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ProfileScreen.id: (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
