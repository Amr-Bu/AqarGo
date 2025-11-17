import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/office_detiales/controller/office_detiales_cubit.dart';
import 'package:manzel/features/office_detiales/model/office_model.dart';
import 'package:manzel/features/property_details/property_details.dart';

import '../../../core/constant/app_localizations.dart';
import '../../../core/network/remote/apis_const.dart';

class OfficeItemCardComponent extends StatelessWidget {
  final OfficeProperty propertiesModel;
  const OfficeItemCardComponent({super.key, required this.propertiesModel});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PropertyDetailPage(id: propertiesModel.officePropertyId!),
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
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: double.infinity,
                        width: screenWidth(context) * 0.35,
                        child: Image.network(
                          propertiesModel.images.isNotEmpty
                              ? ApiConstance.urlImage(
                              "${propertiesModel.images.first.imagePath}")
                              : '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[300],
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey[200],
                              alignment: Alignment.center,
                              child:
                              const CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                        ),
                      ),
                    ),
                    // أيقونة القلب
                    Positioned(
                      top: 5,
                      left: 5,
                      child: BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                        builder: (context, state) {
                          final cubit = OfficeDetialesCubit.get(context);
                          final isFavorite = cubit.officeModel!.properties
                              .firstWhere((p) =>
                          p.officePropertyId == propertiesModel.officePropertyId)
                              .isFavorite;

                          return InkWell(
                            onTap: () {
                              if (propertiesModel.isFavorite == false) {
                                cubit.addToFavorite(
                                    propertyId: propertiesModel.officePropertyId!);
                              } else {
                                cubit.removeFromFavorite(
                                    propertyId: propertiesModel.officePropertyId!);
                              }
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: cardColor,
                              child: Icon(
                                propertiesModel.isFavorite == true
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
                    // نوع العقار
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor2,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          "${propertiesModel.propertyType}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: whitColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth(context) * 0.02),
                // بيانات العقار
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${propertiesModel.title}",
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: screenHeight(context) * 0.02),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: mainColor2, size: 15),
                          SizedBox(width: screenWidth(context) * 0.01),
                          Expanded(
                            child: Text(
                              "${propertiesModel.region?.state?.stateName},${propertiesModel.region?.regionName ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: mainColor2),
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
                            vertical: 5, horizontal: 10),
                        child: Text(
                          "${localizer.translate("${propertiesModel.contractType}")}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: whitColor),
                        ),
                      ),
                      SizedBox(height: screenHeight(context) * 0.02),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '\$ ${propertiesModel.price}',
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (propertiesModel.contractType == "rent")
                            const SizedBox(width: 4),
                          if (propertiesModel.contractType == "rent")
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
