import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_car/presentation/widgets/custom_button.dart';
import 'package:shared_car/presentation/widgets/custom_text_field.dart';

class UserMainPageScreen extends StatefulWidget {
  static const String name = 'user_main_page_screen';


  const UserMainPageScreen({super.key});

  @override
  State<UserMainPageScreen> createState() => _UserMainPageScreenState();
}

class _UserMainPageScreenState extends State<UserMainPageScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  final int _balance = 10000;
  final _toTravelController = TextEditingController();
  final _fromTravelController = TextEditingController();
  final _timeTableController = TextEditingController();
  final _peopleOnBoardController = TextEditingController();

  // Future nextToFind() async {
  //   // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  // }

  @override
  void dispose() {
    _toTravelController.dispose();
    _fromTravelController.dispose();
    _timeTableController.dispose();
    _peopleOnBoardController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //   Bienvenido nuevamente text
                  const Text(
                    'Tu saldo',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _balance.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(hintText: "A donde quieres ir?", controller: _toTravelController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "De donde quieres viajar", controller: _fromTravelController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Elige tu horario", controller: _timeTableController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Cuantas personas son", controller: _peopleOnBoardController,),
                  const SizedBox(
                    height: 30,
                  ),

                  CustomButton(onTap: () => context.go('/find_cars'), nameButton: 'BUSCAR A TU SHARECAR'),
                FilledButton(onPressed: () {
              FirebaseAuth.instance.signOut();
            }, child: const Text('Logout!'))
                ],
              ),
            ),
          ),
        ));
  }

}
