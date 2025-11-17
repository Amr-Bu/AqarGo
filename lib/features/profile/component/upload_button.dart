import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/app_localizations.dart';
class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: mainColor1,
          ),
          width: screenWidth(context) * 0.25,
          child: MaterialButton(onPressed: () {
            cubit.uploadProfileImage(userId: cubit.profileModel!.user.id);
          },
            child: Text("${localizer.translate("up load")}",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        );
      },
    );
  }
}
