import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/add_property/controller/add_property_cubit.dart';

class AddImageComponent extends StatelessWidget {
  const AddImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPropertyCubit, AddPropertyState>(
      builder: (context, state) {
         final cubit = AddPropertyCubit.get(context);

        return Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(4, (index) {
              final image = cubit.images[index];
              return GestureDetector(
                onTap: () {
                  if (cubit.images[index] == null) {
                    cubit.pickImage(index);
                  } else {
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                        title: Text("تنبيه"),
                        content: Text(
                          "هل تريد حذف هذه الصورة؟",
                        ),
                        actions: [
                          TextButton(
                            onPressed:
                                () => Navigator.pop(context),
                            child: Text("لا"),
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.removeImage(index);
                              Navigator.pop(context);
                            },
                            child: Text("نعم"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight(context) * 0.25,
                      width: screenWidth(context) * 0.35,
                      child: Card(
                        child:
                        image != null
                            ? ClipRRect(
                          borderRadius:
                          BorderRadius.circular(8),
                          child: Image.file(
                            File(image.path),
                            fit: BoxFit.cover,
                          ),
                        )
                            : Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: mainColor2.withOpacity(
                              0.5,
                            ),
                            size: 60,
                          ),
                        ),
                      ),
                    ),
// if (image != null)
//   Positioned(
//     top: 0,
//     right: 0,
//     child: IconButton(
//       icon: Icon(
//           Icons.close, color: Colors.red),
//       onPressed: () => cubit.removeImage(index),
//     ),
//   ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
