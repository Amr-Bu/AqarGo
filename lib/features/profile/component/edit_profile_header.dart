import 'package:flutter/material.dart';
import 'package:manzel/core/component/navigator.dart';

import '../../../core/component/circle_icon.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/app_localizations.dart';
class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Row(
        children: [
          CircleIcon(
            iconOnTap: (){
              navigatPop(context: context);
            },
            icon:Icons.arrow_back_ios_new,
          ),
          SizedBox(width: 0.25*screenWidth(context),),
          Text("${localizer.translate("edit profile")}" ,style:Theme.of(context).textTheme.bodyMedium,),

        ]);
  }
}
