import 'package:chat_app/constantces.dart';
import 'package:chat_app/controller/cubits/regestration_cubit/regestration_cubit.dart';
import 'package:chat_app/view/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/view/widget/custom_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegestrationPage extends StatelessWidget {
  static const id = 'RegestrationPage';
  String? email, password;

  final _formKey = GlobalKey<FormState>();

  bool isLoding = false;

  RegestrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegestrationCubit, RegestrationState>(
      listener: (context, state) {
        if (state is RegestrationLoding) {
          isLoding = true;
        } else if (state is RegestrationSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          messageFromSnackBar(context, message: state.successMessage);
          isLoding = false;
        } else if (state is RegestrationFailure) {
          messageFromSnackBar(context, message: state.failureMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: false,
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
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CostumTextFormField(
                            'Email',
                            validator: (data) {
                              if (data == null || data.isEmpty) {
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
                            validator: (data) {
                              if (data == null || data.isEmpty) {
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
                            'Sign Up',
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<RegestrationCubit>(context)
                                    .registerWithEmailAndPassword(
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
                                'already have an account',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  ' Sign In',
                                  style: TextStyle(
                                    color: Color(0xffC7EDE6),
                                  ),
                                ),
                              ),
                            ],
                          )
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
