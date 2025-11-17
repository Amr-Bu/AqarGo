import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/profile/component/alert-to-delete.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';
import 'package:manzel/features/profile/models/profile_model.dart';
import 'package:manzel/features/property_details/property_details.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/screen_size.dart';

class MyPropertyItem extends StatelessWidget {
  MyPropertyItem({super.key, required this.properties});
  Properties properties;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatTo(context: context, page: PropertyDetailPage(id: 0));
      },
      child: Container(
        width: screenWidth(context) * 0.45,
        height: screenHeight(context) * 0.30,
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
                  properties.images.isEmpty
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
                              "${ApiConstance.basUrlImage}${properties.images[0].imagePath}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      var cubit =ProfileCubit.get(context);
                      return Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          onTap: () {
                            AlertToDelete.show(
                              context: context,
                              onConfirm: () {
                                cubit.deleteProperty(properties.id);
                              },
                            );
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: cardColor,
                            child: Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      height: screenHeight(context) * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor2,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight(context) * 0.01,
                        horizontal: screenWidth(context) * 0.01,
                      ),
                      child: Text(
                        "${properties.propertyType}",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: whitColor),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${properties.descriptionProperty}",
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: mainColor2, size: 15),
                  SizedBox(width: screenWidth(context) * 0.01),
                  Expanded(
                    child: Text(
                      "${properties.region.state.stateName},${properties.region.regionName}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: mainColor2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
