import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;

  const CustomTextField({super.key, this.controller, required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorTheme.primary),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            fillColor: Colors.grey[200],
            filled: true,
          ),
        )
    );
  }
}
