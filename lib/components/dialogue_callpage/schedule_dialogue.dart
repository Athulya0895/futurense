import 'package:flutter/material.dart';

import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/mentor_list.dart';

class ScheduleDialogue extends StatefulWidget {
  final String text;
  final Widget lottieWidget;
  final String dt;
  final String user;
  // bool shouldShowButton;
  // final Function? buttonpressResume;
  // final Function? buttonpressEndcall;
  ScheduleDialogue({
    super.key,
    required this.text,
    required this.lottieWidget,
    required this.dt,
    required this.user,
    // required this.shouldShowButton,
    // this.buttonpressResume,
    // this.buttonpressEndcall,
  });

  @override
  State<ScheduleDialogue> createState() => _ScheduleDialogueState();
}

class _ScheduleDialogueState extends State<ScheduleDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.all(10),
      // insetPadding: EdgeInsets.all(35),
      insetPadding: const EdgeInsets.only(left: 35, right: 35),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Align(
        alignment: Alignment.topRight,
        child: Container(
          // padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
                color:const Color(0xffD8D8D8),
              ),
              shape: BoxShape.circle),
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints:const BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Color(0xffD8D8D8),
              )),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.lottieWidget,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Your meeting is\n',
                style:const TextStyle(color: Color(0xffA0A2B3), fontSize: 12),
                children: <TextSpan>[
                const  TextSpan(
                    text: 'Successfully Scheduled!\n\n',
                    style: TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                  ),
                  TextSpan(
                    text: 'Meeting Duration : ',
                    style:const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0xffA0A2B3)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${widget.user}\n\n",
                          style: const TextStyle(color: Color(0xff777A95))),
                    ],
                  ),
                  TextSpan(
                    text: 'Date & Time : ',
                    style:const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0xffA0A2B3)),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.dt ?? " DD/MM/YYYY  ",
                          style: const TextStyle(color: Color(0xff777A95))),
                    ],
                  ),
                ]),
          ),
          const SizedBox(height: 25),
          CustomMaterialButtton(
              text: "Done",
              onPressed: () {
                Navigator.pop(context);
              }),
          const SizedBox(
            height: 8,
          ),
          TextButton(
              onPressed: () {
                // print("pressed Schedule another");
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MentorList()));
              },
              child: const Text(
                "Schedule another",
                style: TextStyle(
                    color: Color(0xff682FFD),
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
