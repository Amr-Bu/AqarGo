import 'package:flutter/material.dart';
import 'package:manzel/core/component/text_buttom.dart';
import 'package:manzel/core/constant/color.dart';

import '../../../core/constant/app_localizations.dart';

class SectionComponent extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const SectionComponent({super.key, required this.title,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Row(
      children: [
        Text(title,style: Theme.of(context).textTheme.titleSmall,),
        Spacer(),
        if(onPressed!=null)
        TextButtonComponent(onPressed: onPressed!, text: '${localizer.translate("see more")}',)
      ],
    );
  }
}
