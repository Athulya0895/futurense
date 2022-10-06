import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/myappointments_mentor_vm.dart';

class MyappointmentsMentor extends StatefulWidget {
  const MyappointmentsMentor({super.key});

  @override
  State<MyappointmentsMentor> createState() => _MyappointmentsMentorState();
}

class _MyappointmentsMentorState extends State<MyappointmentsMentor>
    with BasePage<MyAppointmentsMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          body: Center(
            child: Text("My appointment page"),
          ),
        )));
  }

  @override
  MyAppointmentsMentorVM create() => MyAppointmentsMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
