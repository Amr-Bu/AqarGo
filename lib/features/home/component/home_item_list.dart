import 'package:flutter/material.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/favorite/component/item_card_component.dart';
import 'package:manzel/features/home/component/home_item_card_component.dart';
import 'package:manzel/features/home/model/home_model.dart';

class HomeItemList extends StatelessWidget {
  List<AlProperty> properties;
   HomeItemList({super.key,required this.properties});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context)*0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeItemCardComponent(property: properties[index],),
        separatorBuilder:
            (context, index) => SizedBox(width: screenWidth(context)*0.05),
        itemCount: properties.length,
      ),
    );
  }
}
