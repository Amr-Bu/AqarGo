import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/office_detiales/office_detiales.dart';

import '../../../core/constant/app_localizations.dart';

class OfficeItemComponent extends StatelessWidget {
  Office office;
   OfficeItemComponent({super.key,required this.office});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: InkWell(
        onTap: (){
          navigatTo(context: context, page: OfficeDetiales(id: office.id!,));
        },
        child: Container(
          width: screenWidth(context)*0.8,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: double.infinity,
                    width: screenWidth(context) * 0.35,
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
                SizedBox(width: screenWidth(context)*0.02,),

                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${office.officeName}",style: Theme.of(context).textTheme.titleSmall,maxLines: 2,overflow: TextOverflow.ellipsis,),
                        SizedBox(height: screenHeight(context)*0.02,),
                        Text("${office.description}",style: Theme.of(context).textTheme.bodySmall,maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Spacer(),
                        Row(
                          children: [
                            Text("${localizer.translate("followers")}:",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainColor1,fontWeight: FontWeight.bold),),
                            Text("${office.followersCount}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainColor1,fontWeight: FontWeight.bold)),
                          ],
                        )

                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
