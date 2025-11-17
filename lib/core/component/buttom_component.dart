import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';

class ButtomComponent extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final VoidCallback onPressed;

  const ButtomComponent({
    super.key,
    this.color=mainColor1,
    required this.text,
    required this.onPressed, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        //shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding:  EdgeInsets.symmetric(horizontal: screenWidth(context)*0.1, vertical: screenHeight(context)*0.025),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(icon !=null)
          Icon(icon,color: whitColor,),
          if(icon !=null)
          SizedBox(width: screenWidth(context)*0.01,),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              color: Colors.white,
            ),
          ),


        ],
      ),
    );
  }
}
