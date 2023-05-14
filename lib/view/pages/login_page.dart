import 'package:chat_app/constantces.dart';
import 'package:chat_app/view/widget/custom_widgets.dart';
import 'package:chat_app/view/pages/regestration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../controller/cubits/login_cubit/login_cubit.dart';
import 'chat_page.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  static const id = 'loginPage';
  String? email, password;

  final _formKey = GlobalKey<FormState>();

  bool isLoding = false;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoding = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          messageFromSnackBar(context, message: state.successMessage);
          isLoding = false;
        } else if (state is LoginFailure) {
          messageFromSnackBar(context, message: state.failureMessage);
          isLoding = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoding,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ListView(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 64,
                          ),
                          Image.asset(kLogo),
                          const Text(
                            'Scolar Chat',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CostumTextFormField(
                            'Email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                            onChange: (email) {
                              this.email = email;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CostumTextFormField(
                            'Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            onChange: (password) {
                              this.password = password;
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CostumButton(
                            'Sign In',
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).loginUser(
                                    email: email!, password: password!);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'don\'t have an account ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegestrationPage.id);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Color(0xffC7EDE6)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
