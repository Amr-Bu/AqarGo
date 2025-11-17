import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/back_groung.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/component/shimmer_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/home/component/advertisements_list.dart';
import 'package:manzel/features/home/component/home_item_list.dart';
import 'package:manzel/features/home/component/location_list.dart';
import 'package:manzel/features/home/component/office_list.dart';
import 'package:manzel/features/home/component/section_component.dart';
import 'package:manzel/features/home/see_more_office.dart';
import 'package:manzel/features/home/see_more_property.dart';

import '../../core/constant/app_localizations.dart';
import 'controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BackGround(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 10,
            right: 10,
            bottom: 3,
          ),
          child: Builder(
            builder: (context) {
              var cubit = HomeCubit.get(context);
              return RefreshIndicator(
                onRefresh: () async {
                  cubit.getHomeData();
                },
                displacement: 10,
                color: mainColor1,
                backgroundColor: Theme.of(context).cardColor,
                child: Directionality(
                  textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                  child: Column(
                    children: [
                      //AppBarComponent(),
                      //SizedBox(height: screenHeight(context)*0.01,),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                            //  SearchTextfild(autofocus: false, enabled: true ,hintText: "",),
                              SizedBox(height: screenHeight(context) * 0.02),
                              AdvertisementsList(),
                              SizedBox(height: screenHeight(context) * 0.02),
                              SectionComponent(title: '${localizer.translate("states")}'),
                              SizedBox(height: screenHeight(context) * 0.01),
                              LocationList(),
                              SizedBox(height: screenHeight(context) * 0.02),
                              SectionComponent(
                                title: '${localizer.translate("offices")}',
                                onPressed: () {
                                  var cubit = HomeCubit.get(context);
                                  if (cubit.homeModel?.offices != null) {
                                    navigatTo(
                                      context: context,
                                      page: SeeMoreOffice(
                                        offices: cubit.homeModel!.offices,
                                      ),
                                    );
                                  }
                                },
                              ),
                              OfficeList(),
                              SizedBox(height: screenHeight(context) * 0.02),

                              SectionComponent(
                                title: '${localizer.translate("residentail")}',
                                onPressed: () {
                                  if (cubit.homeModel?.residentalProperties !=
                                      null) {
                                    navigatTo(
                                      context: context,
                                      page: SeeMoreProperty(
                                        type: 'Residential',
                                        cubit: cubit,
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: screenHeight(context) * 0.01),

                              BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  // var cubit = HomeCubit.get(context);
                                  if (state is GetHomeDataLoading) {
                                    return ShimmerComponent(
                                      width: screenWidth(context) * 0.8,
                                      height: screenHeight(context) * 0.25,
                                      scrollDirection: Axis.horizontal,
                                      borderRadius: BorderRadius.circular(20),
                                    );
                                  } else if (cubit.homeModel != null &&
                                      cubit
                                          .homeModel!
                                          .residentalProperties
                                          .isNotEmpty) {
                                    return HomeItemList(
                                      properties:
                                          cubit.homeModel!.residentalProperties,
                                    );
                                  } else {
                                    return Container(
                                      height: screenHeight(context) * 0.25,
                                      width: double.infinity,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                onPressed: () {
                                  // var cubit = HomeCubit.get(context);
                                  if (cubit.homeModel?.commercialProperties !=
                                      null) {
                                    navigatTo(
                                      context: context,
                                      page: SeeMoreProperty(
                                        type: 'Commercial',
                                        cubit: cubit,
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: screenHeight(context) * 0.01),

                              BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  // var cubit = HomeCubit.get(context);
                                  if (state is GetHomeDataLoading) {
                                    return ShimmerComponent(
                                      width: screenWidth(context) * 0.8,
                                      height: screenHeight(context) * 0.25,
                                      scrollDirection: Axis.horizontal,
                                      borderRadius: BorderRadius.circular(20),
                                    );
                                  } else if (cubit.homeModel != null &&
                                      cubit
                                          .homeModel!
                                          .commercialProperties
                                          .isNotEmpty) {
                                    return HomeItemList(
                                      properties:
                                      cubit.homeModel!.commercialProperties,
                                    );
                                  } else {
                                    return Container(
                                      height: screenHeight(context) * 0.25,
                                      width: double.infinity,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,

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
                                onPressed: () {
                                  // var cubit = HomeCubit.get(context);
                                  if (cubit.homeModel?.agriculturalProperties !=
                                      null) {
                                    navigatTo(
                                      context: context,
                                      page: SeeMoreProperty(
                                        type: 'Agricultural',
                                        cubit: cubit,
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: screenHeight(context) * 0.01),

                              BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  // var cubit = HomeCubit.get(context);
                                  if (state is GetHomeDataLoading) {
                                    return ShimmerComponent(
                                      width: screenWidth(context) * 0.8,
                                      height: screenHeight(context) * 0.25,
                                      scrollDirection: Axis.horizontal,
                                      borderRadius: BorderRadius.circular(20),
                                    );
                                  } else if (cubit.homeModel != null &&
                                      cubit
                                          .homeModel!
                                          .agriculturalProperties
                                          .isNotEmpty) {
                                    return HomeItemList(
                                      properties:
                                          cubit.homeModel!.agriculturalProperties,
                                    );
                                  } else {
                                    return Container(
                                      height: screenHeight(context) * 0.25,
                                      width: double.infinity,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
