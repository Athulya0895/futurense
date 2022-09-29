import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor_vm.dart';

class HomepageMentor extends StatefulWidget {
  const HomepageMentor({super.key});

  @override
  State<HomepageMentor> createState() => _HomepageMentorState();
}

class _HomepageMentorState extends State<HomepageMentor>
    with BasePage<HomePageMentorVM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  HomePageMentorVM create() => HomePageMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
