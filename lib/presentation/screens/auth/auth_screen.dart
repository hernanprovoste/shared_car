import 'package:flutter/material.dart';
import 'package:shared_car/presentation/screens/screens.dart';

class AuthScreen extends StatefulWidget {
  static const String name = 'auth_screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const SignInScreen();
  }
}
