import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/color.dart';
import '../controller/edit_property_cubit.dart';


class EditContractTypesComponent extends StatelessWidget {
  const EditContractTypesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPropertyCubit, EditPropertyState>(
      builder: (context, state) {
        final cubit = EditPropertyCubit.get(context);

        return Wrap(
          spacing: 5,
          runSpacing: 5,
          children: List.generate(cubit.contractTypes.length, (
              index,
              ) {
            return GestureDetector(
              onTap: () {
                cubit.chooseContractType(
                  type: cubit.contractTypes[index],
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                  cubit.contractTypes[index] ==
                      cubit.contractType
                      ? mainColor2
                      : Theme.of(
                    context,
                  ).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: mainColor2, width: 2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  cubit.contractTypes[index],
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(
                    color:
                    cubit.contractTypes[index] ==
                        cubit.contractType
                        ? whitColor
                        : mainColor2,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
