
import 'package:flutter/material.dart';

Widget Sections(String title, VoidCallback onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      IconButton(icon:  Icon(Icons.arrow_forward), onPressed: onTap),
    ],
  );
}

