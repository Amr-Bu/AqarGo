import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/home/component/advertisements_component.dart';
import 'package:manzel/features/home/controller/home_cubit.dart';

class AdvertisementsList extends StatelessWidget {
  const AdvertisementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        if(state is GetHomeDataLoading){
          return ShimmerComponent(
            height: screenHeight(context) * 0.25,
            width:  screenWidth(context)*0.66,
            scrollDirection: Axis.horizontal,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20),bottomRight: Radius.circular(20) ),
          );
        }
        else if(cubit.homeModel!=null&&cubit.homeModel!.adverts.isNotEmpty){
          return Container(
            height: screenHeight(context) * 0.25,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                print(index);
                print(cubit.homeModel!.adverts.length);
               return AdvertisementsComponent(
                  advert: cubit.homeModel!.adverts[index],);
              },
              separatorBuilder:
                  (context, index) =>
                  SizedBox(width: screenWidth(context) * 0.05),
              itemCount: cubit.homeModel!.adverts.length,
            ),
          );

        }
        else{
          return Container(
            height: screenHeight(context) * 0.25,
            width: double.infinity,
            child:  Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(Icons.error_outline,color: mainColor2,),
                Text("No data",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainColor2),)
              ],
            )),
          );
        }
      },
    );
  }
}
