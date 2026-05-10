
import 'package:flutter/material.dart';

class SingUpField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  SingUpField({required this.hint,required this.controller,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide:BorderSide(
            color: Color(0xffF4B844),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(
            color: Color(0xffF4B844),
            width: 2,
          ),
        ),
      ),
    );
  }
}