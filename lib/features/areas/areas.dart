import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/areas/components/areas_is_impty.dart';
import 'package:manzel/features/areas/controller/areas_cubit.dart';
import 'package:manzel/features/areas_property/areas_property.dart';

class Areas extends StatelessWidget {
   Areas({super.key,required this.stateId});
  dynamic stateId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AreasCubit()..getAreasToState(stateId: stateId),
      child: BlocBuilder<AreasCubit, AreasState>(
  builder: (context, state) {
    var cubit = AreasCubit.get(context);
    if(state is GetAreasLoadingState){
      return ShimmerComponent(height: screenHeight(context), width: screenWidth(context));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cubit.areas.length == 0 ?
                  AreasIsImpty():
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigatTo(context: context, page: AreasProperty(areaId:cubit.areas[index].id ,));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                "${cubit.areas[index].regionName}",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall,
                              ),
                              Spacer(),
                              CircleIcon(icon: Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 5);
                  },
                  itemCount: cubit.areas.length,
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
