import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/main_screen/controller/main_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit cubit =MainCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 8),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(cubit.icons.length, (index) {
              final isSelected = cubit.currentIndex == index;
              return GestureDetector(
                onTap: () {
                  cubit.ChangeBottom(index);
                }
                ,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      cubit.icons[index],
                      color: isSelected ? Color(0xFF204264) : Colors.black45,
                    ),
                    SizedBox(height: 4),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xFF204264) : Colors
                            .transparent,
                        shape: BoxShape.circle,
                      ),
                    )
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