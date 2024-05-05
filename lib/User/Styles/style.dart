import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
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

Widget buildTextFieldTextUserProblem(
    TextEditingController controller, String label, String hint,
    {int maxLines = 3}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: 100,
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
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
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
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
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
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
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
