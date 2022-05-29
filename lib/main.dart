import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:social_media_app/business_logic/cubits/app_bloc_provider.dart';
import 'package:social_media_app/constants/routes_manager.dart';
import 'package:social_media_app/constants/theme_manager.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';
import 'package:social_media_app/helpers/shared_preferences_helper/shared_preferences_helper.dart';
import 'package:social_media_app/presentation/screens/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/presentation/screens/navigation_container/navigation_container.dart';

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
  var token = await FirebaseMessaging.instance.getToken();
  // debugPrint('device token : $token');
  SharedConstants.token = token!;
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification title: ${message.notification!.title.toString()}');
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    debugPrint('event --> ${event.data.toString()}');
  });
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    debugPrint('event onbackground --> ${message.data.toString()}');
  }

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  Widget widget;
  var userId = SharedPreferencesHelper.getData(key: 'uId');
  SharedConstants.uId = userId ?? '';

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
        routes: RoutesManager.routes,
      ),
    );
  }
}
