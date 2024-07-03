import 'package:flutter/material.dart';

class DateRangeBadgeWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const DateRangeBadgeWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
