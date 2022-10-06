import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentee/forum/forum_vm.dart';

class ForumMentee extends StatefulWidget {
  const ForumMentee({super.key});

  @override
  State<ForumMentee> createState() => _ForumMenteeState();
}

class _ForumMenteeState extends State<ForumMentee>
    with BasePage<ForumMenteeVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold()));
  }

  @override
  ForumMenteeVM create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
