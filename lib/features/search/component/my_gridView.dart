import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/search/component/square_card.dart';
import 'package:manzel/features/search/controller/search_cubit.dart';


class MyGridview extends StatelessWidget {
  const MyGridview({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit =SearchCubit.get(context);
        return Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            children: List.generate(cubit.searchModel!.data.length, (index) {
              return Container(
                  child: SquareCard(propertiy: cubit.searchModel!.data[index].property,officePropertyId:cubit.searchModel!.data[index].office.officePropertyId ,));
            }),
          ),
        );
      },
    );
  }
}
