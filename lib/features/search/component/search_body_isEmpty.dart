import 'package:flutter/material.dart';

import '../../../core/constant/app_localizations.dart';
import '../../../core/constant/color.dart';

class SearchBodyIsEmpty extends StatelessWidget {
  const SearchBodyIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_outlined,size: 45, color: mainColor1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${localizer.translate("you can search")} ",style: Theme.of(context).textTheme.bodyLarge,),
              Text("${localizer.translate("now")}",style: Theme.of(context).textTheme.titleSmall,),
            ],
          ),
          Text("${localizer.translate("must search")}", style: Theme.of(context).textTheme.bodySmall ,),
        ],
      ),
    );
  }
}
