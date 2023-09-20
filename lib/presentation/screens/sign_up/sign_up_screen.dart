import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_car/presentation/widgets/custom_button.dart';
import 'package:shared_car/presentation/widgets/custom_text_field.dart';

const List<String> list = <String>['Conductor', 'Pasajero'];

class SignUpScreen extends StatefulWidget {
  static const String name = 'sign_up_screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _rutController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _selectedController = TextEditingController();


  Future signUp() async {
    // final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
    // print(data.user!.uid);
    // await FirebaseFirestore.instance.collection('users').doc(data.user!.uid).set(
    //     {
    //       'id': data.user!.uid,
    //       'name': _firstNameController.text.trim(),
    //       'lastName': _lastNameController.text.trim(),
    //       'address': _addressController.text.trim(),
    //       'rut': _rutController.text.trim(),
    //       'profile': _selectedController.text.trim()
    //     });
    context.go('/driverScreen');
  }

  @override
  void dispose() {
    _rutController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _selectedController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    String dropdownValue = list.first;

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
                    'Quieres unirte?!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(hintText: "Rut", controller: _rutController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Nombre", controller: _firstNameController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Apellido", controller: _lastNameController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Direccion", controller: _addressController,),
                  const SizedBox(
                    height: 10,
                  ),

                  //   Email Textfield
                  CustomTextField(hintText: "Email", controller: _emailController,),
                  const SizedBox(
                    height: 10,
                  ),

                  //   Password Textfield

                  CustomTextField(hintText: "Password", controller: _passwordController, obscureText: true,),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextField(hintText: "Confirmar Password", controller: _confirmPasswordController, obscureText: true,),
                  const SizedBox(
                    height: 10,
                  ),

              DropdownMenu<String>(
                initialSelection: list.first,
                controller: _selectedController,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
                  const SizedBox(
                    height: 10,
                  ),

                  //   Sign in Button

                  CustomButton(onTap: signUp, nameButton: 'Registrate'),

                  const SizedBox(
                    height: 25,
                  ),

                  //   Register Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ya estas registrado?',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () => context.go('/sign_in'),
                        child: const Text(
                          ' Logueate aqui',
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
