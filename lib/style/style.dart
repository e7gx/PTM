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
    maxLength: 10,
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

Widget buildTextFieldITReports(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 5}) {
  return TextField(
    cursorColor: const Color.fromARGB(255, 15, 146, 239),
    controller: controller,
    maxLines: maxLines1,
    maxLength: 100,
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
    keyboardType: TextInputType.text,
  );
}

Widget buildTextFieldITReportslocation(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    cursorColor: const Color.fromARGB(255, 15, 146, 239),
    controller: controller,
    maxLines: maxLines1,
    maxLength: 30,
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
    keyboardType: TextInputType.text,
  );
}
