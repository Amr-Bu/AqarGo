import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/areas/areas.dart';
import 'package:manzel/features/home/model/home_model.dart';

class LocationComponent extends StatelessWidget {
  StateJson state;
   LocationComponent({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final height = screenHeight(context);
    final avatarRadius = width * 0.07;

    return InkWell(
      onTap: (){
        navigatTo(context: context, page: Areas(stateId:state.id,));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: avatarRadius,
              child: Icon(Icons.location_on_outlined,color: mainColor2,size: 25,),
            ),
            SizedBox(width: width * 0.02),
            Text(
              "${state.stateName}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: width * 0.035),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
