import 'dart:developer';

import 'package:c_commerce_bloc_api_call/src/route/route.gr.dart';
import 'package:c_commerce_bloc_api_call/src/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthBloc authBloc = AuthBloc();
  bool isLoading = false;
  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthLoadingState) {
            isLoading = true;
          } else if (state is AuthSuccessState) {
            log("test ${state.message}");
            isLoading = false;
            context.router.replace(const HomeRoute());
          } else if (state is AuthErrorState) {
            isLoading = false;
            AppUtils.showErrorSnackBar("Some error found!");
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: "Username",
                    labelText: "Username",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: "Password",
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (usernameController.text.isEmpty) {
                            AppUtils.showErrorSnackBar("Username is required!");
                          } else if (passwordController.text.isEmpty) {
                            AppUtils.showErrorSnackBar("Password is required!");
                          } else {
                            authBloc.add(LoginButtonClickEvent(
                                username: usernameController.text,
                                password: passwordController.text));
                          }
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
