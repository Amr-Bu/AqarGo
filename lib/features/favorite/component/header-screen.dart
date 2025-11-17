import 'package:flutter/material.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';

import '../../../core/constant/app_localizations.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       Text("${localizer.translate("my favorite")}" ,style:Theme.of(context).textTheme.bodyMedium,),
        SizedBox(width: 0.2*screenWidth(context),),
        CircleIcon(
          iconOnTap: (){},
          icon:Icons.delete_outline_outlined,
        )
      ],
    );
  }
}
