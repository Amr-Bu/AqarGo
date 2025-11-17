import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/app_localizations.dart';
class FollowsIsImpty extends StatelessWidget {
  const FollowsIsImpty({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return  Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(
      Icons.error_outline,
      color: mainColor2,
      ),
      Text(
      "${localizer.translate("no follows")}",
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: mainColor2),
      ),
      ],
      ),
    );
  }
}
