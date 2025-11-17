import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/profile/component/office_item.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';

import '../../../core/constant/screen_size.dart';

class OfficeList extends StatelessWidget {
  const OfficeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Container(
          height: screenHeight(context) * 0.1,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => OfficeItem(followedOffices: cubit.profileModel!.user!.followedOffices![index],),
            separatorBuilder:
                (context, index) =>
                SizedBox(width: screenWidth(context) * 0.05),
            itemCount: cubit.profileModel!.user!.followedOffices!.length,
          ),
        );
      },
    );
  }
}
