import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: screenWidth(context)*0.03,),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: mainColor1,width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_outlined,size: 20,),
            ),),
        ),
        SizedBox(width: screenWidth(context)*0.03,),

        InkWell(
            onTap: (){},
            child: Container(

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: mainColor1,width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person_outline,size: 20),
              ),),
          ),
        SizedBox(width: screenWidth(context)*0.03,),

      ],
    );
  }
}
