import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/add_property/controller/add_property_cubit.dart';

class AddLocationComponent extends StatelessWidget {
  const AddLocationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPropertyCubit, AddPropertyState>(
      builder: (context, state) {
          final cubit = AddPropertyCubit.get(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value:
              cubit.selectedGovernorate?? null,
              menuMaxHeight: screenHeight(context) * 0.6,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                // labelText: 'اختر المحافظة',
                // labelStyle: Theme.of(context)
                //     .textTheme
                //     .bodyMedium
                //     ?.copyWith(color: mainColor2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              items:
              cubit.states!.map((gov) {
                return DropdownMenuItem(
                  value: '${gov.id}',
                  child: Text(
                    "${gov.stateName}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(
                      color:
                      gov == 'اختر المحافظة'
                          ? Colors.grey
                          : mainColor2,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) cubit.selectGovernorate(value);
              },
            ),

            SizedBox(height: screenHeight(context) * 0.04),

            if (cubit.selectedGovernorate!=null &&
                cubit.selectedGovernorate != 'اختر المحافظة')
              DropdownButtonFormField<String>(
                value:
                cubit.selectedArea?? null,
                menuMaxHeight: screenHeight(context) * 0.6,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: 'اختر المنطقة',
                  labelStyle: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: mainColor2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                cubit.reagions![cubit.selectedGovernorate]!
                    .map(
                      (area) => DropdownMenuItem(
                    value: "${area.id}",
                    child: Text(
                      "${area.regionName}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: mainColor2),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) cubit.selectArea(value);
                },
              ),
          ],
        );
      },
    );
  }
}
