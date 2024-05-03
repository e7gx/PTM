import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTextFieldRegisterAssets(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100.0),
    child: TextField(
      cursorColor: const Color(0x7D8BFFF3),
      controller: controller,
      maxLines: maxLines1,
      style: const TextStyle(color: Colors.teal),
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.teal),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Cario',
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 4.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
        ),
      ),
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          // Allow newValue if it's empty or doesn't start with a space
          if (newValue.text.isEmpty || newValue.text[0] != ' ') {
            return newValue;
          }
          // Otherwise, return oldValue to prevent adding the space at the beginning
          return oldValue;
        }),
      ],
    ),
  );
}

Widget buildTextField(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    cursorColor: Colors.teal,
    controller: controller,
    maxLines: maxLines1,
    style: const TextStyle(
      color: Colors.teal,
      fontFamily: 'Cario',
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.teal),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
      ),
    ),
    inputFormatters: [
      TextInputFormatter.withFunction((oldValue, newValue) {
        // Allow newValue if it's empty or doesn't start with a space
        if (newValue.text.isEmpty || newValue.text[0] != ' ') {
          return newValue;
        }
        // Otherwise, return oldValue to prevent adding the space at the beginning
        return oldValue;
      }),
    ],
  );
}

Widget buildTextFieldNum(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return TextField(
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    controller: controller,
    maxLines: maxLines,
    maxLength: 10,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(
        color: Colors.teal,
        fontFamily: 'Cario',
      ),
      hintStyle: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Cario',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [
      TextInputFormatter.withFunction((oldValue, newValue) {
        // Allow newValue if it's empty or doesn't start with a space
        if (newValue.text.isEmpty || newValue.text[0] != ' ') {
          return newValue;
        }
        // Otherwise, return oldValue to prevent adding the space at the beginning
        return oldValue;
      }),
    ],
  );
}

Widget buildTextFieldITReports(
    TextEditingController controller, String label, String hint,
    {int maxLines = 3}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 100,
    style: const TextStyle(
      color: Colors.blue,
      fontFamily: 'Cario',
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.blue),
      hintStyle: TextStyle(fontFamily: 'Cario', color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 2.0,
        ),
      ),
    ),
    keyboardType: TextInputType.text,
    inputFormatters: [
      TextInputFormatter.withFunction((oldValue, newValue) {
        // Allow newValue if it's empty or doesn't start with a space
        if (newValue.text.isEmpty || newValue.text[0] != ' ') {
          return newValue;
        }
        // Otherwise, return oldValue to prevent adding the space at the beginning
        return oldValue;
      }),
    ],
  );
}

Widget buildTextFieldITReportslocation(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    cursorColor: Colors.teal,
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
          color: Colors.transparent,
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
      ),
    ),
    inputFormatters: [
      TextInputFormatter.withFunction((oldValue, newValue) {
        // Allow newValue if it's empty or doesn't start with a space
        if (newValue.text.isEmpty || newValue.text[0] != ' ') {
          return newValue;
        }
        // Otherwise, return oldValue to prevent adding the space at the beginning
        return oldValue;
      }),
    ],
    keyboardType: TextInputType.text,
  );
}
