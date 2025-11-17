import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/back_groung.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/app_localizations.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/add_property/add_property.dart';
import 'package:manzel/features/favorite/favorite.dart';
import 'package:manzel/features/home/home.dart';
import 'package:manzel/features/home/component/app_bar.dart';
import 'package:manzel/main_screen/component/custom_bottom_nav_bar.dart';
import 'package:manzel/main_screen/controller/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocBuilder<MainCubit,MainState>(
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);

        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: (){
              navigatTo(context: context, page: AddProperty());
            },
              backgroundColor: mainColor2,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home,color: whitColor,),
                Text(localizer.translate("add_property"), style: TextStyle( fontSize: 10,color: whitColor,height: 1),),
              ],
            ) ,
            ),
            bottomNavigationBar: CustomBottomNavBar(),
            body: cubit.bottomScreens[cubit.currentIndex],
          ),
        );
      },
    );
  }
}
