import 'package:flutter/material.dart';

Widget buildTextField(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    cursorColor: Colors.cyan,
    controller: controller,
    maxLines: maxLines1,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: TextStyle(color: Colors.cyan[400]),
      hintStyle: TextStyle(color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.cyan[400]!, width: 3.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.cyan[400]!, width: 2.0),
      ),
    ),
  );
}

Widget buildTextFieldNum(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: TextStyle(color: Colors.cyan[400]),
      hintStyle: TextStyle(color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.cyan[400]!, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.cyan[400]!, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}
