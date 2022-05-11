import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:social_media_app/helpers/firebase_helper/firebase_auth_helper.dart';
import 'package:social_media_app/presentation/components/button.dart';
import 'package:social_media_app/presentation/components/image_container.dart';
import 'package:social_media_app/presentation/components/input.dart';
import 'package:social_media_app/presentation/components/label.dart';
import 'package:social_media_app/presentation/components/social_button.dart';
import 'package:social_media_app/presentation/screens/registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              const ImageContainer(image: 'assets/images/login.png'),
              const Label(
                title: 'Login',
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
              Input(
                name: 'emial',
                placeholder: 'please enter your email',
                icon: 'assets/svgs/email-svgrepo-com.svg',
                label: 'email',
                textInputType: TextInputType.emailAddress,
                onChange: (value) {
                  debugPrint('login email value $value');
                },
                onValidate: (value) {
                  FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'you should enter your email',
                    ),
                    FormBuilderValidators.email(
                      errorText: 'you should enter valid email',
                    ),
                  ]);
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Input(
                name: 'password',
                placeholder: 'please enter your password',
                icon: 'assets/svgs/lock-svgrepo-com.svg',
                label: 'password',
                isPassword: true,
                textInputType: TextInputType.visiblePassword,
                onChange: (value) {
                  debugPrint('login password value $value');
                },
                onValidate: (value) {
                  FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'you should enter your password',
                    ),
                  ]);
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Button(
                title: 'Login',
                onPress: () {
                  print('email value : ${emailController.text}');
                  print('password value : ${passwordController.text}');
                  FirebaseAuthHelper.signUp(
                      email: emailController.text,
                      password: passwordController.text);
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Center(
                child: Label(
                  title: 'Or, Login with...',
                  fontColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  SocialButton(
                    icon: 'assets/svgs/google-svgrepo-com.svg',
                    onPress: () {
                      print('email value : ${emailController.text}');
                      print('password value : ${passwordController.text}');
                    },
                  ),
                  SocialButton(
                    icon: 'assets/svgs/facebook-svgrepo-com.svg',
                    onPress: () {
                      print('email value : ${emailController.text}');
                      print('password value : ${passwordController.text}');
                    },
                  ),
                  SocialButton(
                    icon: 'assets/svgs/apple-svgrepo-com-2.svg',
                    onPress: () {
                      print('email value : ${emailController.text}');
                      print('password value : ${passwordController.text}');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Label(
                    title: 'if you don\'t have account please',
                    fontColor: Colors.grey,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    child: const Label(
                      title: 'Register',
                      fontColor: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
