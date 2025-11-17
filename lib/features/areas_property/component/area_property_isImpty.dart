import 'package:flutter/material.dart';
import 'package:manzel/core/constant/screen_size.dart';

import '../../../core/constant/color.dart';

class AreaPropertyIsimpty extends StatelessWidget {
  const AreaPropertyIsimpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:screenHeight(context)*0.35,),
          Icon(
            Icons.error_outline,
            color: mainColor2,
            size: 30,
          ),
          Text(
            "No Properties for This City",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: mainColor2),
          ),
        ],
      ),
    );
  }
}
