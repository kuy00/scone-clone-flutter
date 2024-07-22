import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback? onPressed;
  final Size? size;
  final BorderRadius? borderRadius;
  final double? fontSize;

  const ButtonWidget(
      {super.key,
      required this.text,
      this.onPressed,
      this.size,
      this.borderRadius,
      this.fontSize,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            disabled ? const Color(0xFF8CB8FF) : const Color(0xFF1773FC)),
        minimumSize: MaterialStatePropertyAll(size ?? const Size(100, 45)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(14),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: disabled ? const Color(0xFFACCDFF) : Colors.white,
          fontSize: fontSize ?? 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
