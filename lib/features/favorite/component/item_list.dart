import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/favorite/component/item_card_component.dart';
import 'package:manzel/features/favorite/controller/favorite_cubit.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var cubit =FavoriteCubit.get(context);
        return Expanded(
          child: Container(
            height: screenHeight(context) * 0.25,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => ItemCardComponent(favoritesModel: cubit.favoritesModel!.favorites![index],),
              separatorBuilder:
                  (context, index) =>
                  SizedBox(width: screenWidth(context) * 0.05),
              itemCount: cubit.favoritesModel!.favorites!.length,
            ),
          ),
        );
      },
    );
  }
}
