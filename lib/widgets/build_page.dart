import 'package:flutter/material.dart';

Widget buildPage({
  required Color color,
  required String image,
  required String title,
  required String subtitle,
  required String page,
}) {
  return Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(page),
        const SizedBox(
          height: 24,
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 300,
          width: 300,
        ),
        const SizedBox(height: 32),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
