import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final Function()? onTap;
  final String nameButton;

  const CustomButton({super.key, required this.onTap, required this.nameButton});

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: colorTheme.primary,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                nameButton,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )),
      ),
    );
  }
}
