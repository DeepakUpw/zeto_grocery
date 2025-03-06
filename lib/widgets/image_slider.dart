import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zeto_grocery_app/data/slider_images.dart';

Widget imageSlider(List<String> _images) {
  return CarouselSlider(
    options: CarouselOptions(),
    items: _images.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(5.6), // Image radius
                  child: Image.network(i, fit: BoxFit.cover),
                ),
              ));
        },
      );
    }).toList(),
  );
}
