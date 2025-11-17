import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class AreasIsImpty extends StatelessWidget {
  const AreasIsImpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: mainColor2,
          ),
          Text(
            "No Areas",
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
