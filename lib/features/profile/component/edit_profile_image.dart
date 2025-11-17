import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/profile/models/profile_model.dart';

import '../../../core/constant/screen_size.dart';
import '../controller/profile_cubit.dart';

class EditProfileImage extends StatelessWidget {
   EditProfileImage({super.key ,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit=ProfileCubit.get(context);
        ImageProvider imageProvider;
        if (state is ProfileImageSelected) {
          imageProvider = FileImage(state.imageFile);
        } else {
          imageProvider = NetworkImage('${ApiConstance.basUrlImage}${cubit.profileModel?.user.image}');
        }
        return GestureDetector(
          onTap: () => ProfileCubit.get(context).pickImageFromGallery(),
          child: CircleAvatar(
            radius: screenWidth(context) * 0.18,
            backgroundImage: imageProvider,
          ),
        );
      },
    );

  }
}
