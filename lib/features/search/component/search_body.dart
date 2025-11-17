import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/search/component/my_gridView.dart';
import 'package:manzel/features/search/component/square_card.dart';
import 'package:manzel/features/search/controller/search_cubit.dart';

import '../../../core/component/shimmer_component.dart';
import '../../../core/constant/app_localizations.dart';
import '../../../core/constant/screen_size.dart';


class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit= SearchCubit.get(context);
        if (state is SearchLoadingState){
        return Expanded(
            child: ShimmerComponent(
              height: screenHeight(context),
              width: screenWidth(context),
            ),
          );}
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${localizer.translate("found")} ${cubit.searchModel!.data.length}", style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,),
                MyGridview(),
              ],
            ),
          ),
        );
      },
    );
  }
}
