import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentor/chat_mentor/chat_mentor_vm.dart';

class ChatMentor extends StatefulWidget {
  const ChatMentor({super.key});

  @override
  State<ChatMentor> createState() => _ChatMentorState();
}

class _ChatMentorState extends State<ChatMentor> with BasePage<ChatMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          body: Center(
            child: Text("chat page"),
          ),
        )));
  }

  @override
  ChatMentorVM create() => ChatMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
