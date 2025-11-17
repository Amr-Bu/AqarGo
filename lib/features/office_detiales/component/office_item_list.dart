import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/favorite/component/item_card_component.dart';
import 'package:manzel/features/home/component/home_item_card_component.dart';
import 'package:manzel/features/office_detiales/component/office_item_card_component.dart';
import 'package:manzel/features/office_detiales/controller/office_detiales_cubit.dart';
import 'package:manzel/features/office_detiales/model/office_model.dart';
import 'package:manzel/features/office_detiales/model/office_properties_model.dart';

class OfficeItemList extends StatelessWidget {
  List<OfficeProperty> properties;

  OfficeItemList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
      builder: (context, state) {
        return Container(
          height: screenHeight(context) * 0.3,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                OfficeItemCardComponent(propertiesModel: properties[index],),
            separatorBuilder:
                (context, index) =>
                SizedBox(width: screenWidth(context) * 0.05),
            itemCount: properties.length,
          ),
        );
      },
    );
  }
}
