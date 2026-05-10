import 'package:flutter/material.dart';

class LoginField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  LoginField({
    required this.controller,
    required this.hint,
    this.isPassword = false,
  });

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  late bool hiddenPassword;

  @override
  void initState() {
    super.initState();
    hiddenPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: hiddenPassword,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 15,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              hiddenPassword = !hiddenPassword;
            });
            },
          icon: Icon(
            hiddenPassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
          ),) : null,
        contentPadding:EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Color(0xffFFC554), width: 1.5),
        ),
      ),
    );
  }
}

