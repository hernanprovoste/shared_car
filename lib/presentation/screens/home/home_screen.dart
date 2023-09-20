import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_car/presentation/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('SignIn ${user.email}' ),
          // FilledButton(onPressed: () {
          //   FirebaseAuth.instance.signOut();
          // }, child: const Text('Logout!'))
          UserMainPageScreen(),
        ],
      )),
    );
  }
}
