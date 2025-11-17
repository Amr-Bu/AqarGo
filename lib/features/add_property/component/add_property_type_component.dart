import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/features/add_property/controller/add_property_cubit.dart';

class AddPropertyTypeComponent extends StatelessWidget {
  const AddPropertyTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return           BlocBuilder<AddPropertyCubit, AddPropertyState>(
      builder: (context, state) {
          final cubit = AddPropertyCubit.get(context);

        return Wrap(
          spacing: 5,
          runSpacing: 5,
          children: List.generate(cubit.propertyTypes.length, (
              index,
              ) {
            return GestureDetector(
              onTap: () {
                cubit.choosePropertyType(
                  type: cubit.propertyTypes[index],
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                  cubit.propertyTypes[index] ==
                      cubit.propertyType
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
                  cubit.propertyTypes[index],
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(
                    color:
                    cubit.propertyTypes[index] ==
                        cubit.propertyType
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
