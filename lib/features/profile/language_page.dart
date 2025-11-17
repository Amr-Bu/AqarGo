import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/app_localizations.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/main_screen/controller/main_cubit.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
  final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
MainCubit mainBloc = MainCubit.get(context);
  return Directionality(
    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
child: Scaffold(
  appBar: AppBar(
    title: Text(localizer.translate('language'), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: mainColor2)),
    iconTheme: const IconThemeData(color: mainColor2),
  ),
body: Padding(
  padding: const EdgeInsets.all(10.0),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("${localizer.translate('choose_language')}:",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: mainColor2),),
    SizedBox(height: screenHeight(context)*0.05,),

    buildLanguageItem(onTap: () {mainBloc.changeLanguage(locale: Locale('en'));  }, context: context, con: isEnglish, title: localizer.translate('english')),
    buildLanguageItem(onTap: () {mainBloc.changeLanguage(locale: Locale('ar'));  }, context: context, con: isArabic, title: localizer.translate('arabic')),

  ],
    ),
  ),
),
),
  );
  }
  Widget buildLanguageItem({required void Function()? onTap,required BuildContext context,required bool con,required String title})=>  Padding(
    padding: const EdgeInsets.only(top: 5),
    child: InkWell(
      onTap:onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:  screenHeight(context)*0.02,horizontal: screenWidth(context)*0.02),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).cardColor.withOpacity(0.8),
                radius: 25,
                child: Icon(Icons.language,color: mainColor2,size: 25,),
              ),
              SizedBox(width: 5,),
              Text(title,style: Theme.of(context).textTheme.bodyMedium,),
              Spacer(),
              if(con)
                CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.check,color: mainColor2,size: 20,),
                ),
            ],
          ),
        ),
      ),
    ),
  );

}
