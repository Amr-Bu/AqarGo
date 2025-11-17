import 'package:flutter/material.dart';
import 'package:manzel/core/component/text_buttom.dart';

class Footer extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function() onTap;
  const Footer({super.key,required this.text,required this.textButton,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(text ,style: Theme.of(context).textTheme.bodySmall,),
        TextButtonComponent(onPressed: onTap, text: textButton,),

      ],
    );
  }
}
