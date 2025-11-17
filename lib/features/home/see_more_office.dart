import 'package:flutter/material.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/home/component/see_more_office_item.dart';
import 'package:manzel/features/home/component/see_more_property_item.dart';

import '../../core/constant/app_localizations.dart';

class SeeMoreOffice extends StatelessWidget {
  List<Office>offices;
   SeeMoreOffice({super.key,required this.offices});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${localizer.translate("offices")}",style: Theme.of(context).textTheme.titleSmall,),
          leading:  Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleIcon(
              icon: Icons.arrow_back_ios_new_rounded,
              iconOnTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  children: List.generate(offices.length, (index) {
                    return Container(
                        child:SeeMoreOfficeItem(office: offices[index],));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
