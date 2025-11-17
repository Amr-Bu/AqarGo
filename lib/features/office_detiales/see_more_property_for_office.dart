import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/home/component/see_more_property_item.dart';
import 'package:manzel/features/office_detiales/component/see_more_item_for_office.dart';
import 'package:manzel/features/office_detiales/controller/office_detiales_cubit.dart';
import 'package:manzel/features/office_detiales/model/office_model.dart';
import 'package:manzel/features/office_detiales/model/office_properties_model.dart';

class SeeMorePropertyForOffice extends StatelessWidget {
  List<OfficeProperty> property;
  OfficeDetialesCubit cubit;
  SeeMorePropertyForOffice({super.key,required this.property,required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: Scaffold(
      appBar: AppBar(
        title: Text("property",style: Theme.of(context).textTheme.titleSmall,),
        leading:  Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleIcon(
            icon: Icons.arrow_back_ios_new_rounded,
            iconOnTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                children: List.generate(property.length, (index) {
                  return Container(
                      child:SeeMoreItemForOffice(property: property[index],));
                }),
              ),
            ),
          ],
        ),
      ),
    ),
);
  }
}
