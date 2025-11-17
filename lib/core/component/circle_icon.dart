import 'package:flutter/material.dart';

import '../constant/color.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key ,this.iconOnTap,this.icon});
  final void Function()? iconOnTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconOnTap,
      child: CircleAvatar(
        radius: 23,
        backgroundColor: cardColor,
        child:Icon(icon,size:22,color: blackColor,),
      ),
    );
  }
}
