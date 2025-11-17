import 'package:flutter/material.dart';

void navigatTo ({required BuildContext context ,required Widget page}){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>page));
}

void navigatPop ({required BuildContext context }){
  Navigator.pop(context);
}

