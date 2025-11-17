import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/office_detiales/controller/office_detiales_cubit.dart';
import 'package:manzel/features/office_detiales/model/office_model.dart';
import 'package:manzel/features/office_detiales/model/office_properties_model.dart';
import 'package:manzel/features/property_details/property_details.dart';

class SeeMoreItemForOffice extends StatelessWidget {
  OfficeProperty property;
  SeeMoreItemForOffice({super.key,required this.property});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        navigatTo(context: context, page: PropertyDetailPage(id: property.officePropertyId!,));
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: screenHeight(context) * 0.25,
                      width: screenWidth(context) * 0.45,
                      child: Image.network(
                        property.images.isNotEmpty
                            ? ApiConstance.urlImage(
                            "${property.images.first.imagePath}")
                            : '',
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
                  Positioned(
                    top: 5,
                    left: 5,
                    child: BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                      builder: (context, state) {
                        final cubit = OfficeDetialesCubit.get(context);
                        final isFavorite = cubit.officeModel!.properties
                            .firstWhere((p) =>
                        p.officePropertyId == property.officePropertyId)
                            .isFavorite;

                        return InkWell(
                          onTap: () {
                            if (property.isFavorite == false) {
                              cubit.addToFavorite(
                                  propertyId: property.officePropertyId!);
                            } else {
                              cubit.removeFromFavorite(
                                  propertyId: property.officePropertyId!);
                            }
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: cardColor,
                            child: Icon(
                              property.isFavorite == true
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: mainColor1,
                              size: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      // height: screenHeight(context)*0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor2
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      child: Text("${property.propertyType}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: whitColor),),
                    ),
                  ),
                ],
              ),
              Text("${property.title}",style: Theme.of(context).textTheme.titleSmall,maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: screenHeight(context)*0.01),
              Row(
                children: [
                  // Icon(Icons.star,color: Colors.amber,size: 15,),
                  // SizedBox(width: screenWidth(context)*0.01,),
                  // Text("4.5",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  // SizedBox(width: 10,),
                  Icon(Icons.location_on_outlined,color: mainColor2,size: 15,),
                  SizedBox(width: screenWidth(context)*0.01,),
                  Expanded(child: Text("${property.region?.state?.stateName},${property.region?.regionName ?? ""}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 1,overflow: TextOverflow.ellipsis,))
                ],
              ),
              SizedBox(height: screenHeight(context)*0.01,),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '\$ ${property.price}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if(property.contractType=="rent")
                    const SizedBox(width: 4),
                  if(property.contractType=="rent")
                    Text(
                      '/month',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
