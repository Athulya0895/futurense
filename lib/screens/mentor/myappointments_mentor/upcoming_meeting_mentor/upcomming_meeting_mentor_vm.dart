import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/upcoming_meeting_mentor/upcomming_meeeting_mentor.dart';
import 'package:futurensemobileapp/utils/validators.dart';
import 'package:lottie/lottie.dart';

class UpcomingMeetingMentor extends StatefulWidget {
  const UpcomingMeetingMentor({super.key});

  @override
  State<UpcomingMeetingMentor> createState() => _UpcomingMeetingMentorState();
}

class _UpcomingMeetingMentorState extends State<UpcomingMeetingMentor>
    with BasePage<UpcommingMeetingMentorVM> {
  bool cancel = false;
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
                                        side: const BorderSide(
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
                                              children: [
                                                const Text(
                                                  "Klimisch J",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff202020)),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Voice Call ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text("Today- 10:00 AM",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      minimumSize: Size(50, 30),
                                                      tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffFD2FE2)),
                                                      alignment:
                                                          Alignment.centerLeft),
                                                  child: Text("View details"),
                                                ),
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
                                          // width: double.infinity,
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
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: MaterialButton(
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
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Dialog(
                                                            insetPadding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    right: 15),

                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,

                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)), //this right here
                                                            child: Container(
                                                                // width: double
                                                                //     .infinity,
                                                                child: Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.topRight,
                                                                          child: Container(
                                                                              // padding: EdgeInsets.all(5),
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xffD8D8D8))),
                                                                              child: IconButton(
                                                                                  onPressed: (() {
                                                                                    Navigator.pop(context);
                                                                                  }),
                                                                                  icon: Icon(Icons.close))
                                                                              //     const Icon(
                                                                              //   Icons
                                                                              //       .close,
                                                                              //   color:
                                                                              //       Color(0xffFDBA2F),
                                                                              // ),
                                                                              ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        const Center(
                                                                          child:
                                                                              Text(
                                                                            "Reschedule",
                                                                            style: TextStyle(
                                                                                color: Color(0xffFDBA2F),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        const TextField(
                                                                          decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              hintText: 'Why you want to cancel?'),
                                                                        ),
                                                                        Column(
                                                                            children:
                                                                                provider.cancelReasons.map((area) {
                                                                          return CheckboxListTile(
                                                                              activeColor: const Color(0xffFDBA2F),
                                                                              checkColor: Colors.white,
                                                                              value: area["isChecked"],
                                                                              title: Text(
                                                                                area["name"],
                                                                                style: const TextStyle(color: Color(0xff202020), fontSize: 14, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              onChanged: (newValue) {
                                                                                setState(() {
                                                                                  area["isChecked"] = newValue;
                                                                                });
                                                                              });
                                                                        }).toList()),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        const Text(
                                                                          "Share in detail",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xff202020),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                5),
                                                                        InputField(
                                                                          maxline:
                                                                              5,
                                                                          // minline: 1,
                                                                          hintText:
                                                                              "Describe here",
                                                                          controller:
                                                                              provider.cancelReason,

                                                                          validation:
                                                                              Validators.basic,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        MaterialButton(
                                                                          minWidth:
                                                                              double.infinity,
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              cancel = true;
                                                                            });
                                                                            //cancelled  message
                                                                            // showDialog(
                                                                            //   context:
                                                                            //       context,
                                                                            //   barrierDismissible:
                                                                            //       false,
                                                                            //   builder:
                                                                            //       (BuildContext context) {
                                                                            //     return Dialog(
                                                                            //       backgroundColor: Colors.transparent,
                                                                            //       elevation: 0,
                                                                            //       child: Column(
                                                                            //         children: [
                                                                            //           Center(
                                                                            //             child: Lottie.asset(
                                                                            //               'assets/success.json',
                                                                            //               repeat: true,
                                                                            //               width: 300,
                                                                            //               height: 300,
                                                                            //               fit: BoxFit.fill,
                                                                            //             ),
                                                                            //           ),
                                                                            //           const Center(
                                                                            //             child: Text(
                                                                            //               "No data found.please select from dropdown",
                                                                            //               style: TextStyle(color: Color(0xff7E7E7E), fontSize: 12),
                                                                            //             ),
                                                                            //           )
                                                                            //         ],
                                                                            //       ),
                                                                            //     );
                                                                            //   },
                                                                            // );
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Cancel",
                                                                                style: TextStyle(color: Colors.white),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Icon(
                                                                                Icons.arrow_forward,
                                                                                color: Colors.white,
                                                                              )
                                                                            ],
                                                                          ),
                                                                          color:
                                                                              const Color(0xFFFDBA2F),
                                                                        )
                                                                      ],
                                                                    )
                                                                    // : Column(
                                                                    //     children: [
                                                                    //       Center(
                                                                    //         child: Lottie.asset(
                                                                    //           'assets/success.json',
                                                                    //           repeat: true,
                                                                    //           width: 300,
                                                                    //           height: 300,
                                                                    //           fit: BoxFit.fill,
                                                                    //         ),
                                                                    //       ),
                                                                    //       const Center(
                                                                    //         child: Text(
                                                                    //           "No data found.please select from dropdown",
                                                                    //           style: TextStyle(color: Color(0xff7E7E7E), fontSize: 12),
                                                                    //         ),
                                                                    //       )
                                                                    //     ],
                                                                    //   ),
                                                                    )),
                                                          );
                                                        });
                                                  }),
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
                                        side: const BorderSide(
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
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Klimisch J",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff202020)),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Voice Call ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text("Today- 10:00 AM",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      minimumSize: Size(50, 30),
                                                      tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffFD2FE2)),
                                                      alignment:
                                                          Alignment.centerLeft),
                                                  child: Text("View details"),
                                                ),
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
                                                    child: const Text(
                                                        "Send Message"),
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
                                              children: [
                                                const Text(
                                                  "Klimisch J",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff202020)),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Voice Call ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text("Today- 10:00 AM",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Dialog(
                                                            backgroundColor:
                                                                Colors.white,
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    right: 15),
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.4,
                                                              // padding: EdgeInsets
                                                              //     .only(
                                                              //         top: 10,
                                                              //         bottom:
                                                              //             0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                                child: Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child: Container(
                                                                          // padding: EdgeInsets.all(5),
                                                                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xffD8D8D8))),
                                                                          child: IconButton(
                                                                              onPressed: (() {
                                                                                Navigator.pop(context);
                                                                              }),
                                                                              icon: Icon(
                                                                                Icons.close,
                                                                                color: Color(0xffFDBA2F),
                                                                              ))
                                                                          //     const Icon(
                                                                          //   Icons
                                                                          //       .close,
                                                                          //   color:
                                                                          //       Color(0xffFDBA2F),
                                                                          // ),
                                                                          ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "Meeting Details",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffFDBA2F),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Card(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          side: BorderSide(
                                                                              color: Color(0xffF5F5F5),
                                                                              width: 1)),
                                                                      margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                          10,
                                                                          20,
                                                                          10,
                                                                          10),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          ListTile(
                                                                            contentPadding: const EdgeInsets.fromLTRB(
                                                                                10,
                                                                                15,
                                                                                10,
                                                                                15),
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
                                                                                  decoration: BoxDecoration(color: Color(0xffFFC02D), borderRadius: BorderRadius.circular(10)),
                                                                                  child: SvgPicture.asset(
                                                                                    "assets/phone.svg",
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                )),
                                                                            title:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(top: 10),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  const Text(
                                                                                    "Klimisch J",
                                                                                    style: TextStyle(fontSize: 16, color: Color(0xff202020)),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                  const Text(
                                                                                    "Voice Call ",
                                                                                    style: TextStyle(fontSize: 12),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                  const Text("Today- 10:00 AM", style: TextStyle(fontSize: 12)),
                                                                                  const SizedBox(
                                                                                    height: 5,
                                                                                  ),
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
                                                                            width:
                                                                                double.infinity,
                                                                            // height:
                                                                            //     MediaQuery.of(context).size.height *
                                                                            //         0.06,
                                                                            padding:
                                                                                const EdgeInsets.only(top: 10, bottom: 10),
                                                                            decoration:
                                                                                BoxDecoration(color: Color(0xffEBF6F7), borderRadius: BorderRadius.circular(10)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 10),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  MaterialButton(
                                                                                      // color: Colors.transparent,
                                                                                      textColor: Color(0xffFFAA5F),
                                                                                      shape: const RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.all(
                                                                                            Radius.circular(10.0),
                                                                                          ),
                                                                                          side: BorderSide(color: Color(0xffFFAA5F), width: 1)),
                                                                                      child: const Text("Reschedule"),
                                                                                      onPressed: () {}),
                                                                                  const SizedBox(
                                                                                    width: 20,
                                                                                  ),
                                                                                  MaterialButton(
                                                                                      color: const Color(0xff6EBFC3),
                                                                                      textColor: Colors.white,
                                                                                      shape: const RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.all(
                                                                                          Radius.circular(10.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: const Text(
                                                                                        "Accept",
                                                                                        style: TextStyle(fontSize: 12),
                                                                                      ),
                                                                                      onPressed: () {}),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ));
                                                      },
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      minimumSize: Size(50, 30),
                                                      tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffFD2FE2)),
                                                      alignment:
                                                          Alignment.centerLeft),
                                                  child: Text("View details"),
                                                ),
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
                                                    child: const Text(
                                                        "Reschedule"),
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
  UpcommingMeetingMentorVM create() => UpcommingMeetingMentorVM();

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
