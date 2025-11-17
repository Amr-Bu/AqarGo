import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/profile/component/my-property-item.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';

class MyPropertyGridview extends StatelessWidget {
  const MyPropertyGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Expanded(
          child: GridView.count(
            shrinkWrap: false,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            children: List.generate(cubit.profileModel!.user.properties.length, (index) {
              return Container(
                child: MyPropertyItem(properties:cubit.profileModel!.user.properties[index],),);
            }),
          ),
        );
      },
    );
  }
}
