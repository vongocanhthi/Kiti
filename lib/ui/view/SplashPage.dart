import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Images.dart';
import 'LoginPage.dart';
import 'home/HomePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image.asset(
          Images.LOGO_KITI,
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  void startTimer() {
    // if (kDebugMode) {
    //   Get.to(const HomePage());
    // }
    Future.delayed(const Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.to(const HomePage());
      } else {
        Get.to(const LoginPage());
      }
    });
  }
}
