import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_car/domain/global.dart';
import 'package:shared_car/domain/helper/assistant_method.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() {
    Timer(Duration(seconds: 3), () async {
      if (await firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null ? AssistantMethod.readCurrentOnlineUserInfo() : null;
        context.push('/main');
      } else {
        context.push('/sign_in');
      }
    });
  }

  @override
  void initState () {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('RideLinker', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
