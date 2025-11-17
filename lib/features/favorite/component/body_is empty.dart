import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';

import '../../../core/constant/app_localizations.dart';
import '../../../core/constant/screen_size.dart';

class BodyIsEmpty extends StatelessWidget {
  const BodyIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Expanded(
      child: Center(
        child:Column(
          children: [
            SizedBox(height: 0.3*screenHeight(context),),
            Icon(Icons.hourglass_empty,size: 40, color: mainColor1,),
            Text("${localizer.translate("your favorite page is")}",style: Theme.of(context).textTheme.bodyLarge,),
            Text("${localizer.translate("empty")}",style: Theme.of(context).textTheme.titleSmall,),],
        ),
      ),
    );
  }
}
