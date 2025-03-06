import 'package:flutter/material.dart';
import 'package:zeto_grocery_app/colors.dart';

Widget cateToExploreprdct(String _text, String _image) {
  return Card(
      child: Column(children: [
    Container(
      width: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ZetoColors.zetoAppBarclr,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          _text,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        Container(
          color: ZetoColors.zetoAppBarclr,
          child: Image(
            image: NetworkImage(_image),
            fit: BoxFit.cover,
            height: 115,
            width: 135,
          ),
        ),
      ]),
    )
  ]));
}
