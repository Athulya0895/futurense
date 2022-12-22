import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/myappointments_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/data_notfound.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/meetingcard_widget.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/view_detail.dart';
import 'package:futurensemobileapp/screens/mentee/review_feedback/feedback.dart';
import 'package:futurensemobileapp/screens/mentor/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/cancelled_meeting_mentor/cancelled_meeting_mentor_vm.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/myappointments_mentor.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class CancelledMeetingMentor extends StatefulWidget {
  const CancelledMeetingMentor({super.key});

  @override
  State<CancelledMeetingMentor> createState() => _CancelledMeetingMentorState();
}

class _CancelledMeetingMentorState extends State<CancelledMeetingMentor>
    with BasePage<CancelledMeetingMentorVM> {
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
                  "Cancelled Meetings",
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
          body: provider.cancelMeetings.isNotEmpty
              ? Center(
                  child: ListView.builder(
                      itemCount: provider.cancelMeetings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MeetingCard(
                          url: provider.cancelMeetings[index].profilepic,
                          userName: provider.cancelMeetings[index].userName,
                          meetingMode:
                              provider.cancelMeetings[index].communicationMode,
                          cancelledby: "mentee",
                          status: "Pending",
                          icon: "assets/cancelledimg.svg",
                          buttonText1: "Schedule Another",
                          buttonText2: "Leave a Review",
                          buttonText1pressed: () {},
                          buttonText2pressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (Context) => FeedbackPage(
                                          mentor:
                                              provider.cancelMeetings[index],
                                        )));
                          },
                          onPressedViewDetail: () {
                            print("pressed view details");
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return ViewDetail(
                                  url: provider.cancelMeetings[index].profilepic,
                                  meetingDetails:
                                      provider.cancelMeetings[index],
                                  buttonText1: "Reschedule",
                                  buttonText1pressed: () {
                                    //reschedule meeting
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return Dialog(
                                              backgroundColor: Colors.white,
                                              elevation: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Icon(
                                                              Icons.close)),
                                                    ),
                                                    const Text(
                                                      "Reschedule",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffFDBA2F),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    ListView(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        provider.rescheduleCheckbox
                                                                .isNotEmpty
                                                            ? Wrap(
                                                                children: provider
                                                                    .rescheduleCheckbox
                                                                    .map(
                                                                      (area) =>
                                                                          IntrinsicWidth(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              180,
                                                                          // height: 40,
                                                                          child:
                                                                              InkWell(
                                                                            child:
                                                                                Center(
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
                                                          left: 15, top: 15),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Share in detail",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff202020),
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15, right: 15),
                                                      child: InputField(
                                                        maxline: 3,
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
                                                      height: 30,
                                                    ),
                                                    MaterialButton(
                                                        color:
                                                            Color(0xffFDBA2F),
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
                                                        textColor: Colors.white,

                                                        // color: const Color(0xff6EBFC3),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                25.0),
                                                          ),
                                                          // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                        ),
                                                        child: const Text(
                                                          "Reschedule  ->",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        onPressed: () {
                                                          //go to reschedule page of particular mentor

                                                          print(
                                                              "go to reschedule page of particular mentor");

                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          BookAppointmentMentor(
                                                                            mentor:
                                                                                MentorModel(
                                                                              aboutYou: provider.cancelMeetings[index].about,
                                                                              fName: provider.cancelMeetings[index].userName,
                                                                              canHelpYou: provider.cancelMeetings[index].canhelp,
                                                                              designationName: provider.cancelMeetings[index].designtionName,
                                                                              id: provider.cancelMeetings[index].userId,
                                                                              email: provider.cancelMeetings[index].email,
                                                                              profilePic: provider.cancelMeetings[index].profilepic,
                                                                            ),
                                                                            resheduleStatus:
                                                                                true,
                                                                            cancelReason:
                                                                                provider.currText,
                                                                            cancelDetail:
                                                                                provider.about.text,
                                                                            channelName:
                                                                                provider.cancelMeetings[index].channelName,
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
                                );
                              },
                            );
                          },
                        );
                      }),
                )
              : Center(
                  child: DataNotFound(
                    nodataimg: "assets/nodatafound.svg",
                    cancelledText1: "No Cancelled Meetings",
                    cancelledText2:
                        "You do not have any cancelled meetings to\n show",
                    buttonText: "My Meetings ->",
                    buttonpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyappointmentsMentee()));
                    },
                  ),
                ),
        )));
  }

  @override
  CancelledMeetingMentorVM create() => CancelledMeetingMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
