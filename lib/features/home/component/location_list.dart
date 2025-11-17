import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/home/component/advertisements_component.dart';
import 'package:manzel/features/home/component/location_component.dart';
import 'package:manzel/features/home/controller/home_cubit.dart';

class LocationList extends StatelessWidget {
  const LocationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        if(state is GetHomeDataLoading){
          return ShimmerComponent(
          height: screenHeight(context) * 0.1,
          width:  screenWidth(context)*0.5,
          scrollDirection: Axis.horizontal,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          );
        }
        else if(cubit.homeModel!=null&&cubit.homeModel!.states.isNotEmpty){
          return Container(
            height: screenHeight(context) * 0.1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => LocationComponent(state:cubit.homeModel!.states[index] ,),
              separatorBuilder:
                  (context, index) =>
                  SizedBox(width: screenWidth(context) * 0.05),
              itemCount: cubit.homeModel!.states.length,
            ),
          );
        }
        else{
        return Container(
        height: screenHeight(context) * 0.1,
        width: double.infinity,
        child:  Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
        Text("No data",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainColor2),)
        ],
        )),
        );
        }
      },
    );
  }
}
