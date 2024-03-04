import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String text;

  const BadgeWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey,
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 40),
      ),
    );
  }
}