import 'package:flutter/material.dart';

class DateRangeBadgeWidget extends StatelessWidget {
  final String title;
  const DateRangeBadgeWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD7D7D7), width: 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
