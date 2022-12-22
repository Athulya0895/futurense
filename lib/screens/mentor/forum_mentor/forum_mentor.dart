import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentor/coming_soon/coming_soon.dart';
import 'package:futurensemobileapp/screens/mentor/forum_mentor/forum_mentor_vm.dart';

class ForumMentor extends StatefulWidget {
  final jumbToIndex;
  const ForumMentor({super.key, required this.jumbToIndex});

  @override
  State<ForumMentor> createState() => _ForumMentorState();
}

class _ForumMentorState extends State<ForumMentor>
    with BasePage<ForumMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
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
                    "Forum",
                    style: TextStyle(
                        color: const Color(0xffFDBA2F),
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
              text1: "Forum Feature Coming\n Soon!",
              text2:
                  "You will be able to join the\n ongoing tech discussions\n and updates!"),
        )));
  }

  @override
  ForumMentorVM create() => ForumMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
