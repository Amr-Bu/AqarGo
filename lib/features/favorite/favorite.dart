import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/shimmer_component.dart';

import 'package:manzel/features/favorite/component/header-screen.dart';
import 'package:manzel/features/favorite/component/item_list.dart';
import 'package:manzel/features/favorite/controller/favorite_cubit.dart';

import '../../core/constant/app_localizations.dart';
import '../../core/constant/color.dart';
import '../../core/constant/screen_size.dart';
import 'component/body_is empty.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavorite(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          var cubit =FavoriteCubit.get(context);
          if(state is GetFavoriteLoadingState){
            return ShimmerComponent(height: screenHeight(context), width: screenHeight(context));
          }
          else if (cubit.favoritesModel==null){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: mainColor2,
                    size: 40,
                  ),
                  Text(
                    "${localizer.translate("check")}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: mainColor2),
                  ),
                ],
              ) ,
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderScreen(),
                cubit.favoritesModel?.favorites?.length == 0 ?
                BodyIsEmpty()
                :
                ItemList(),

              ],
            ),
          );
        },
      ),
    );
  }
}
