import 'package:flutter/material.dart';
import 'package:zeto_grocery_app/colors.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: ZetoColors.zetoAppBarclr,
    title: Row(
      children: [
        Text(
          "Zeto",
          style: TextStyle(
              fontSize: 21,
              color: ZetoColors.iconColor,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 60),
        TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: ZetoColors.iconColor,
            ),
            label: Text(
              "Your Location",
              style: TextStyle(color: Colors.white),
            ))
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu_outlined,
            color: ZetoColors.iconColor,
          ))
    ],
  );
}
