import 'package:flutter/material.dart';

Widget buildTextFieldText(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 50,
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.teal),
      hintStyle: TextStyle(fontFamily: 'Cario', color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.tealAccent, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.text,
  );
}

Widget buildTextFieldTextUserProblem(
    TextEditingController controller, String label, String hint,
    {int maxLines = 3}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 50,
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.teal),
      hintStyle: TextStyle(fontFamily: 'Cario', color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.tealAccent, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.text,
  );
}

Widget buildTextFieldTextUserRating(
    TextEditingController controller, String label, String hint,
    {int maxLines = 5}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 50,
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.teal),
      hintStyle: TextStyle(fontFamily: 'Cario', color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.tealAccent, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.text,
  );
}

Widget buildTextFieldLocation(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 10,
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.teal),
      hintStyle: TextStyle(fontFamily: 'Cario', color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.tealAccent, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.text,
  );
}

Widget buildTextFieldNum(
    TextEditingController controller, String label, String hint,
    {int maxLines = 1}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 10,
    style: const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.teal),
      hintStyle: TextStyle(fontFamily: 'Cario', color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.tealAccent, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 2.0),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}
