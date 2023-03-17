import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/cancelled_appointments_mentee/cancelled_appointments_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/upcoming_appointments_mentee/upcoming_appointments_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/notification/notification_vm.dart';

import '../myappointments_mentee/widgets/data_notfound.dart';

class NotificationMentee extends StatefulWidget {
  const NotificationMentee({super.key});

  @override
  State<NotificationMentee> createState() => _NotificationMenteeState();
}

class _NotificationMenteeState extends State<NotificationMentee>
    with BasePage<NotificationMenteeVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          backgroundColor: const Color(0xffEBF6F7),
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
                  "Notifications",
                  style: TextStyle(
                      color: Color(0xffFDBA2F),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),
          body: provider.notifications.isNotEmpty
              ? ListView.builder(
                  padding:const EdgeInsets.only(bottom: 40),
                  itemCount: provider.notifications.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    // return Container(
                    //   height: 100,
                    //   width: 10,
                    //   color: Colors.red,
                    // );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            provider.notifications[index].date ?? "",
                            style:const TextStyle(color: Color(0xff777A95)),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: const Color(0xffdadada80)
                                      .withOpacity(0.1),
                                  width: 1)),
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics:const NeverScrollableScrollPhysics(),
                              itemCount: provider.notifications[index]
                                      .notification?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => provider
                                                        .notifications[index]
                                                        .notification?[i]
                                                        .index ==
                                                    3
                                                ?const CancelledAppointmentsMentee()
                                                : UpcomingAppointmentsMentee(
                                                    selectedTab: provider
                                                        .notifications[index]
                                                        .notification?[i]
                                                        .index,
                                                  )));
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                15, 15, 10, 15),
                                        leading: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff5554DB)
                                                .withOpacity(0.10),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: SvgPicture.asset(
                                              'assets/appointment_request.svg'),
                                        ),
                                        title: Text(
                                          provider.notifications[index]
                                                  .notification?[i].title ??
                                              "",
                                          style:const TextStyle(
                                              color: Color(0xff07AEAF)),
                                        ),
                                        subtitle: Text(
                                          provider.notifications[index]
                                                  .notification?[i].body ??
                                              "",
                                          // maxLines: 2
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Divider(
                                          color: const Color(0xffA0A2B3)
                                              .withOpacity(0.5),
                                          thickness: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  })
              : const Center(
                  child: SingleChildScrollView(
                    
                    physics: AlwaysScrollableScrollPhysics(),
                    child: DataNotFound(
                        nodataimg: "assets/nodatafound.svg",
                        cancelledText1: "No Notification Yet",
                        cancelledText2: ""
                        // "You have not sent any meeting request.\n Start meetings by scheduling one",
                        ),
                  ),
                ),
        ));
  }

  @override
  NotificationMenteeVM create() => NotificationMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
