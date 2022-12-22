import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMaterialButtton extends StatelessWidget {
  final Color? textColor;
  // final backgrounColor;
  // final borderColor;

  final String text;
  final Function? onPressed;
  final Color? buttonColor;
  // double size;
  const CustomMaterialButtton(
      {super.key,
      this.textColor,
      // this.backgrounColor,
      // this.borderColor,
      required this.text,
      // required this.size,
      required this.onPressed,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: MaterialButton(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          // minWidth: MediaQuery.of(context).size.width * 0.2,
          color: buttonColor == null ? Color(0xffFDBA2F) : buttonColor,
          child: Text(
            text,
            style: TextStyle(
                color: textColor == null ? Colors.white : textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          onPressed: () {
            onPressed!();
          },
        ),
      ),
    );
  }
}
