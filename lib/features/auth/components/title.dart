import 'package:flutter/material.dart';
import 'package:manzel/core/constant/screen_size.dart';

class TitleComponent extends StatelessWidget {
  final String title1;
  final String title2;
  final String disc;
  const TitleComponent({super.key, required this.title1, required this.title2, required this.disc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title1,style: Theme.of(context).textTheme.titleMedium,),
            Text(title2,style: Theme.of(context).textTheme.titleLarge,),],

        ),
        SizedBox(height: screenHeight(context)*0.03,),
        Text(disc,style: Theme.of(context).textTheme.bodyMedium,),

      ],
    );
  }
}
