import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_cubit_route.dart';
import 'package:social_media_app/constants/colors.dart';
import 'package:social_media_app/data/models/user.dart';
import 'package:social_media_app/presentation/components/components.dart';
import 'package:social_media_app/presentation/screens/login_screen/login_screen.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = 'RegistrationScreen';
  RegistrationScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocConsumer<SignUpCubit, SignUpStates>(
              builder: (context, state) {
            SignUpCubit myCubit = SignUpCubit.get(context);
            if (state is SignUpLoadingState) {
              return const CircularProgressIndicator(
                color: profileColor,
              );
            }
            if (state is SignUpErrorState) {
              return const Center(
                child: Text(
                  'SignUpErrorState',
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                const ImageContainer(image: 'assets/images/register.png'),
                const Label(
                  title: 'Sign Up',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
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
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Center(
                  child: Label(
                    title: 'Or, Register with email...',
                    fontColor: Colors.grey,
                  ),
                ),
                Input(
                  controller: userNameController,
                  placeholder: 'please enter your user name',
                  icon: 'assets/svgs/user-svgrepo-com.svg',
                  label: 'user name',
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Input(
                  controller: emailController,
                  placeholder: 'please enter your email',
                  icon: 'assets/svgs/email-svgrepo-com.svg',
                  label: 'email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Input(
                  controller: passwordController,
                  placeholder: 'please enter your password',
                  icon: 'assets/svgs/lock-svgrepo-com.svg',
                  label: 'password',
                  isPassword: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Button(
                  title: 'Sign Up',
                  onPress: () {
                    print('email value : ${emailController.text}');
                    print('password value : ${passwordController.text}');
                    myCubit.signUpNewUser(
                      user: UserModel(
                        username: userNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Label(
                      title: 'if you already have account please',
                      fontColor: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: const Label(
                        title: 'Login',
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
            );
          }, listener: (context, state) {
            print('current state $state');
            if (state is UserCreateSuccessState) {
              print('open profile page $state');
              Navigator.pushNamed(
                context,
                ProfileScreen.id,
              );
            }
          }),
        ),
      ),
    );
  }
}
