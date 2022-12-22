import 'package:flutter/material.dart';

class Advertisment extends StatelessWidget {
  final int? totalMentees;
  Advertisment({super.key, required this.totalMentees});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [Color(0xffFDBA2F), Color(0xffFFAA5F)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 20, 15),
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(children: [
        Positioned(
          // top: 40,
          left: -15,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/PinkFlowers.png',
              fit: BoxFit.contain,
              width: 108,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, bottom: 20, top: 20),
          child: RichText(
            text: TextSpan(
              text: totalMentees != null ? "${totalMentees} +" : "",
              style:const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children:const [
                TextSpan(
                  text: 'Alumni has joined the mentorship community.',
                  style: TextStyle(
                    color: Colors.white,
                    // backgroundColor: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '\nHelp them with your mentorship!  ',
                  style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'courier',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
