import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/features/profile/component/edit_profile_header.dart';
import 'package:manzel/features/profile/component/edit_profile_image.dart';
import 'package:manzel/features/profile/component/upload_button.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';
import '../../core/component/buttom_component.dart';
import '../../core/component/text_from_filde_component.dart';
import '../../core/constant/color.dart';
import '../../core/constant/screen_size.dart';
import 'models/profile_model.dart';
import '../../core/constant/app_localizations.dart';
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          if (state is GetProfileLoadingState) {
            return ShimmerComponent(height: screenHeight(context), width: screenWidth(context));
          }
          firstNameController.text = cubit.profileModel!.user.FirstName;
          lastNameController.text = cubit.profileModel!.user.LastName;
          phoneController.text = cubit.profileModel!.user.PhoneNumber;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EditProfileHeader(),
                    SizedBox(height: screenHeight(context) * 0.03),
                    EditProfileImage(),
                    SizedBox(height: screenHeight(context) * 0.02),
                    UploadButton(),
                    SizedBox(height: screenHeight(context) * 0.02),
                    TextFromFildeComponent(
                      controller: firstNameController,
                      hintText: "First name",
                      suffixIcon: Icons.person,
                    ),
                    SizedBox(height: screenHeight(context) * 0.02),
                    TextFromFildeComponent(
                      controller: lastNameController,
                      hintText: "Last name",
                      suffixIcon: Icons.person,
                    ),
                    SizedBox(height: screenHeight(context) * 0.02),
                    TextFromFildeComponent(
                      controller: phoneController,
                      hintText: "phone ",
                      suffixIcon: Icons.phone,
                    ),
                    SizedBox(height: screenHeight(context) * 0.03),
                    ButtomComponent(
                      onPressed: () {
                        cubit.editProfileData(
                          firstNameController.text,
                          lastNameController.text,
                          phoneController.text,
                        );
                      },
                      text: "${localizer.translate("save change")}",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
