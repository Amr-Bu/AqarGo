import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/property_details/property_details.dart';
import 'package:manzel/core/network/remote/apis_const.dart';

class AdvertisementsComponent extends StatelessWidget {
Advert advert;
   AdvertisementsComponent({super.key,required this.advert});

  @override
  Widget build(BuildContext context) {
    return          InkWell(
      onTap: (){navigatTo(context: context, page: PropertyDetailPage(id:advert.officePropertyId! ));},
      child: Container(
        height: screenHeight(context)*0.25,width: screenWidth(context)*0.66,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20),bottomRight: Radius.circular(20) ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child:Image.network("${advert.images.isNotEmpty ? ApiConstance.urlImage(advert.images[0] ): ''}",fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
            );
          },
        ),

            ),
            Positioned.fill(child: Container(
              color: Colors.black54,
            )),
            Positioned(
                width: screenWidth(context)*0.35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${advert.title}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: whitColor),maxLines: 2,overflow:TextOverflow.ellipsis ,),
                      SizedBox(height:screenHeight(context)*0.01 ,),
                      Text("${advert.description}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: whitColor),maxLines: 2,overflow:TextOverflow.ellipsis )

                    ],
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: screenWidth(context)*0.2,
                height: screenHeight(context)*0.06,
                decoration: BoxDecoration(
                  color: mainColor2,
                  borderRadius: BorderRadius.only(topRight:Radius.circular(20)),
                ),
                child: Icon(Icons.arrow_forward,color: Colors.white,size: 20,),
              ),
            )
          ],
        ),
      ),
    )
    ;
  }
}
