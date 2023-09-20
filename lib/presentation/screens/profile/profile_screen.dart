import 'package:flutter/material.dart';
import 'package:shared_car/presentation/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {

  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Elije tu perfil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
        ),
        const SizedBox(
          height: 50,
        ),
        CustomButton(onTap: () => {}, nameButton: 'Pasajero',),
        const SizedBox(
          height: 10,
        ),
        CustomButton(onTap: () => {}, nameButton: 'Conductor',),
        const SizedBox(
          height: 10,
        ),
        CustomButton(onTap: () => {}, nameButton: 'Siguiente ',),

      ],
    );
  }
}
