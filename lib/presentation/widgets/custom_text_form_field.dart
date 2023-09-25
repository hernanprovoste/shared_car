import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;

  const CustomTextFormField({super.key, this.controller, required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(50)],
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return '$hintText no puede esta vacio.';
            }
            if (text.length < 2) {
              return 'Por favor ingrese un $hintText valido';
            }
            if (text.length > 49) {
              return '$hintText no puede superar los 50 caracteres';
            }
          },
        )
    );
  }
}
