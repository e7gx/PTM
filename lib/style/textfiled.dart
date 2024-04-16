import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 16,
        shadowColor: Colors.teal,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          cursorColor: Colors.teal,
          style: const TextStyle(color: Colors.teal),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontFamily: 'Cario',
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
            prefixIcon: Icon(prefixIcon, color: Colors.teal),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.teal),
              borderRadius: BorderRadius.circular(80.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.tealAccent),
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
