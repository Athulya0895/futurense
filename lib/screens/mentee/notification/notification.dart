import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/screens/mentee/notification/notification_vm.dart';

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
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: provider.notifications?.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              provider.notifications?[index].date ?? "",
                              style: TextStyle(color: Color(0xff777A95)),
                            ),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: const Color(0xffDADADA80)
                                          .withOpacity(0.1),
                                      width: 1)),
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    // itemCount: provider.notifications?[index]
                                    //     .notification?.length,
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
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
                                              provider
                                                      .notifications?[index]
                                                      .notification?[index]
                                                      .title ??
                                                  "",
                                              style: TextStyle(
                                                  color: Color(0xff07AEAF)),
                                            ),
                                            subtitle: const Text(
                                                "Bellamy N. has requested you to join the mentorship meeting today at 07:00 pm. Please accept to confirm.",
                                                maxLines: 2),
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
                                      );
                                    }),
                              )),
                        ],
                      );
                    }),
              ),
            ],
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
