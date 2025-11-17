import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/features/profile/component/drop_menu.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';
import 'package:manzel/features/profile/eidt-profile-screen.dart';
import 'package:manzel/features/profile/language_page.dart';
import '../../../core/component/circle_icon.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/screen_size.dart';
import '../../../core/constant/app_localizations.dart';
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit= ProfileCubit.get(context);
        return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${localizer.translate("profile")}", style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,),
              SizedBox(width: 0.3 * screenWidth(context),),

              CircleAvatar(
                radius: 23,
                backgroundColor: cardColor,
                child: PopupMenuComponent(
                  onLogout: () {
                   cubit.logOut(context);
                  },
                  onEditProfile:(){
                    navigatTo(context: context, page: EditProfileScreen());
                  },
                  onLanguage: (){
                    navigatTo(context: context, page: LanguagePage());
                  },
                ),
              ),
            ]);
      },
    );
  }
}
