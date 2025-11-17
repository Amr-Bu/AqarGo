import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  final Axis scrollDirection;
  final double height;
  final double width;
  final int itemCount;
  final double spacing;
  final BorderRadius borderRadius;
  final bool isGrid;
  final int crossAxisCount;

  const ShimmerComponent({
    super.key,
    this.scrollDirection = Axis.vertical,
    required this.height,
    required this.width,
    this.itemCount = 6,
    this.spacing = 16.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.isGrid = false,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: width / height,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius,
              ),
            ),
          );
        },
      );
    } else {
      return SizedBox(
        height: scrollDirection == Axis.vertical ? null : height,
        child: ListView.separated(
          scrollDirection: scrollDirection,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemCount,
          separatorBuilder: (_, __) => SizedBox(
            height: scrollDirection == Axis.vertical ? spacing : 0,
            width: scrollDirection == Axis.horizontal ? spacing : 0,
          ),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius,
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
