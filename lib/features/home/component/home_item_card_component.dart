import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/home/controller/home_cubit.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/property_details/property_details.dart';

import '../../../core/constant/app_localizations.dart';

class HomeItemCardComponent extends StatelessWidget {
  final AlProperty property;

  const HomeItemCardComponent({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => PropertyDetailPage(id: property.officePropertyId!),
          ),
        );
      },
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          width: screenWidth(context) * 0.8,
          height: screenHeight(context) * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    // صورة العقار
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: double.infinity,
                        width: screenWidth(context) * 0.35,
                        child: Image.network(
                          property.images.isNotEmpty
                              ? ApiConstance.urlImage(property.images.first)
                              : '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image,
                                size: 40,
                                color: Colors.grey,
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey[200],
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        HomeCubit cubit = HomeCubit.get(context);
                        return Positioned(
                          top: 5,
                          left: 5,
                          child: InkWell(
                            onTap: () {
                              if (property.isFavorite == true) {
                                cubit.removeFromFavorite(
                                  propertyId: property.officePropertyId!,
                                );
                              } else {
                                cubit.addToFavorite(
                                  propertyId: property.officePropertyId!,
                                );
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
                          ),
                        );
                      },
                    ),

                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor2,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          "${property.propertyType}",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: whitColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth(context) * 0.02),


                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // العنوان
                      Text(
                        "${property.title}",
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: screenHeight(context) * 0.02),

                      // الموقع
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: mainColor2,
                            size: 15,
                          ),
                          SizedBox(width: screenWidth(context) * 0.01),
                          Expanded(
                            child: Text(
                              "${property.stateName},${property.regionName ?? ""}",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: mainColor2),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor2,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          "${localizer.translate("${property.contractType}")}",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: whitColor),
                        ),
                      ),
                      SizedBox(height: screenHeight(context) * 0.02),

                      // السعر
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '\$ ${property.price}',
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (property.contractType == "rent")
                            const SizedBox(width: 4),
                          if (property.contractType == "rent")
                            Text(
                              '/${localizer.translate("per month")}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
