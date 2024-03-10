import 'package:flutter/material.dart';

Widget buildTextFieldRegisterAssets(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100.0),
    child: TextField(
      cursorColor: const Color(0xFF0F92EF),
      controller: controller,
      maxLines: maxLines1,
      style: const TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Color(0xFF0F92EF)),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Cario',
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Color(0xFF0F92EF),
            width: 4.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF0F92EF), width: 2.0),
        ),
      ),
    ),
  );
}

Widget buildTextField(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    cursorColor: const Color(0xFF0F92EF),
    controller: controller,
    maxLines: maxLines1,
    style: const TextStyle(color: Colors.blue),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Color(0xFF0F92EF)),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF0F92EF),
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF0F92EF), width: 2.0),
      ),
    ),
  );
}

Widget buildTextFieldNum(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return TextField(
    style: const TextStyle(color: Colors.blue, fontFamily: 'Cario'),
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
          color: Color(0xFF0F92EF),
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF0F92EF), width: 2.0),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

Widget buildTextFieldITReports(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 5}) {
  return TextField(
    style: const TextStyle(color: Colors.blue, fontFamily: 'Cario'),
    cursorColor: const Color(0xFF0F92EF),
    controller: controller,
    maxLines: maxLines1,
    maxLength: 100,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Color(0xFF0F92EF)),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF0F92EF),
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF0F92EF), width: 2.0),
      ),
    ),
    keyboardType: TextInputType.text,
  );
}

Widget buildTextFieldITReportslocation(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    style: const TextStyle(color: Colors.blue, fontFamily: 'Cario'),
    cursorColor: const Color(0xFF0F92EF),
    controller: controller,
    maxLines: maxLines1,
    maxLength: 30,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Color.fromRGBO(15, 146, 239, 1)),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF0F92EF),
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF0F92EF), width: 2.0),
      ),
    ),
    keyboardType: TextInputType.text,
  );
}
