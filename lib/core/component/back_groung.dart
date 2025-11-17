import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            left: -110,
            top: -115,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 362,
                height: 356,
                decoration: ShapeDecoration(
                  color: const Color(0xFF234F68),
                  shape: OvalBorder(),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
