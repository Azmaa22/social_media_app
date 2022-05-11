import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:social_media_app/business_logic/cubits/sign_up_cubit/sign_up_cubit_route.dart';
import 'package:social_media_app/constants/colors.dart';
import 'package:social_media_app/data/models/user.dart';
import 'package:social_media_app/presentation/components/components.dart';
import 'package:social_media_app/presentation/screens/login_screen/login_screen.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = 'RegistrationScreen';
  RegistrationScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final String userName = 'userName';
  final String email = 'email';
  final String password = 'password';

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
                        onPress: () {},
                      ),
                      SocialButton(
                        icon: 'assets/svgs/facebook-svgrepo-com.svg',
                        onPress: () {},
                      ),
                      SocialButton(
                        icon: 'assets/svgs/apple-svgrepo-com-2.svg',
                        onPress: () {},
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
                  FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        Input(
                          name: userName,
                          placeholder: 'please enter your user name',
                          icon: 'assets/svgs/user-svgrepo-com.svg',
                          label: 'user name',
                          textInputType: TextInputType.text,
                          onChange: (value) {
                            debugPrint('user name value $value');
                          },
                          onValidate: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'you should enter your user name ',
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Input(
                          name: email,
                          placeholder: 'please enter your email',
                          icon: 'assets/svgs/email-svgrepo-com.svg',
                          label: 'email',
                          textInputType: TextInputType.emailAddress,
                          onChange: (value) {
                            debugPrint('user email value $value');
                          },
                          onValidate: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'you should enter your email',
                            ),
                            FormBuilderValidators.email(
                              errorText: 'you should enter valid email',
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Input(
                          name: password,
                          placeholder: 'please enter your password',
                          icon: 'assets/svgs/lock-svgrepo-com.svg',
                          label: 'password',
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          onChange: (value) {
                            debugPrint('password value $value');
                          },
                          onValidate: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'you should enter your password',
                            ),
                            FormBuilderValidators.match(
                              '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}',
                              errorText:
                                  'please enter at least 8 char\nMinimum 1 Upper case\n Minimum 1 lowercase\n Minimum 1 Numeric Number \nMinimum 1 Special Character\nCommon Allow Character ( ! @ #\$ & * ~ )',
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Button(
                          title: 'Sign Up',
                          onPress: () {
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                              var user = _formKey.currentState!.value;
                              print('value of state $user');
                              print('tets ${user[userName]} ${user[email]}');

                              myCubit.signUpNewUser(
                                user: UserModel(
                                  username: user[userName],
                                  email: user[email],
                                  password: user[password],
                                ),
                              );
                            } else {
                              print("validation failed");
                            }
                          },
                        ),
                      ],
                    ),
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
            },
            listener: (context, state) {
              print('current state $state');
              if (state is UserCreateSuccessState) {
                print('open profile page $state');
                Navigator.pushNamed(
                  context,
                  ProfileScreen.id,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
