import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:manzel/core/constant/screen_size.dart';

class CrouselSliderComponent extends StatelessWidget {
  final List<String> images;
  const CrouselSliderComponent({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

        items:images.map((e) => Card(
          clipBehavior: Clip.hardEdge,
          child: Image(
            image: AssetImage('${e}'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        )).toList(),
        options: CarouselOptions(

          height: screenHeight(context)*0.25,
          initialPage: 0,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,

        )
    );
  }
}
