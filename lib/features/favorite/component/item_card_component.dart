import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/favorite/controller/favorite_cubit.dart';
import 'package:manzel/features/favorite/models/favorites_model.dart';
import 'package:manzel/features/property_details/property_details.dart';

class ItemCardComponent extends StatelessWidget {
   ItemCardComponent({super.key,required this.favoritesModel});
Favorites favoritesModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
  builder: (context, state) {
    var cubit =FavoriteCubit.get(context);
    return InkWell(
      onTap: (){
        navigatTo(context: context, page: PropertyDetailPage(id: favoritesModel.pivot!.officePropertyId!,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: screenWidth(context)*0.8,
          height: screenHeight(context)*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                   favoritesModel.property!.images!.isEmpty?
                    Container(
                      height: screenHeight(context) * 0.25,
                      width: screenWidth(context) * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]
                      ),
                      child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                    ):
                    Container(
                      height: screenHeight(context) * 0.25,
                      width: screenWidth(context) * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage("${ApiConstance.urlImage("${favoritesModel.property!.images![0].imagePath}")}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: InkWell(
                        onTap: () {
                          cubit.removeFromFavorite(propertyId: favoritesModel.id!);
                        },
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
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor2
                        ),
                        padding: EdgeInsets.symmetric(vertical: screenHeight(context)*0.02,horizontal: screenWidth(context)*0.02),
                        child: Text("${favoritesModel.property?.propertyType}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: whitColor),),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth(context)*0.02,),

                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${favoritesModel.property?.title}",style: Theme.of(context).textTheme.titleSmall,maxLines: 1,overflow: TextOverflow.ellipsis,),
                        SizedBox(height: screenHeight(context)*0.01,),
                        Text("${favoritesModel.property?.descriptionProperty}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 4,overflow: TextOverflow.ellipsis,),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,color: mainColor2,size: 15,),
                            SizedBox(width: screenWidth(context)*0.01,),
                            Text("${favoritesModel.property?.region?.state?.stateName},${favoritesModel.property?.region?.regionName}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor2),maxLines: 1,overflow: TextOverflow.ellipsis,)
                          ],
                        ),

                        Row(
                          children: [
                            Text('\$ ${favoritesModel.property?.price}',style: Theme.of(context).textTheme.bodyLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            favoritesModel.property?.contractType == "rent" ?
                            Text('/month',style: Theme.of(context).textTheme.bodyMedium,maxLines: 1,overflow: TextOverflow.ellipsis,)
                            :
                          SizedBox(),
                          ],
                        ),

                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
