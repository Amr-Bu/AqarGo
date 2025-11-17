import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/favorite/component/item_card_component.dart';
import 'package:manzel/features/home/component/home_item_card_component.dart';
import 'package:manzel/features/home/component/office_item_component.dart';
import 'package:manzel/features/home/controller/home_cubit.dart';

import '../../../core/constant/app_localizations.dart';

class OfficeList extends StatelessWidget {
  const OfficeList({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        if(state is GetHomeDataLoading){
          return ShimmerComponent(
            width: screenWidth(context)*0.8,
            height: screenHeight(context)*0.25,
            scrollDirection: Axis.horizontal,
            borderRadius: BorderRadius.circular(20),
          );
        }
        else if(cubit.homeModel!=null&&cubit.homeModel!.offices.isNotEmpty){
        return Container(
          height: screenHeight(context) * 0.25,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => OfficeItemComponent(office:cubit.homeModel!.offices[index] ,),
            separatorBuilder:
                (context, index) =>
                SizedBox(width: screenWidth(context) * 0.05),
            itemCount: cubit.homeModel!.offices.length,
          ),
        );}
        else{
          return Container(
            height: screenHeight(context) * 0.25,
            width: double.infinity,
            child:  Center(child: Column(
              children: [
                Icon(Icons.error_outline,color: mainColor2,),
                Text("${localizer.translate("no data")}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainColor2),)
              ],
            )),
          );
        }
      },
    );
  }
}
