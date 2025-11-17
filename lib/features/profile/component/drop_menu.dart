import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/app_localizations.dart';

class PopupMenuComponent extends StatelessWidget {
  final void Function()? onEditProfile;
  final void Function()? onSettings;
  final void Function()? onLogout;
  final void Function()? onLanguage;
  const PopupMenuComponent({
    super.key,
    this.onEditProfile,
    this.onSettings,
    this.onLogout,
    this.onLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return PopupMenuButton<String>(
      color: backgroundColor,
      icon: Icon(Icons.more_vert,color:mainColor2,),
      onSelected: (value) {
        if (value == 'edit') {
          onEditProfile?.call();
        } else if (value == 'settings') {
          onSettings?.call();
        } else if (value == 'logout') {
          onLogout?.call();
        }else if (value == 'language') {
          onLanguage?.call();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit',
          child: Row(
            children: [
              Icon(Icons.edit, color: mainColor2),
              SizedBox(width: 8),
              Text('${localizer.translate("edit profile")}',style: TextStyle(color:mainColor2)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings, color: mainColor2),
              SizedBox(width: 8),
              Text('${localizer.translate("setting")}',style: TextStyle(color:mainColor2)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'language',
          child: Row(
            children: [
              Icon(Icons.language, color: mainColor2),
              SizedBox(width: 8),
              Text('${localizer.translate("language")}',style: TextStyle(color:mainColor2)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 8),
              Text('${localizer.translate("logout")}', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }
}
