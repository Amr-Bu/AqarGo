import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/search/component/search_body.dart';
import 'package:manzel/features/search/component/search_body_isEmpty.dart';
import 'package:manzel/features/search/component/search_header.dart';
import 'package:manzel/features/search/controller/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var cubit =SearchCubit.get(context);
          return Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchHeader(),
                cubit.searchModel==null || cubit.searchModel!.data.isEmpty?
                 SearchBodyIsEmpty():
                SearchBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
