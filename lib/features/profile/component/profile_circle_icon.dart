import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/features/profile/eidt-profile-screen.dart';
import '../../../core/constant/color.dart';

class ProfileCircleIcon extends StatelessWidget {
  const ProfileCircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigatTo(context: context, page: EditProfileScreen());
      },
      child: CircleAvatar(
        radius: 15,
        backgroundColor:blackColor,
        child:Icon(Icons.edit,size:17,color: whitColor,),
      ),
    );
  }
}
