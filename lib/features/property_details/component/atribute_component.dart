import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';

class AtributeComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const AtributeComponent({super.key, required this.icon, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon,color: mainColor2,size: 25,),
              SizedBox(width: 5,),
              Text('${title}:',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainColor2),),
              SizedBox(width: 10,),
              Expanded(child: Text(text,style: Theme.of(context).textTheme.bodyMedium ,)),
            ],),
          Divider(),
        ],
      ),
    );
  }
}
