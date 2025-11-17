import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/component/section_component.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/office_detiales/component/office_item_list.dart';
import 'package:manzel/features/office_detiales/controller/office_detiales_cubit.dart';
import 'package:manzel/features/office_detiales/see_more_property_for_office.dart';

import '../../core/constant/app_localizations.dart';

class OfficeDetiales extends StatelessWidget {
  int id;
  OfficeDetiales({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create:
          (context) =>
              OfficeDetialesCubit()
                ..getOfficeProperty(id: id),
      child: Builder(
        builder: (context) {
          OfficeDetialesCubit cubit = OfficeDetialesCubit.get(context);
          return Directionality(
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  SizedBox(width: 5),
                  BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                    builder: (context, state) {
                      if(state is GetOfficePropertyLoading){
                        return SizedBox.shrink();
                      }else if(cubit.officeModel?.office!=null){
                        return TextButton(
                          onPressed: () {
                            if (cubit.officeModel?.office?.isFollowing == true) {
                              cubit.unFollowOffice(id: id);
                            } else {
                              cubit.followOffice(id: id);
                            }
                          },
                          child: Text(
                            cubit.officeModel?.office?.isFollowing==true ?   '${localizer.translate("unfollow")}':'${localizer.translate("follow")}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color:
                              cubit.officeModel?.office?.isFollowing == false
                                  ? mainColor1
                                  : mainColor2,
                            ),
                          ),
                        );

                      }
                      else{
                        return SizedBox.shrink();
                      }
                  //    print( cubit.officeModel?.office?.isFollowing);
                    },
                  ),
                ],
                leading: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleIcon(
                    icon: Icons.arrow_back_ios_new_rounded,
                    iconOnTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

              body: Padding(
                padding: const EdgeInsets.all(10),
                child: RefreshIndicator(
                  onRefresh: () async {
                    cubit.getOfficeProperty(id: id);
                  },
                  displacement: 10,
                  color: mainColor1,
                  backgroundColor: Theme.of(context).cardColor,
                  child: SingleChildScrollView(
                    child:  Column(
                      children: [
                        BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
              builder: (context, state) {
                if(state is GetOfficePropertyLoading){
                  return ShimmerComponent(
                    width: double.infinity,
                    height: screenHeight(context) * 0.25,
                    borderRadius: BorderRadius.circular(20),
                  itemCount: 1,
                  );
                }
                else if(cubit.officeModel?.office!=null)
                  {
                    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardColor,
            ),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: screenHeight(context) * 0.25,
                      width: screenWidth(context) * 0.35,
                      child: Image.network(
                        ApiConstance.urlImage(cubit.officeModel?.office?.image ?? ''),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.broken_image,
                              size: 40,
                              color: Colors.grey,
                            ),
                          );
                        },
                        loadingBuilder: (
                            context,
                            child,
                            loadingProgress,
                            ) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[200],
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth(context) * 0.02),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${localizer.translate("name")}:",
                          style:
                          Theme.of(
                            context,
                          ).textTheme.titleSmall,
                        ),
                        Text(
                          "${cubit.officeModel?.office?.officeName}",
                          style:
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium,
                        ),

                        Text(
                          "${localizer.translate("email")}:",
                          style:
                          Theme.of(
                            context,
                          ).textTheme.titleSmall,
                        ),
                        Text(
                          "${cubit.officeModel?.office?.email}",
                          style:
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium,
                        ),

                        Text(
                          "${localizer.translate("phone")}:",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "${cubit.officeModel?.office?.phoneNumberOffice}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "${localizer.translate("discreption")}:",
                          style:
                          Theme.of(
                            context,
                          ).textTheme.titleSmall,
                        ),
                        Text(
                          "${cubit.officeModel?.office?.description}",
                          style:
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
                    );

                  }
                else {
                  return Container(
                    height: screenHeight(context) * 0.25,
                    width: double.infinity,
                    child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: mainColor2,
                ),
                Text(
                  "${localizer.translate("no data")}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: mainColor2),
                ),
              ],
            ),
                    ),
                  );
                }
              },
            ),
                        SizedBox(height: screenHeight(context) * 0.02),

                        SectionComponent(
                          title: '${localizer.translate("residentail")}',
                          textButtonTitle: "seeMore",
                          onPressed: () {
                            if (cubit.residentalProperties != null) {
                              navigatTo(
                                context: context,
                                page: SeeMorePropertyForOffice(
                                  cubit: cubit,
                                  property: cubit.residentalProperties!,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.01),

                        BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                          builder: (context, state) {
                            // var cubit = HomeCubit.get(context);
                            if (state is GetOfficePropertyLoading) {
                              return ShimmerComponent(
                                width: screenWidth(context) * 0.8,
                                height: screenHeight(context) * 0.25,
                                scrollDirection: Axis.horizontal,
                                borderRadius: BorderRadius.circular(20),
                              );
                            } else if (cubit.residentalProperties != null &&
                                cubit.residentalProperties!.isNotEmpty) {
                              return OfficeItemList(
                                properties: cubit.residentalProperties!,
                              );
                            } else {
                              return Container(
                                height: screenHeight(context) * 0.25,
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: mainColor2,
                                      ),
                                      Text(
                                        "${localizer.translate("no data")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: mainColor2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.02),

                        SectionComponent(
                          title: '${localizer.translate("agricultural")}',
                          textButtonTitle: "seeMore",
                          onPressed: () {
                            // var cubit = HomeCubit.get(context);
                            if (cubit.agriculturalProperties != null) {
                              navigatTo(
                                context: context,
                                page: SeeMorePropertyForOffice(
                                  cubit: cubit,
                                  property: cubit.agriculturalProperties!,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.01),

                        BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                          builder: (context, state) {
                            // var cubit = HomeCubit.get(context);
                            if (state is GetOfficePropertyLoading) {
                              return ShimmerComponent(
                                width: screenWidth(context) * 0.8,
                                height: screenHeight(context) * 0.25,
                                scrollDirection: Axis.horizontal,
                                borderRadius: BorderRadius.circular(20),
                              );
                            } else if (cubit.agriculturalProperties != null &&
                                cubit.agriculturalProperties!.isNotEmpty) {
                              return OfficeItemList(
                                properties: cubit.agriculturalProperties!,
                              );
                            } else {
                              return Container(
                                height: screenHeight(context) * 0.25,
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: mainColor2,
                                      ),
                                      Text(
                                        "${localizer.translate("no data")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: mainColor2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.02),

                        SectionComponent(
                          title: '${localizer.translate("commercial")}',
                          textButtonTitle: "seeMore",
                          onPressed: () {
                            // var cubit = HomeCubit.get(context);
                            if (cubit.commercialProperties != null) {
                              navigatTo(
                                context: context,
                                page: SeeMorePropertyForOffice(
                                  cubit: cubit,
                                  property: cubit.commercialProperties!,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.01),

                        BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                          builder: (context, state) {
                            // var cubit = HomeCubit.get(context);
                            if (state is GetOfficePropertyLoading) {
                              return ShimmerComponent(
                                width: screenWidth(context) * 0.8,
                                height: screenHeight(context) * 0.25,
                                scrollDirection: Axis.horizontal,
                                borderRadius: BorderRadius.circular(20),
                              );
                            } else if (cubit.commercialProperties != null &&
                                cubit.commercialProperties!.isNotEmpty) {
                              return OfficeItemList(
                                properties: cubit.commercialProperties!,
                              );
                            } else {
                              return Container(
                                height: screenHeight(context) * 0.25,
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: mainColor2,
                                      ),
                                      Text(
                                        "${localizer.translate("no data")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: mainColor2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.02),

                        SectionComponent(
                          title: '${localizer.translate("industrial")}',
                          textButtonTitle: "seeMore",
                          onPressed: () {
                            // var cubit = HomeCubit.get(context);
                            if (cubit.industrialProperties != null) {
                              navigatTo(
                                context: context,
                                page: SeeMorePropertyForOffice(
                                  cubit: cubit,
                                  property: cubit.industrialProperties!,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight(context) * 0.01),

                        BlocBuilder<OfficeDetialesCubit, OfficeDetialesState>(
                          builder: (context, state) {
                            // var cubit = HomeCubit.get(context);
                            if (state is GetOfficePropertyLoading) {
                              return ShimmerComponent(
                                width: screenWidth(context) * 0.8,
                                height: screenHeight(context) * 0.25,
                                scrollDirection: Axis.horizontal,
                                borderRadius: BorderRadius.circular(20),
                              );
                            } else if (cubit.industrialProperties != null &&
                                cubit.industrialProperties!.isNotEmpty) {
                              return OfficeItemList(
                                properties: cubit.industrialProperties!,
                              );
                            } else {
                              return Container(
                                height: screenHeight(context) * 0.25,
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: mainColor2,
                                      ),
                                      Text(
                                        "${localizer.translate("no data")}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: mainColor2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
