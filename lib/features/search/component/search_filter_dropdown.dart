import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/search/controller/search_cubit.dart';

import '../../../core/constant/app_localizations.dart';
import '../../../core/constant/color.dart';

class SearchFilterDropdown extends StatelessWidget {
  const SearchFilterDropdown({super.key});

  final List<String> filters = const [
    "title",
    "space",
    "price",
    "region",
    "property type",
  ];
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return PopupMenuButton<String>(
      color: backgroundColor,
      icon: const Icon(Icons.tune),
      onSelected: (value) {
        cubit.changeFilter(value);
      },
      itemBuilder: (context) {
        return filters.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(localizer.translate("$choice"),style: TextStyle(color:mainColor2)),
          );
        }).toList();
      },
    );
  }
}
