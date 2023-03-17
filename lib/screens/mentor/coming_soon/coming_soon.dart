import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ComingSoon extends StatelessWidget {
  final String? text1;
  final String? text2;
  const ComingSoon({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/chat.json',
            repeat: true,
            width: 252,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          // "Messaging Feature Coming\n Soon!",
          text1!,
          textAlign: TextAlign.center,
          style:const TextStyle(
              color: Color(0xff202020),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Text(
          // "You will be able to start\n messaging your mentors\n directly!",
          text2!,
          textAlign: TextAlign.center,
          style:const TextStyle(
              color: Color(0xffFDBA2F),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
