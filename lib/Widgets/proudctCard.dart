import 'package:flutter/material.dart';

Widget ProudctCard(String image, String name, String price, Color color) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: Icon(Icons.favorite, color: color, size: 20),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
