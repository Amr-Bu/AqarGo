import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/areas/controller/areas_cubit.dart';
import 'package:manzel/features/areas_property/component/area_property_isImpty.dart';
import 'package:manzel/features/areas_property/component/area_property_item.dart';
import 'package:manzel/features/areas_property/controller/areas_property_cubit.dart';

class AreasProperty extends StatelessWidget {
   AreasProperty({super.key,required this.areaId});
final int areaId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AreasPropertyCubit()..getPropertyToRegion(areaId: areaId),
      child: BlocBuilder<AreasPropertyCubit, AreasPropertyState>(
        builder: (context, state) {
          var cubit = AreasPropertyCubit.get(context);
          if(state is GetPropertyToAreaLoadingState){
            return ShimmerComponent(height:screenHeight(context) , width: screenWidth(context));
          }
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
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

                  cubit.propertys.isEmpty ?
                      AreaPropertyIsimpty():
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      children: List.generate(cubit.propertys.length, (index) {
                        return Container(
                            child: AreaPropertyItem(propertyAreaModel: cubit.propertys[index],));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
