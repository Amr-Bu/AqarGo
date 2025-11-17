import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/office_detiales/office_detiales.dart';

class SeeMoreOfficeItem extends StatelessWidget {
  Office office;
   SeeMoreOfficeItem({super.key,required this.office});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        navigatTo(context: context, page: OfficeDetiales(id: office.id!,));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: screenHeight(context) * 0.25,
                  width: screenWidth(context) * 0.45,
                  child: Image.network(
                    ApiConstance.urlImage(office.image)  ,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                  ),
                ),
              ),
              Text("${office.officeName}",style: Theme.of(context).textTheme.titleSmall,maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text("${office.description}",style: Theme.of(context).textTheme.bodySmall,maxLines: 2,overflow: TextOverflow.ellipsis,),


              // Row(
              //   children: [
              //     Icon(Icons.star,color: Colors.amber,size: 15,),
              //     SizedBox(width: screenWidth(context)*0.01,),
              //     Text("4.5",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //     SizedBox(width: 10,),
              //     Icon(Icons.location_on_outlined,color: mainColor2,size: 15,),
              //     SizedBox(width: screenWidth(context)*0.01,),
              //     Expanded(child: Text("Damascus",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 1,overflow: TextOverflow.ellipsis,))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
