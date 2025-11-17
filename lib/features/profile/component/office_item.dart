import 'package:flutter/material.dart';
import 'package:manzel/features/office_detiales/model/office_model.dart';
import 'package:manzel/features/profile/models/profile_model.dart';
import '../../../core/component/navigator.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/network/remote/apis_const.dart';
import '../../office_detiales/office_detiales.dart';

class OfficeItem extends StatelessWidget {
   OfficeItem({super.key,required this.followedOffices});
  FollowedOffices followedOffices;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigatTo(context: context, page: OfficeDetiales(id: followedOffices.id!,));

        //navigatTo(context: context, page: OfficeDetiales(id: followedOffices.id!,name: followedOffices.OfficeName??"",email: followedOffices.email??"",phone:"0986"??"",imagePath: followedOffices.image??"", description: followedOffices.description??"",));
      },
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(30),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              followedOffices.image == null?
              CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 23,
                  child: Icon(Icons.broken_image, size: 40, color: Colors.grey)
              ):
              CircleAvatar(
                radius: 23,
                backgroundImage: NetworkImage('${ApiConstance.basUrlImage}${followedOffices.image}'),
              ),
              SizedBox(width: screenWidth(context)*0.01,),
              Text("${followedOffices.OfficeName}",style: Theme.of(context).textTheme.bodySmall,)

            ],
          ),
        ),
      ),
    )
    ;
  }
}
