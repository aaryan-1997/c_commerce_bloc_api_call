import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:c_commerce_bloc_api_call/src/route/route.gr.dart';
import 'package:c_commerce_bloc_api_call/src/util/local_database.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      if (LocalDatabase().isLoggedIn() == true) {
        context.router.replace(const HomeRoute());
      } else {
        context.router.replace(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
