import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final bool? readOnly;

  const TextFieldWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.inputDecoration,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
    this.onTapOutside,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: prefix,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            decoration: inputDecoration,
            style: textStyle,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType ?? TextInputType.text,
            onTap: onTap,
            onTapOutside: onTapOutside,
            readOnly: readOnly ?? false,
          ),
        ),
        Container(
          child: suffix,
        )
      ],
    );
  }
}
