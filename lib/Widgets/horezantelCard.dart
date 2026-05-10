

import 'package:flutter/material.dart';


Widget HorezantelCard(String image, String title) {
  return Container(
    width: 280,
    margin:  EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black.withOpacity(0.3),
      ),
      padding:  EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style:  TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
