import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? obscurePassword : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF8F8F8),
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: widget.isPassword
                ? IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xffEFEFEF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Color(0xffF4B844),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}