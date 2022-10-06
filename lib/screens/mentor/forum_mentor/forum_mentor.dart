import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentor/forum_mentor/forum_mentor_vm.dart';

class ForumMentor extends StatefulWidget {
  const ForumMentor({super.key});

  @override
  State<ForumMentor> createState() => _ForumMentorState();
}

class _ForumMentorState extends State<ForumMentor>
    with BasePage<ForumMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          body: Center(
            child: Text("forum page"),
          ),
        )));
  }

  @override
  ForumMentorVM create() => ForumMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
