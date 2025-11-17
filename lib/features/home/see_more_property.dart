import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/features/home/controller/home_cubit.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:manzel/features/home/component/see_more_property_item.dart';

import '../../core/constant/app_localizations.dart';

class SeeMoreProperty extends StatelessWidget {
  HomeCubit cubit;
  String type;
  SeeMoreProperty({super.key, required this.cubit, required this.type});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider.value(
      value: cubit,
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "${localizer.translate("properties")}",
              style: Theme.of(context).textTheme.titleSmall,
            ),
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
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if(state is GetHomeDataLoading){
                  return Center(child: CircularProgressIndicator(color: mainColor1,));
                }
                HomeCubit cubit = HomeCubit.get(context);
                List<AlProperty> property = [];
                if (type == 'Residential') {
                  property = cubit.homeModel?.residentalProperties ?? [];
                } else if (type == 'Agricultural') {
                  property = cubit.homeModel?.agriculturalProperties ?? [];
                } else if (type == 'Commercial') {
                  property = cubit.homeModel?.commercialProperties ?? [];
                } else if (type == 'industrial') {
                  property = cubit.homeModel?.industrialProperties ?? [];
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    cubit.getHomeData();
                  },
                  displacement: 10,
                  color: mainColor1,
                  backgroundColor: Theme.of(context).cardColor,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          children: List.generate(property.length, (index) {
                            return Container(
                              child: SeeMorePropertyItem(
                                property: property[index],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
