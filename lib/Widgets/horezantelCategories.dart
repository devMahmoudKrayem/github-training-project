

import 'package:flutter/material.dart';

Widget HorezantelCategories(String imagePath) {
  return Container(
    width: 75,
    margin:  EdgeInsets.only(right: 15),
    padding:  EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.grey.withOpacity(0.15),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 8,
          offset:  Offset(0, 4),
        ),
      ],
    ),
    child: Image.asset(
      imagePath,
      fit: BoxFit.contain,
    ),
  );
}