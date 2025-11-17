import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:manzel/features/profile/component/follows_is_impty.dart';
import 'package:manzel/features/profile/component/my-property-item.dart';
import 'package:manzel/features/profile/component/my_property_gridView.dart';
import 'package:manzel/features/profile/component/office_list.dart';
import 'package:manzel/features/profile/component/profile_header.dart';
import 'package:manzel/features/profile/component/profile_image.dart';
import 'package:manzel/features/profile/component/property_is_Impty.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';
import 'package:manzel/core/constant/color.dart';
import '../../core/constant/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = ProfileCubit.get(context);
          return Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: [
                const ProfileHeader(),
                if (state is GetProfileLoadingState)
                  Expanded(
                    child: ShimmerComponent(
                      height: screenHeight(context),
                      width: screenWidth(context),
                    ),
                  )
                else if (cubit.profileModel == null)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: mainColor2,
                            size: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${localizer.translate("check")}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: mainColor2),
                          ),
                        ],
                      ),
                    ),
                  )
                else ...[
                    SizedBox(height: screenHeight(context) * 0.04),
                    const ProfileImage(),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            "${localizer.translate("my follow")}:",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    (cubit.profileModel?.user.followedOffices.isEmpty ?? true)
                        ? const FollowsIsImpty()
                        : const OfficeList(),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            "${localizer.translate("my property")}:",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    (cubit.profileModel?.user.properties.isEmpty ?? true)
                        ? const PropertyIsImpty()
                        : const MyPropertyGridview(),
                  ],
              ],
            ),
          );
        },
      ),
    );
  }
}
