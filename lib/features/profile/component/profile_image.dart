import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/profile/component/profile_circle_icon.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';

import '../../../core/network/remote/apis_const.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    var cubit = ProfileCubit.get(context);
    return Column(
      children: [
        Stack(
          children: [
            cubit.profileModel?.user.image !=null ?
            CircleAvatar(
              radius: screenWidth(context) * 0.15,
    backgroundImage: NetworkImage(
    '${ApiConstance.basUrlImage}${cubit.profileModel?.user
        .image}'
    ),
            ):
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: screenWidth(context) * 0.15,
                  child: Icon(Icons.broken_image, size: 40, color: Colors.grey)
                ),
            Positioned(bottom: 4, right: 5, child: ProfileCircleIcon()),
          ],
        ),
        Text("${cubit.profileModel?.user.FirstName} ${cubit.profileModel?.user.LastName}" ,style:Theme.of(context).textTheme.titleSmall,),
        Text("${cubit.profileModel?.user.email}", style:Theme.of(context).textTheme.bodySmall),
      ],
    );
  },
);
  }
}
