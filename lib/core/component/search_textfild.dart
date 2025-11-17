import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';

class SearchTextfild extends StatelessWidget {
  bool autofocus = false;
  bool enabled = true;
  String hintText ="Search";
  VoidCallback? onTap;
  VoidCallback? onEditingComplete;
  TextEditingController? searchController ;
   SearchTextfild({super.key,required this.autofocus,required this.enabled,required this.hintText,this.onTap,this.onEditingComplete,this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor
      ),

      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth(context)*0.01,vertical: screenHeight(context)*0.01),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          autofocus:autofocus ,
          controller: searchController,
          enabled: enabled,
          onTap:onTap ,
          onEditingComplete:onEditingComplete ,

        ),
      ),
    );
  }
}
