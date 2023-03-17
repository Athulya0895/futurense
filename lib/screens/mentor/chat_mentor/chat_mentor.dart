import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentor/chat_mentor/chat_mentor_vm.dart';
import 'package:futurensemobileapp/screens/mentor/coming_soon/coming_soon.dart';


class ChatMentor extends StatefulWidget {
  final jumbToIndex;
  const ChatMentor({super.key, required this.jumbToIndex});

  @override
  State<ChatMentor> createState() => _ChatMentorState();
}

class _ChatMentorState extends State<ChatMentor> with BasePage<ChatMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize:const Size.fromHeight(60.0),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffFFD680),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: AppBar(
                title: const Center(
                  child: Text(
                    "Messages",
                    style: TextStyle(
                        color:  Color(0xffFDBA2F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),
          body: const ComingSoon(
              text1: "Messaging Feature Coming\n Soon!",
              text2:
                  "You will be able to start\n messaging your mentees\n directly!"),
        )));
  }

  @override
  ChatMentorVM create() => ChatMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
