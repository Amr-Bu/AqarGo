import 'package:flutter/material.dart';
import 'package:manzel/core/component/text_buttom.dart';

class SectionComponent extends StatelessWidget {
  final String title;
  final String? textButtonTitle;
  final void Function()? onPressed;
  const SectionComponent({super.key, required this.title,  this.onPressed,  this.textButtonTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Theme.of(context).textTheme.titleSmall,),
        Spacer(),
        if(textButtonTitle!=null&&onPressed!=null)
        TextButtonComponent(text:textButtonTitle! ,onPressed:onPressed!
          ,),
      ],
    );
  }
}
