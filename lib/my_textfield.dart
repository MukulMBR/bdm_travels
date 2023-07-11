import 'package:flutter/material.dart';

Widget customTextField({
  required String labelText,
  required String hintText,
  required IconData prefixIcon,
  bool obscureText = false,
  TextEditingController? controller,
}) {
  return Material(
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black87.withOpacity(0.7)),
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey.withOpacity(0.6),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
