import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/screen_size.dart';
import '../controller/edit_property_cubit.dart';


class EditLocationComponent extends StatelessWidget {
  const EditLocationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPropertyCubit, EditPropertyState>(
      builder: (context, state) {
          final cubit = EditPropertyCubit.get(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value:
              cubit.selectedGovernorate.isEmpty
                  ? null
                  : cubit.selectedGovernorate,
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
              cubit.governorates.map((gov) {
                return DropdownMenuItem(
                  value: gov,
                  child: Text(
                    gov,
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

            if (cubit.selectedGovernorate.isNotEmpty &&
                cubit.selectedGovernorate != 'اختر المحافظة')
              DropdownButtonFormField<String>(
                value:
                cubit.selectedArea.isEmpty
                    ? null
                    : cubit.selectedArea,
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
                cubit.areasMap[cubit.selectedGovernorate]!
                    .map(
                      (area) => DropdownMenuItem(
                    value: area,
                    child: Text(
                      area,
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
