import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:social_media_app/business_logic/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:social_media_app/business_logic/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/presentation/components/components.dart';
import 'package:social_media_app/presentation/screens/navigation_container/navigation_container.dart';
import 'package:social_media_app/presentation/screens/registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
  LoginScreen({Key? key}) : super(key: key);
  final String email = 'email';
  final String password = 'password';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.kWhiteColor,
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
              BlocConsumer<SignInCubit, SignInStates>(
                listener: (context, state) {
                  print('current state $state');
                  if (state is SignInSuccessState) {
                    print('open profile page from login $state');
                    Navigator.pushNamed(
                      context,
                      NavigationContainer.id,
                    );
                  }
                  if (state is SignInErrorState) {
                    print('error from login $state');
                  }
                },
                builder: (context, state) {
                  SignInCubit myCubit = SignInCubit.get(context);
                  return FormBuilder(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      children: [
                        Input(
                          name: email,
                          placeholder: 'please enter your email',
                          icon: 'assets/svgs/email-svgrepo-com.svg',
                          label: 'email',
                          textInputType: TextInputType.emailAddress,
                          onChange: (value) {
                            debugPrint('login email value $value');
                          },
                          onValidate: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: 'you should enter your email',
                              ),
                              FormBuilderValidators.email(
                                errorText: 'you should enter valid email',
                              ),
                            ],
                          ),
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
                            debugPrint('login password value ');
                          },
                          onValidate: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: 'you should enter your password',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Button(
                          title: 'Login',
                          onPress: () {
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                              var user = _formKey.currentState!.value;

                              myCubit.signInUser(
                                email: user[email],
                                password: user[password],
                              );
                            } else {
                              print("validation failed");
                            }
                          },
                        ),
                      ],
                    ),
                  );
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
                      fontColor: ColorManager.kPrimaryColor,
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
