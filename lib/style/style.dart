import 'package:flutter/material.dart';

Widget buildTextField(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    cursorColor: const Color.fromARGB(255, 15, 146, 239),
    controller: controller,
    maxLines: maxLines1,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 15, 146, 239)),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 15, 146, 239),
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 15, 146, 239), width: 2.0),
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
      labelStyle: const TextStyle(color: Color.fromARGB(255, 15, 146, 239)),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 15, 146, 239),
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 15, 146, 239), width: 2.0),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

// Widget buildDropTextField(
//     TextEditingController controller, String label, String hint,
//     {int maxLines1 = 1}) {
//   return Scaffold(
//       body: DropdownButton(
//     items: DropdownButtonItem[],
//   ));
// }
