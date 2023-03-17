import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';

import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/cancelled_appointments_mentee/cancelled_appointments_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/myappointments_mentee_vm.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/previous_appointments_mentee/previous_appointment_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/upcoming_appointments_mentee/upcoming_appointments_mentee.dart';

class MyappointmentsMentee extends StatefulWidget {
  final jumbToIndex;
  const MyappointmentsMentee({super.key, this.jumbToIndex});

  @override
  State<MyappointmentsMentee> createState() => _MyappointmentsMenteeState();
}

class _MyappointmentsMenteeState extends State<MyappointmentsMentee>
    with BasePage<MyAppointmentsMenteeVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
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
                centerTitle: true,
                title: const Text(
                  "My Meetings",
                  style: TextStyle(
                      color: Color(0xffFDBA2F),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
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
          body: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              _meetingsCardWidget("Upcoming Meetings", onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const UpcomingAppointmentsMentee()));
              },
                  color: const Color(0xffFDBA2F),
                  lightColor: const Color(0xffFFC958)),
              _meetingsCardWidget("Previous Meetings", onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PreviousAppointmentsMentee()));
              },
                  color: const Color(0xff90D8DC),
                  lightColor: const Color(0xff95E1E4)),
              _meetingsCardWidget("Cancelled Meetings", onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CancelledAppointmentsMentee()));
              },
                  color: const Color(0xffFFAA5F),
                  lightColor: const Color(0xffFFBC80)),
            ],
          ),
        )));
  }
//widget for card design

  Widget _meetingsCardWidget(
    // final Function? onPressed,
    String title, {
    required Color color,
    required Color lightColor,
    required Function onpressed,
  }) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    
 
    return AspectRatio(
      aspectRatio: 8 / 3,
      child: InkWell(
        child: Container(
            //  height: 280,
            // width: AppTheme.fullWidth(context) * .3,
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 10,
                  color: lightColor.withOpacity(.8),
                )
              ],
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -30,
                  right: -140,
                  height: 100,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: lightColor,
                      radius: 180,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(title, style: titleStyle).vP4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        (Icons.chevron_right),
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ).p16,
                ),
              ],
            )),
        onTap: () {
          onpressed();
        },
      ),
    );
  }

  @override
  MyAppointmentsMenteeVM create() => MyAppointmentsMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
