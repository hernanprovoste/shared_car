import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_car/presentation/screens/screens.dart';

class MainScreen extends StatelessWidget {
  static const String name = 'main_screen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const SignInScreen();
        }
      },),
    );
  }
}
