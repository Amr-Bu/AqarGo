import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';

class TextButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const TextButtonComponent({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(

      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),
      ),
    );
  }
}
