import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_car/domain/global.dart';
import 'package:shared_car/presentation/widgets/custom_button.dart';
import 'package:shared_car/presentation/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  static const String name = 'sign_in_screen';


  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    // var response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
    // print(response);
    await firebaseAuth.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim()).then((auth) async {
      currentUser = auth.user;

      await Fluttertoast.showToast(msg: "Login Correcto");
      context.go('/main');
    }).catchError((errorMessage) {
      Fluttertoast.showToast(msg: 'Ha ocurrido un error $errorMessage');
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    'Hola Nuevamente!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Te estabamos esperando!',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //   Email Textfield
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child: TextField(
                  //     controller: _emailController,
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(12)
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: colorTheme.primary),
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //       hintText: 'Email',
                  //       fillColor: Colors.grey[200],
                  //       filled: true,
                  //     ),
                  //   )
                  // ),
                  CustomTextField(hintText: "Email", controller: _emailController,),
                  const SizedBox(
                    height: 10,
                  ),

                  //   Password Textfield
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 25),
                  //     child: TextField(
                  //       controller: _passwordController,
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.white),
                  //             borderRadius: BorderRadius.circular(12)
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: colorTheme.primary),
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         hintText: 'Password',
                  //         fillColor: Colors.grey[200],
                  //         filled: true,
                  //       ),
                  //     )
                  // ),
                  CustomTextField(hintText: "Password", controller: _passwordController, obscureText: true,),
                  const SizedBox(
                    height: 10,
                  ),

                  //   Sign in Button
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child: GestureDetector(
                  //     onTap: signIn,
                  //     child: Container(
                  //         padding: const EdgeInsets.all(20),
                  //         decoration: BoxDecoration(
                  //             color: colorTheme.primary,
                  //             borderRadius: BorderRadius.circular(12)),
                  //         child: const Center(
                  //           child: Text(
                  //             'Login',
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 18),
                  //           ),
                  //         )),
                  //   ),
                  // ),
                  CustomButton(onTap: signIn, nameButton: 'Login'),

                  const SizedBox(
                    height: 25,
                  ),

                  //   Register Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Aun no te registras?',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () => context.go('/sign_up'),
                        child: const Text(
                          ' Hazlo aqui',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

}
