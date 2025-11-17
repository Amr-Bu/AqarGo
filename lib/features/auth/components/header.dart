import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart' ;

class Header extends StatelessWidget {
  final String? headerText;
  final void Function()? iconOnTap;
  final void Function()? textOnTap;
  const Header({super.key, this.headerText, this.iconOnTap, this.textOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: iconOnTap,
          child: CircleAvatar(
            backgroundColor: cardColor,
            child:Icon(Icons.arrow_back_ios_new,size: 15,),
          ),
        ),
        Spacer(),
        if(headerText!=null)
        InkWell(
          onTap: textOnTap,
          child:Container(
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(20),
              color: cardColor,

            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth(context)*0.05,vertical:screenHeight(context)*0.02 ),
              child: Text(headerText!,style: Theme.of(context).textTheme.bodySmall,),
            ),
          ),
        ),
      ],
    );
  }
}
