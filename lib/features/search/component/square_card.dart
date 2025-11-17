import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/features/property_details/property_details.dart';
import 'package:manzel/features/search/models/search_model.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/network/remote/apis_const.dart';

class SquareCard extends StatelessWidget {
   SquareCard({super.key ,required this.propertiy,required this.officePropertyId});
  Property propertiy;
  int officePropertyId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigatTo(context: context, page: PropertyDetailPage(id:officePropertyId,));
      },
      child: Container(
        width: screenWidth(context)*0.45,
        height: screenHeight(context)*0.30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Stack(
                children: [
                 propertiy.images.isEmpty
                      ? Container(
                    height: screenHeight(context) * 0.25,
                    width: screenWidth(context) * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  )
                      : Container(
                    height: screenHeight(context) * 0.25,
                    width: screenWidth(context) * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          "${ApiConstance.basUrlImage}${propertiy.images[0]}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: cardColor,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: mainColor1,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      height: screenHeight(context)*0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor2
                      ),
                      padding: EdgeInsets.symmetric(vertical: screenHeight(context)*0.01,horizontal: screenWidth(context)*0.01),
                      child: Text("${propertiy.propertyType}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: whitColor),),
                    ),
                  ),
                ],
              ),
              Text("${propertiy.title}",style: Theme.of(context).textTheme.bodyMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,color: mainColor2,size: 15,),
                  SizedBox(width: screenWidth(context)*0.01,),
                  Expanded(child: Text("${propertiy.stateName},${propertiy.regionName}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 1,overflow: TextOverflow.ellipsis,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
