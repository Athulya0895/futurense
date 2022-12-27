import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/agora_video/src/pages/call.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/data_notfound.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/meetingcard_widget.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/view_detail.dart';
import 'package:futurensemobileapp/screens/mentee/review_feedback/feedback.dart';
import 'package:futurensemobileapp/screens/mentor/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentor/mentee%20list/mentee_list.dart';
import 'package:futurensemobileapp/screens/mentor/mentee_detail/mentee_detail.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/upcoming_meeting_mentor/upcomming_meeeting_mentor.dart';
import 'package:futurensemobileapp/utils/validators.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class UpcomingMeetingMentor extends StatefulWidget {
  final MentorModel?
      mentor; //because need to go for particular mentor schedule page
  const UpcomingMeetingMentor({super.key, this.mentor});

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
                            label: 'Confirmed',
                            rightDivider: true,
                          ),
                          TabWidget(
                            label: 'Pending',
                            rightDivider: true,
                          ),
                          TabWidget(
                            label: 'Received',
                            rightDivider: false,
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: <Widget>[
                          RefreshIndicator(
                            onRefresh: () async {
                              provider.getConfirmedUpcomingMeeting();
                            },
                            child: provider.confirmedupcomingmeetings.isNotEmpty
                                ? Center(
                                    child: ListView.builder(
                                        itemCount: provider
                                            .confirmedupcomingmeetings.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return MeetingCard(
                                            url: provider
                                                .confirmedupcomingmeetings[
                                                    index]
                                                .profilepic,
                                            userName: provider
                                                .confirmedupcomingmeetings[
                                                    index]
                                                .userName,
                                            meetingMode: provider
                                                .confirmedupcomingmeetings[
                                                    index]
                                                .communicationMode,
                                            fromDate: provider
                                                .confirmedupcomingmeetings[
                                                    index]
                                                .fromDate,
                                            startTime: provider
                                                .confirmedupcomingmeetings[
                                                    index]
                                                .startTime,
                                            status: provider
                                                .confirmedupcomingmeetings[
                                                    index]
                                                .status,
                                            icon: provider
                                                        .confirmedupcomingmeetings[
                                                            index]
                                                        .communicationMode ==
                                                    "Audio Call"
                                                ? "assets/call.svg"
                                                : "assets/videocall.svg",
                                            buttonText1: "Reschedule",
                                            // buttonText2: "Send Message",
                                            onPressedViewDetail: () {
                                              print("pressed");
                                              showDialog<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return ViewDetail(
                                                    url: provider
                                                        .confirmedupcomingmeetings[
                                                            index]
                                                        .profilepic,
                                                    meetingDetails: provider
                                                            .confirmedupcomingmeetings[
                                                        index],
                                                    buttonText1: "Reschedule",
                                                    buttonText1pressed: () {
                                                      //reschedule meeting
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                                builder: (context,
                                                                    setState) {
                                                              return Dialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 3,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.topRight,
                                                                        child: IconButton(
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            icon: Icon(Icons.close)),
                                                                      ),
                                                                      const Text(
                                                                        "Reschedule",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffFDBA2F),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      ListView(
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        shrinkWrap:
                                                                            true,
                                                                        children: <
                                                                            Widget>[
                                                                          provider.rescheduleCheckbox.isNotEmpty
                                                                              ? Wrap(
                                                                                  children: provider.rescheduleCheckbox
                                                                                      .map(
                                                                                        (area) => IntrinsicWidth(
                                                                                          child: SizedBox(
                                                                                            width: 180,
                                                                                            // height: 40,
                                                                                            child: InkWell(
                                                                                              child: Center(
                                                                                                child: Row(
                                                                                                  children: <Widget>[
                                                                                                    Checkbox(
                                                                                                      activeColor: Color(0xffFDBA2F),
                                                                                                      value: area["isChecked"],
                                                                                                      onChanged: (value) {
                                                                                                        setState(() => area["isChecked"] = value);
                                                                                                        provider.currText = area['name'];
                                                                                                        print(provider.currText);
                                                                                                      },
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                        child: Text(
                                                                                                      area["name"],
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                      .toList(),
                                                                                )
                                                                              : Container(),
                                                                        ],
                                                                      ),
                                                                      const Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                15,
                                                                            top:
                                                                                15),
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.topLeft,
                                                                          child:
                                                                              Text(
                                                                            "Share in detail",
                                                                            style:
                                                                                TextStyle(color: Color(0xff202020), fontSize: 14),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              10),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                15,
                                                                            right:
                                                                                15),
                                                                        child:
                                                                            InputField(
                                                                          maxline:
                                                                              3,
                                                                          // minline: 1,
                                                                          hintText:
                                                                              "write the reason for resheduling",
                                                                          controller:
                                                                              provider.about,

                                                                          validation:
                                                                              Validators.basic,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      MaterialButton(
                                                                          color: Color(
                                                                              0xffFDBA2F),
                                                                          materialTapTargetSize: MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                          // minWidth: 30,
                                                                          // height: 30,
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                            left:
                                                                                35,
                                                                            right:
                                                                                35,
                                                                          ),
                                                                          textColor: Colors
                                                                              .white,

                                                                          // color: const Color(0xff6EBFC3),
                                                                          shape:
                                                                              const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(25.0),
                                                                            ),
                                                                            // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                                          ),
                                                                          child:
                                                                              const Text(
                                                                            "Reschedule  ->",
                                                                            style:
                                                                                TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            //go to reschedule page of particular mentor

                                                                            print("go to reschedule page of particular mentor");

                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (context) => BookAppointmentMentor(
                                                                                          mentor: MentorModel(
                                                                                            aboutYou: provider.confirmedupcomingmeetings[index].about,
                                                                                            fName: provider.confirmedupcomingmeetings[index].userName,
                                                                                            canHelpYou: provider.confirmedupcomingmeetings[index].canhelp,
                                                                                            designationName: provider.confirmedupcomingmeetings[index].designtionName ?? "-",
                                                                                            id: provider.confirmedupcomingmeetings[index].userId,
                                                                                            email: provider.confirmedupcomingmeetings[index].email,
                                                                                            profilePic: provider.confirmedupcomingmeetings[index].profilepic,
                                                                                          ),
                                                                                          resheduleStatus: true,
                                                                                          cancelReason: provider.currText,
                                                                                          cancelDetail: provider.about.text,
                                                                                          channelName: provider.confirmedupcomingmeetings[index].channelName,
                                                                                        )));
                                                                          }),
                                                                      const SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                          });
                                                    },
                                                    icon: provider
                                                                .confirmedupcomingmeetings[
                                                                    index]
                                                                .communicationMode ==
                                                            "Audio Call"
                                                        ? "assets/call.svg"
                                                        : "assets/videocall.svg",
                                                    iconbuttonPressed: () {
                                                      print(
                                                          "pressed videocall by mentor");
                                                      //video call agora
                                                      print(
                                                          "channel Name mentor");
                                                      print(provider
                                                          .confirmedupcomingmeetings[
                                                              index]
                                                          .channelName);
                                                      print(
                                                          "channel Name mentor");
                                                      onJoin(provider
                                                              .confirmedupcomingmeetings[
                                                          index]);
                                                      Navigator.pop(context);
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            buttonText1pressed: () {
                                              //reschedule prssed
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return StatefulBuilder(
                                                        builder: (context,
                                                            setState) {
                                                      return Dialog(
                                                        backgroundColor:
                                                            Colors.white,
                                                        elevation: 3,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.close)),
                                                              ),
                                                              const Text(
                                                                "Reschedule",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xffFDBA2F),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              ListView(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                children: <
                                                                    Widget>[
                                                                  provider.rescheduleCheckbox
                                                                          .isNotEmpty
                                                                      ? Wrap(
                                                                          children: provider
                                                                              .rescheduleCheckbox
                                                                              .map(
                                                                                (area) => IntrinsicWidth(
                                                                                  child: SizedBox(
                                                                                    width: 180,
                                                                                    // height: 40,
                                                                                    child: InkWell(
                                                                                      child: Center(
                                                                                        child: Row(
                                                                                          children: <Widget>[
                                                                                            Checkbox(
                                                                                              activeColor: Color(0xffFDBA2F),
                                                                                              value: area["isChecked"],
                                                                                              onChanged: (value) {
                                                                                                setState(() => area["isChecked"] = value);
                                                                                                provider.currText = area['name'];
                                                                                                print(provider.currText);
                                                                                              },
                                                                                            ),
                                                                                            Expanded(
                                                                                                child: Text(
                                                                                              area["name"],
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                              .toList(),
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        top:
                                                                            15),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Text(
                                                                    "Share in detail",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff202020),
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            15),
                                                                child:
                                                                    InputField(
                                                                  maxline: 3,
                                                                  // minline: 1,
                                                                  hintText:
                                                                      "write the reason for resheduling",
                                                                  controller:
                                                                      provider
                                                                          .about,

                                                                  validation:
                                                                      Validators
                                                                          .basic,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                              MaterialButton(
                                                                  color: Color(
                                                                      0xffFDBA2F),
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  // minWidth: 30,
                                                                  // height: 30,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 35,
                                                                    right: 35,
                                                                  ),
                                                                  textColor:
                                                                      Colors
                                                                          .white,

                                                                  // color: const Color(0xff6EBFC3),
                                                                  shape:
                                                                      const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          25.0),
                                                                    ),
                                                                    // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                                  ),
                                                                  child:
                                                                      const Text(
                                                                    "Reschedule  ->",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    //go to reschedule page of particular mentor

                                                                    print(
                                                                        "go to reschedule page of particular mentor");

                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => BookAppointmentMentor(
                                                                                  mentor: MentorModel(
                                                                                    aboutYou: provider.confirmedupcomingmeetings[index].about,
                                                                                    fName: provider.confirmedupcomingmeetings[index].userName,
                                                                                    canHelpYou: provider.confirmedupcomingmeetings[index].canhelp,
                                                                                    designationName: provider.confirmedupcomingmeetings[index].designtionName,
                                                                                    id: provider.confirmedupcomingmeetings[index].userId,
                                                                                    email: provider.confirmedupcomingmeetings[index].email,
                                                                                    profilePic: provider.confirmedupcomingmeetings[index].profilepic,
                                                                                  ),
                                                                                  resheduleStatus: true,
                                                                                  cancelReason: provider.currText,
                                                                                  cancelDetail: provider.about.text,
                                                                                  channelName: provider.confirmedupcomingmeetings[index].channelName,
                                                                                )));
                                                                  }),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  });
                                            },
                                            // buttonText2pressed: (){
                                            //   //send message
                                            // },
                                            iconButtonpressed: () {
                                              print(
                                                  "pressed videocall by mentor");
                                              //video call agora
                                              print("channel Name mentor");
                                              print(provider
                                                  .confirmedupcomingmeetings[
                                                      index]
                                                  .channelName);
                                              print("channel Name mentor");
                                              onJoin(provider
                                                      .confirmedupcomingmeetings[
                                                  index]);
                                            },
                                          );
                                        }))
                                : Center(
                                    child: SingleChildScrollView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      child: DataNotFound(
                                        nodataimg: "assets/nodatafound.svg",
                                        cancelledText1: "No Confirmed Meetings",
                                        cancelledText2:
                                            "You do not have any confirmed meetings\nto show.\nCheck Received and Sent Requests to confirm a meeting or schedule one.",
                                        buttonText: "Schedule Meeting ->",
                                        buttonpress: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MenteeList()));
                                        },
                                      ),
                                    ),
                                  ),
                          ),

                          //sent or pending upcoming Meetings
                          RefreshIndicator(
                            onRefresh: (() async {
                              provider.getSentUpcomingMeeting();
                            }),
                            child: provider.sentUpcomingMeeting.isNotEmpty
                                ? Center(
                                    child: ListView.builder(
                                        itemCount:
                                            provider.sentUpcomingMeeting.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return MeetingCard(
                                            url: provider
                                                .sentUpcomingMeeting[index]
                                                .profilepic,
                                            userName: provider
                                                .sentUpcomingMeeting[index]
                                                .userName,
                                            meetingMode: provider
                                                .sentUpcomingMeeting[index]
                                                .communicationMode,
                                            fromDate: provider
                                                .sentUpcomingMeeting[index]
                                                .fromDate,
                                            startTime: provider
                                                .sentUpcomingMeeting[index]
                                                .startTime,
                                            status: provider
                                                .sentUpcomingMeeting[index]
                                                .status,
                                            icon: provider
                                                        .sentUpcomingMeeting[
                                                            index]
                                                        .communicationMode ==
                                                    "Audio Call"
                                                ? "assets/calldisabled.svg"
                                                : "assets/videocalldisabled.svg",
                                            // buttonText1: "Remind",
                                            // buttonText2: "Send Message",
                                            onPressedViewDetail: () {
                                              //view Details
                                              showDialog<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return ViewDetail(
                                                    url: provider
                                                        .sentUpcomingMeeting[
                                                            index]
                                                        .profilepic,
                                                    meetingDetails: provider
                                                            .sentUpcomingMeeting[
                                                        index],
                                                    // buttonText1: "Remind",
                                                    // buttonText1pressed: () {
                                                    //   //remind send notification to mentee
                                                    // },
                                                    // buttonText2: "Send Message",
                                                    // buttonText2pressed: () {
                                                    //   //send message to that particular mentee
                                                    // },

                                                    iconbuttonPressed: () {},
                                                    icon: provider
                                                                .sentUpcomingMeeting[
                                                                    index]
                                                                .communicationMode ==
                                                            "Audio Call"
                                                        ? "assets/calldisabled.svg"
                                                        : "assets/videocalldisabled.svg",
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        }))
                                : Center(
                                    child: SingleChildScrollView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      child: Center(
                                        child: DataNotFound(
                                          nodataimg: "assets/nodatafound.svg",
                                          cancelledText1:
                                              "No Meeting Requests Sent",
                                          cancelledText2:
                                              "You have not sent any meeting request.\n Start meetings by scheduling one",
                                          buttonText: "Schedule Meeting ->",
                                          buttonpress: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MenteeList()));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                          ),

                          //Received meeting
                          RefreshIndicator(
                            onRefresh: () async {
                              await provider.getreceivedUpcomingMeeting();
                            },
                            child: provider.receivedUpcomingMeeting.isNotEmpty
                                ? Center(
                                    child: ListView.builder(
                                        itemCount: provider
                                            .receivedUpcomingMeeting.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return MeetingCard(
                                            url: provider
                                                .receivedUpcomingMeeting[index]
                                                .profilepic,
                                            userName: provider
                                                .receivedUpcomingMeeting[index]
                                                .userName,
                                            meetingMode: provider
                                                .receivedUpcomingMeeting[index]
                                                .communicationMode,
                                            fromDate: provider
                                                .receivedUpcomingMeeting[index]
                                                .fromDate,
                                            startTime: provider
                                                .receivedUpcomingMeeting[index]
                                                .startTime,
                                            status: provider
                                                .receivedUpcomingMeeting[index]
                                                .status,
                                            icon: provider
                                                        .receivedUpcomingMeeting[
                                                            index]
                                                        .communicationMode ==
                                                    "Audio Call"
                                                ? "assets/calldisabled.svg"
                                                : "assets/videocalldisabled.svg",
                                            buttonText1: "Accept",
                                            buttonText2: "Reschedule",
                                            onPressedViewDetail: () {
                                              //view detail page
                                              showDialog<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return ViewDetail(
                                                    url: provider
                                                        .receivedUpcomingMeeting[
                                                            index]
                                                        .profilepic,
                                                    meetingDetails: provider
                                                            .receivedUpcomingMeeting[
                                                        index],
                                                    buttonText1: "Accept",
                                                    buttonText1pressed: () {
                                                      //Accept
                                                      //accept button
                                                      print(
                                                          "click accept button");
                                                      provider.acceptMeeting(
                                                          provider
                                                              .receivedUpcomingMeeting[
                                                                  index]
                                                              .channelName
                                                              .toString());
                                                    },
                                                    buttonText2: "Reschedule",
                                                    buttonText2pressed: () {
                                                      //send message to that particular mentee
                                                      //reschedule
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                                builder: (context,
                                                                    setState) {
                                                              return Dialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 3,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.topRight,
                                                                        child: IconButton(
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            icon: Icon(Icons.close)),
                                                                      ),
                                                                      const Text(
                                                                        "Reschedule",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffFDBA2F),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      ListView(
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        shrinkWrap:
                                                                            true,
                                                                        children: <
                                                                            Widget>[
                                                                          provider.rescheduleCheckbox.isNotEmpty
                                                                              ? Wrap(
                                                                                  children: provider.rescheduleCheckbox
                                                                                      .map(
                                                                                        (area) => IntrinsicWidth(
                                                                                          child: SizedBox(
                                                                                            width: 180,
                                                                                            // height: 40,
                                                                                            child: InkWell(
                                                                                              child: Center(
                                                                                                child: Row(
                                                                                                  children: <Widget>[
                                                                                                    Checkbox(
                                                                                                      activeColor: Color(0xffFDBA2F),
                                                                                                      value: area["isChecked"],
                                                                                                      onChanged: (value) {
                                                                                                        setState(() => area["isChecked"] = value);
                                                                                                        provider.currText = area['name'];
                                                                                                        print(provider.currText);
                                                                                                      },
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                        child: Text(
                                                                                                      area["name"],
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                      .toList(),
                                                                                )
                                                                              : Container(),
                                                                        ],
                                                                      ),
                                                                      const Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                15,
                                                                            top:
                                                                                15),
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.topLeft,
                                                                          child:
                                                                              Text(
                                                                            "Share in detail",
                                                                            style:
                                                                                TextStyle(color: Color(0xff202020), fontSize: 14),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              10),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                15,
                                                                            right:
                                                                                15),
                                                                        child:
                                                                            InputField(
                                                                          maxline:
                                                                              3,
                                                                          // minline: 1,
                                                                          hintText:
                                                                              "write the reason for resheduling",
                                                                          controller:
                                                                              provider.about,

                                                                          validation:
                                                                              Validators.basic,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      MaterialButton(
                                                                          color: const Color(
                                                                              0xffFDBA2F),
                                                                          materialTapTargetSize: MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                          // minWidth: 30,
                                                                          // height: 30,
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                            left:
                                                                                35,
                                                                            right:
                                                                                35,
                                                                          ),
                                                                          textColor: Colors
                                                                              .white,

                                                                          // color: const Color(0xff6EBFC3),
                                                                          shape:
                                                                              const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(25.0),
                                                                            ),
                                                                            // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                                          ),
                                                                          child:
                                                                              const Text(
                                                                            "Reschedule  ->",
                                                                            style:
                                                                                TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            //go to reschedule page of particular mentor
                                                                            print(widget.mentor);
                                                                            print("go to reschedule page of particular mentor");

                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (context) => BookAppointmentMentor(
                                                                                          mentor: MentorModel(
                                                                                            aboutYou: provider.receivedUpcomingMeeting[index].about,
                                                                                            fName: provider.receivedUpcomingMeeting[index].userName,
                                                                                            canHelpYou: provider.receivedUpcomingMeeting[index].canhelp,
                                                                                            designationName: provider.receivedUpcomingMeeting[index].designtionName,
                                                                                            id: provider.receivedUpcomingMeeting[index].userId,
                                                                                            email: provider.receivedUpcomingMeeting[index].email,
                                                                                            profilePic: provider.receivedUpcomingMeeting[index].profilepic,
                                                                                          ),
                                                                                          resheduleStatus: true,
                                                                                          cancelReason: provider.currText,
                                                                                          cancelDetail: provider.about.text,
                                                                                          channelName: provider.receivedUpcomingMeeting[index].channelName,
                                                                                        )));
                                                                          }),
                                                                      const SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                          });
                                                    },
                                                    icon: provider
                                                                .receivedUpcomingMeeting[
                                                                    index]
                                                                .communicationMode ==
                                                            "Audio Call"
                                                        ? "assets/calldisabled.svg"
                                                        : "assets/videocalldisabled.svg",
                                                  );
                                                },
                                              );
                                            },
                                            buttonText1pressed: () {
                                              //accept button

                                              provider.acceptMeeting(provider
                                                  .receivedUpcomingMeeting[
                                                      index]
                                                  .channelName
                                                  .toString());
                                            },
                                            buttonText2pressed: () {
                                              //Reschedule in Received

                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return StatefulBuilder(
                                                        builder: (context,
                                                            setState) {
                                                      return Dialog(
                                                        backgroundColor:
                                                            Colors.white,
                                                        elevation: 3,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.close)),
                                                              ),
                                                              const Text(
                                                                "Reschedule",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xffFDBA2F),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              ListView(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                children: <
                                                                    Widget>[
                                                                  provider.rescheduleCheckbox
                                                                          .isNotEmpty
                                                                      ? Wrap(
                                                                          children: provider
                                                                              .rescheduleCheckbox
                                                                              .map(
                                                                                (area) => IntrinsicWidth(
                                                                                  child: SizedBox(
                                                                                    width: 180,
                                                                                    // height: 40,
                                                                                    child: InkWell(
                                                                                      child: Center(
                                                                                        child: Row(
                                                                                          children: <Widget>[
                                                                                            Checkbox(
                                                                                              activeColor: Color(0xffFDBA2F),
                                                                                              value: area["isChecked"],
                                                                                              onChanged: (value) {
                                                                                                setState(() => area["isChecked"] = value);
                                                                                                provider.currText = area['name'];
                                                                                                print(provider.currText);
                                                                                              },
                                                                                            ),
                                                                                            Expanded(
                                                                                                child: Text(
                                                                                              area["name"],
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                              .toList(),
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        top:
                                                                            15),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Text(
                                                                    "Share in detail",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff202020),
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            15),
                                                                child:
                                                                    InputField(
                                                                  maxline: 3,
                                                                  // minline: 1,
                                                                  hintText:
                                                                      "write the reason for resheduling",
                                                                  controller:
                                                                      provider
                                                                          .about,

                                                                  validation:
                                                                      Validators
                                                                          .basic,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                              MaterialButton(
                                                                  color: const Color(
                                                                      0xffFDBA2F),
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  // minWidth: 30,
                                                                  // height: 30,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 35,
                                                                    right: 35,
                                                                  ),
                                                                  textColor:
                                                                      Colors
                                                                          .white,

                                                                  // color: const Color(0xff6EBFC3),
                                                                  shape:
                                                                      const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          25.0),
                                                                    ),
                                                                    // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                                  ),
                                                                  child:
                                                                      const Text(
                                                                    "Reschedule  ->",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    //go to reschedule page of particular mentor
                                                                    print(widget
                                                                        .mentor);
                                                                    print(
                                                                        "go to reschedule page of particular mentor");

                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => BookAppointmentMentor(
                                                                                  mentor: MentorModel(
                                                                                    aboutYou: provider.receivedUpcomingMeeting[index].about,
                                                                                    fName: provider.receivedUpcomingMeeting[index].userName,
                                                                                    canHelpYou: provider.receivedUpcomingMeeting[index].canhelp,
                                                                                    designationName: provider.receivedUpcomingMeeting[index].designtionName,
                                                                                    id: provider.receivedUpcomingMeeting[index].userId,
                                                                                    email: provider.receivedUpcomingMeeting[index].email,
                                                                                    profilePic: provider.receivedUpcomingMeeting[index].profilepic,
                                                                                  ),
                                                                                  resheduleStatus: true,
                                                                                  cancelReason: provider.currText,
                                                                                  cancelDetail: provider.about.text,
                                                                                  channelName: provider.receivedUpcomingMeeting[index].channelName,
                                                                                )));
                                                                  }),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  });
                                            },
                                            iconButtonpressed: () {
                                              //agora video call / audio call

                                              print("channel Name mentor");
                                              print(provider
                                                  .confirmedupcomingmeetings[
                                                      index]
                                                  .channelName);
                                              print("channel Name mentor");
                                              onJoin(provider
                                                      .confirmedupcomingmeetings[
                                                  index]);
                                            },
                                          );
                                        }))
                                : Center(
                                    child: SingleChildScrollView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      child: DataNotFound(
                                        nodataimg: "assets/nodatafound.svg",
                                        cancelledText1:
                                            "No Meeting Request Received",
                                        cancelledText2:
                                            "You have not recieved any meeting\n requests",
                                        buttonText: "Schedule Meeting ->",
                                        buttonpress: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MenteeList()));
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ]),
              )),
        )));
  }

  Future<void> onJoin(MeetingModel? mentor) async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: mentor?.channelName,
          role: ClientRole.Broadcaster,
          mentor: mentor,
          meetingMode: mentor?.communicationMode,
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hey ,'), // To display the title it is optional
            content: const Text(
                'Did you want to continue the call Click on Resume.or else click on Sharefeedback'), // Message which will be pop up on the screen
            // Action widget which will provide the user to acknowledge the choice
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color(0xffFDBA2F),
                // FlatButton widget is used to make a text to work like a button
                textColor: Colors.white,
                onPressed: () {
                  print(" Resume call");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallPage(
                        channelName: mentor?.channelName,
                        role: ClientRole.Broadcaster,
                        mentor: mentor,
                      ),
                    ),
                  );
                }, // function used to perform after pressing the button
                child: Text('Resume call'),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.redAccent,
                textColor: Colors.white,
                onPressed: () {
                  //Go to feedback page make it must type
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => FeedbackPage(mentor: mentor)));
                },
                child: Text('End Call'),
              ),
            ],
          );
        });
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
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
