import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';

class TextFromFildeComponent extends StatelessWidget {
  final int maxLines;
  final String hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function()? suffixAction;
  final String? Function(String?)? validator;
  final  bool obscureText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
   TextFromFildeComponent({super.key, required this.hintText, this.suffixIcon, this.prefixIcon, this.suffixAction, required this.controller, this.validator, this.keyboardType,  this.obscureText = false,this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: TextFormField(
          controller:controller ,
          cursorColor: foucosColor,
          validator: validator,
          maxLines: maxLines,
          obscureText:obscureText,
          keyboardType:keyboardType ,
          style: TextStyle(color: blackColor),
          decoration: InputDecoration(

            fillColor: blackColor,
            focusColor: foucosColor,
            suffixIcon:suffixIcon !=null?IconButton(icon: Icon(suffixIcon),onPressed: suffixAction,):null,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: InputBorder.none,
            prefixIcon: prefixIcon!=null? Icon(prefixIcon):null,
          ),
        ),
      ),
    );
  }
}
