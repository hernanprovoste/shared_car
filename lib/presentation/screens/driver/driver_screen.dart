import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_car/presentation/widgets/custom_button.dart';
import 'package:shared_car/presentation/widgets/custom_text_field.dart';

class DriverScreen extends StatefulWidget {
  static const String name = 'driver_screen';

  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {

  final _driverLicenceController = TextEditingController();
  final _carPlateController = TextEditingController();
  final _carBrandController = TextEditingController();
  final _carModelController = TextEditingController();
  final _carYearController = TextEditingController();


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
    context.go('/map');
  }

  @override
  void dispose() {
    _driverLicenceController.dispose();
    _carBrandController.dispose();
    _carModelController.dispose();
    _carPlateController.dispose();
    _carYearController.dispose();
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
                    'Conductor!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Como conductor necesitamos que subas una foto de tu licencia de conducir.',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15,),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(hintText: "Licencia de Conducir", controller: _driverLicenceController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Patente del vehiculo", controller: _carPlateController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Marca", controller: _carBrandController,),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hintText: "Modelo", controller: _carModelController,),
                  const SizedBox(
                    height: 10,
                  ),

                  //   Email Textfield
                  CustomTextField(hintText: "Año", controller: _carYearController,),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomButton(onTap: signUp, nameButton: 'Registrate'),

                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}
