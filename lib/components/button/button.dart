import 'dart:ui';

import 'package:flutter/material.dart';

class CustomMaterialButtton extends StatelessWidget {
  final Color textColor;
  // final backgrounColor;
  // final borderColor;
  final String text;
  final Function? onPressed;
  // double size;
  CustomMaterialButtton(
      {super.key,
      required this.textColor,
      // this.backgrounColor,
      // this.borderColor,
      required this.text,
      // required this.size,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: const EdgeInsets.only(top: 23.5, bottom: 23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        minWidth: MediaQuery.of(context).size.width * 0.7,
        color: const Color(0xffFDBA2F),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onPressed: () {
          onPressed;
        });
  }
}
