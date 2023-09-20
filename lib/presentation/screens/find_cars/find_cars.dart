import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_car/presentation/widgets/custom_button.dart';
import 'package:shared_car/presentation/widgets/custom_text_field.dart';

class FindCarsScreen extends StatefulWidget {
  static const String name = 'find_cars_screen';


  const FindCarsScreen({super.key});

  @override
  State<FindCarsScreen> createState() => _FindCarsScreenState();
}

class _FindCarsScreenState extends State<FindCarsScreen> {

  final int _balance = 10000;
  final _toTravelController = TextEditingController();
  final _fromTravelController = TextEditingController();
  final _timeTableController = TextEditingController();
  final _peopleOnBoardController = TextEditingController();

  Future findMap() async {
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  }

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
                    'Autos encontrados cerca de tu zona',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                 Card(
                   child: Column(
                     children: [
                       ListTile(
                         title: Text('Nombre: Johanna Zamorano'),
                         subtitle: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('Marca: Toyota Prius'),
                             Text('Patente: HH.HH-34'),
                             Text('Asientos disponibles: 3'),
                             Text('Valor: 350'),
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Nombre: Johanna Zamorano'),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marca: Toyota Prius'),
                              Text('Patente: HH.HH-34'),
                              Text('Asientos disponibles: 3'),
                              Text('Valor: 350')
                            ],
                          ),
                        ),
                        TextButton(onPressed: () { context.go('/map'); }, child: const Text('Buscar'))
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Nombre: Johanna Zamorano'),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Marca: Toyota Prius'),
                              Text('Patente: HH.HH-34'),
                              Text('Asientos disponibles: 3'),
                              Text('Valor: 350'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}
