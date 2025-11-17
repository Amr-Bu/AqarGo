import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/search_textfild.dart';
import 'package:manzel/features/search/component/search_filter_dropdown.dart';
import 'package:manzel/features/search/controller/search_cubit.dart';
import '../../../core/constant/app_localizations.dart';
import '../../../core/constant/screen_size.dart';

class SearchHeader extends StatelessWidget {
   SearchHeader({super.key});
TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${localizer.translate("search")}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(width: 0.3 * screenWidth(context)),
                const SearchFilterDropdown(),
              ],
            ),
            const SizedBox(height: 10),
            SearchTextfild(
              onEditingComplete: () {
                if (searchController.text.trim().isNotEmpty) {
                  cubit.searchProperty(word: searchController.text.trim());
                  print(searchController.text);
                }
              },
              searchController:searchController ,
              autofocus: false,
              enabled: true,
              hintText: "${localizer.translate("search by")} ${localizer.translate("${cubit.selectedFilter}")}",
            ),
          ],
        );
      },
    );
  }
}
