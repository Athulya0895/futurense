import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/upcoming_appointments_mentee/upcoming_appointment_mentee_vm.dart';

class UpcomingAppointmentsMentee extends StatefulWidget {
  const UpcomingAppointmentsMentee({super.key});

  @override
  State<UpcomingAppointmentsMentee> createState() =>
      _UpcomingAppointmentsMenteeState();
}

class _UpcomingAppointmentsMenteeState extends State<UpcomingAppointmentsMentee>
    with BasePage<UpcomingAppointmentsMenteeVM> {
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
                title: const Text(
                  "Upcoming Meetings",
                  style: TextStyle(
                      color: const Color(0xffFDBA2F),
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
          body: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TabBar(
                        isScrollable: false,
                        // padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: const EdgeInsets.all(0),
                        labelPadding: EdgeInsets.zero,
                        labelColor: const Color(0xff202020),
                        unselectedLabelColor: const Color(0xff7D8087),
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicator: const UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 3.0, color: Color(0xffFFAA5F)),
                          insets: EdgeInsets.symmetric(horizontal: 25.0),
                        ),
                        tabs: [
                          TabWidget(
                            label: 'Accepted',
                            rightDivider: true,
                          ),
                          TabWidget(
                            label: 'Pending',
                            rightDivider: true,
                          ),
                          TabWidget(
                            label: 'Requests',
                            rightDivider: false,
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: <Widget>[
                          Center(
                            child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            color: Color(0xffF5F5F5),
                                            width: 1)),
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 10),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 15, 10, 15),
                                          leading:
                                              // Image.network(provider
                                              //                 .couponlist[index]
                                              //             ['coupon_image'] !=
                                              //         null
                                              //     ? provider.couponlist[index]['coupon_image']
                                              //     : ""),
                                              Image.asset("assets/profile.png"),
                                          //     SvgPicture.asset(
                                          //   "assets/profile.svg",
                                          //   color: Theme.of(context).primaryColor,
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          trailing: IconButton(
                                              onPressed: (() {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         CouponIndividual(
                                                //       coupondetail:
                                                //           provider.couponlist[index],
                                                //     ),
                                                //   ),
                                                // );
                                              }),
                                              icon: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFFC02D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: SvgPicture.asset(
                                                  "assets/phone.svg",
                                                  color: Colors.white,
                                                ),
                                              )),
                                          title: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Klimisch J",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff202020)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Voice Call ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Today- 10:00 AM",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("View details",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xffFD2FE2)))
                                              ],
                                            ),
                                          ),
                                          // subtitle: Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text(
                                          //       " Voice Call",
                                          //     ),
                                          //   ],
                                          // ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.06,
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xffEBF6F7),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                MaterialButton(
                                                    // color: Colors.transparent,
                                                    textColor:
                                                        Color(0xffFFAA5F),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xffFFAA5F),
                                                                width: 1)),
                                                    child: const Text("Cancel"),
                                                    onPressed: () {}),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                MaterialButton(
                                                    color:
                                                        const Color(0xff6EBFC3),
                                                    textColor: Colors.white,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "Reschedule",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    onPressed: () {}),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Center(
                            child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            color: Color(0xffF5F5F5),
                                            width: 1)),
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 10),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 15, 10, 15),
                                          leading:
                                              // Image.network(provider
                                              //                 .couponlist[index]
                                              //             ['coupon_image'] !=
                                              //         null
                                              //     ? provider.couponlist[index]['coupon_image']
                                              //     : ""),
                                              Image.asset("assets/profile.png"),
                                          //     SvgPicture.asset(
                                          //   "assets/profile.svg",
                                          //   color: Theme.of(context).primaryColor,
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          trailing: IconButton(
                                              onPressed: (() {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         CouponIndividual(
                                                //       coupondetail:
                                                //           provider.couponlist[index],
                                                //     ),
                                                //   ),
                                                // );
                                              }),
                                              icon: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFFC02D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: SvgPicture.asset(
                                                  "assets/phone.svg",
                                                  color: Colors.white,
                                                ),
                                              )),
                                          title: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Klimisch J",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff202020)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Voice Call ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Today- 10:00 AM",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("View details",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xffFD2FE2)))
                                              ],
                                            ),
                                          ),
                                          // subtitle: Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text(
                                          //       " Voice Call",
                                          //     ),
                                          //   ],
                                          // ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.06,
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xffEBF6F7),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                MaterialButton(
                                                    // color: Colors.transparent,
                                                    textColor:
                                                        Color(0xffFFAA5F),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xffFFAA5F),
                                                                width: 1)),
                                                    child: const Text("Cancel"),
                                                    onPressed: () {}),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                MaterialButton(
                                                    color:
                                                        const Color(0xff6EBFC3),
                                                    textColor: Colors.white,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "Remind",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    onPressed: () {}),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Center(
                            child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            color: Color(0xffF5F5F5),
                                            width: 1)),
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 10),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 15, 10, 15),
                                          leading:
                                              // Image.network(provider
                                              //                 .couponlist[index]
                                              //             ['coupon_image'] !=
                                              //         null
                                              //     ? provider.couponlist[index]['coupon_image']
                                              //     : ""),
                                              Image.asset("assets/profile.png"),
                                          //     SvgPicture.asset(
                                          //   "assets/profile.svg",
                                          //   color: Theme.of(context).primaryColor,
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          trailing: IconButton(
                                              onPressed: (() {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         CouponIndividual(
                                                //       coupondetail:
                                                //           provider.couponlist[index],
                                                //     ),
                                                //   ),
                                                // );
                                              }),
                                              icon: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFFC02D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: SvgPicture.asset(
                                                  "assets/phone.svg",
                                                  color: Colors.white,
                                                ),
                                              )),
                                          title: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Klimisch J",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff202020)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Voice Call ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Today- 10:00 AM",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("View details",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xffFD2FE2)))
                                              ],
                                            ),
                                          ),
                                          // subtitle: Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text(
                                          //       " Voice Call",
                                          //     ),
                                          //   ],
                                          // ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.06,
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xffEBF6F7),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                MaterialButton(
                                                    // color: Colors.transparent,
                                                    textColor:
                                                        Color(0xffFFAA5F),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xffFFAA5F),
                                                                width: 1)),
                                                    child: const Text("Cancel"),
                                                    onPressed: () {}),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                MaterialButton(
                                                    color:
                                                        const Color(0xff6EBFC3),
                                                    textColor: Colors.white,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "Accept",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    onPressed: () {}),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              )),
        )));
  }

  //vertical line
  Widget _individualTab(
    final String label,
    final bool rightDivider,
  ) {
    return Container(
      height: 32 + MediaQuery.of(context).padding.bottom,
      width: double.infinity,
      // padding: EdgeInsets.only(),
      decoration: (rightDivider)
          ? BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Text(label),
    );
  }

  @override
  UpcomingAppointmentsMenteeVM create() => UpcomingAppointmentsMenteeVM();
  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}

//to add vertical line

class TabWidget extends StatelessWidget {
  final String label;
  final bool rightDivider;

  TabWidget({
    required this.label,
    required this.rightDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32 + MediaQuery.of(context).padding.bottom,
      width: double.infinity,
      padding: EdgeInsets.all(0),
      decoration: (rightDivider)
          ? BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Center(child: Text(label)),
    );
  }
}
