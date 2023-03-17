import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/mentor_list.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/previous_appointments_mentee/previous_appointment_mentee_vm.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/data_notfound.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/meetingcard_widget.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/view_detail.dart';

import 'package:futurensemobileapp/utils/validators.dart';

class PreviousAppointmentsMentee extends StatefulWidget {
  const PreviousAppointmentsMentee({super.key});

  @override
  State<PreviousAppointmentsMentee> createState() =>
      _PreviousAppointmentsMenteeState();
}

class _PreviousAppointmentsMenteeState extends State<PreviousAppointmentsMentee>
    with BasePage<PreviousAppointmentsMenteeVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize:const Size.fromHeight(60.0),
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
                      "Previous Meetings",
                      style: TextStyle(
                          color:  Color(0xffFDBA2F),
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
              body: provider.previousMeetings.isNotEmpty
                  ? Center(
                      child: ListView.builder(
                          padding:const EdgeInsets.only(bottom: 40),
                          itemCount: provider.previousMeetings.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MeetingCard(
                              url: provider.previousMeetings[index].profilepic,
                              userName:
                                  provider.previousMeetings[index].userName,
                              meetingMode: provider
                                  .previousMeetings[index].communicationMode,
                              fromDate:
                                  provider.previousMeetings[index].fromDate,
                              startTime:
                                  provider.previousMeetings[index].startTime,
                              status: provider.previousMeetings[index].status,
                              icon: provider.previousMeetings[index].status !=
                                      "Expired"
                                  ? "assets/done.svg"
                                  : "assets/expired.svg",
                              buttonText1:
                                  provider.previousMeetings[index].status !=
                                          "Expired"
                                      ? "Schedule Another"
                                      : "Reschedule",
                              buttonText2:
                                  provider.previousMeetings[index].status !=
                                          "Expired"
                                      ? "Leave a Review"
                                      : "",
                              buttonText1pressed: () async {
                                //schedule another in previous meeting mentor
                                if (provider.previousMeetings[index].status !=
                                    "Expired") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>const MentorList()));
                                } else {
                                  final resShow = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return Dialog(
                                            insetPadding:const EdgeInsets.only(
                                                left: 10, right: 10),
                                            shape:const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            backgroundColor: Colors.white,
                                            elevation: 3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
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
                                                        icon:
                                                           const Icon(Icons.close)),
                                                  ),
                                                  const Text(
                                                    "Reschedule Meeting",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFDBA2F),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  ListView(
                                                    physics:
                                                      const  NeverScrollableScrollPhysics(),
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
                                                                            child:
                                                                                Row(
                                                                              children: <Widget>[
                                                                                Checkbox(
                                                                                  activeColor:const Color(0xffFDBA2F),
                                                                                  value: area["isChecked"],
                                                                                  onChanged: (value) {
                                                                                    setState(() => area["isChecked"] = value);
                                                                                    provider.currText = area['name'];
                                                                                  
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
                                                    padding:const EdgeInsets.only(
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
                                                      color:const Color(0xffFDBA2F),
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      // minWidth: 30,
                                                      // height: 30,
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 35,
                                                        right: 35,
                                                      ),
                                                      textColor: Colors.white,

                                                      // color: const Color(0xff6EBFC3),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(25.0),
                                                        ),
                                                        // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                      ),
                                                      child: const Text(
                                                        "Reschedule",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        //go to reschedule page of particular mentor

                                                        // print(
                                                        //     "go to reschedule page of particular mentor");
                                                        Navigator.pop(
                                                            context, true);
                                                      }),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                      });
                                  if (resShow == true) {
                                    // print("true");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BookAppointment(
                                                  topmentor: MentorModel(
                                                    aboutYou: provider
                                                        .previousMeetings[index]
                                                        .about,
                                                    fName: provider
                                                        .previousMeetings[index]
                                                        .userName,
                                                    canHelpYou: provider
                                                        .previousMeetings[index]
                                                        .canhelp,
                                                    designationName: provider
                                                        .previousMeetings[index]
                                                        .designtionName,
                                                    id: provider
                                                        .previousMeetings[index]
                                                        .userId,
                                                    email: provider
                                                        .previousMeetings[index]
                                                        .email,
                                                    profilePic: provider
                                                        .previousMeetings[index]
                                                        .profilepic,
                                                  ),
                                                  resheduleStatus: true,
                                                  cancelReason:
                                                      provider.currText,
                                                  cancelDetail:
                                                      provider.about.text,
                                                  channelName: provider
                                                      .previousMeetings[index]
                                                      .channelName,
                                                ))).then((value) {
                                     
                                      provider.getPreviousMeetings();
                                    });
                                  }
                                }
                              },
                              buttonText2pressed: () {
                                // print("Enter mentor feedback");
                               
                                provider.checkLeaveReview(
                                    provider.previousMeetings[index].channelName
                                        .toString(),
                                    provider.previousMeetings[index],
                                    context);
                           
                              },
                              onPressedViewDetail: () {
                                // print("pressed view detail");
                                //view detail cancelled
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ViewDetail(
                                      url: provider
                                          .previousMeetings[index].profilepic,
                                      meetingDetails:
                                          provider.previousMeetings[index],
                                      viewStatus: provider
                                                  .previousMeetings[index]
                                                  .status ==
                                              "Completed"
                                          ? "“This meeting is over”"
                                          : "“This meeting is expired”",
                                      viewStatusColor: provider
                                                  .previousMeetings[index]
                                                  .status ==
                                              "Completed"
                                          ?const Color(0xff36C936)
                                          :const Color(0xffFF7901),
                                      buttonText2: "",
                                      buttonText1: "Reschedule",
                                      buttonText1pressed: () async {
                                        //reschedule meeting
                                        final resShow = await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return Dialog(
                                                  insetPadding: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  shape:const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  backgroundColor: Colors.white,
                                                  elevation: 3,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon:const Icon(
                                                                  Icons.close)),
                                                        ),
                                                        const Text(
                                                          "Reschedule",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffFDBA2F),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        ListView(
                                                          physics:
                                                            const  NeverScrollableScrollPhysics(),
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
                                                                              width: 180,
                                                                              // height: 40,
                                                                              child: InkWell(
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    children: <Widget>[
                                                                                      Checkbox(
                                                                                        activeColor:const Color(0xffFDBA2F),
                                                                                        value: area["isChecked"],
                                                                                        onChanged: (value) {
                                                                                          setState(() => area["isChecked"] = value);
                                                                                          provider.currText = area['name'];
                                                                                         
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
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 15),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              "Share in detail",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff202020),
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Padding(
                                                          padding:
                                                            const  EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: InputField(
                                                            maxline: 3,
                                                            // minline: 1,
                                                            hintText:
                                                                "write the reason for resheduling",
                                                            controller:
                                                                provider.about,

                                                            validation:
                                                                Validators
                                                                    .basic,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        MaterialButton(
                                                            color:const Color(
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
                                                                Colors.white,

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
                                                            child: const Text(
                                                              "Reschedule",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            onPressed: () {
                                                              //go to reschedule page of particular mentor

                                                              // print(
                                                              //     "go to reschedule page of particular mentor");
                                                              Navigator.pop(
                                                                  context,
                                                                  true);
                                                              Navigator.pop(
                                                                  context,
                                                                  true);
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
                                        if (resShow == true) {
                                       
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookAppointment(
                                                        topmentor: MentorModel(
                                                          aboutYou: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .about,
                                                          fName: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .userName,
                                                          canHelpYou: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .canhelp,
                                                          designationName: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .designtionName,
                                                          id: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .userId,
                                                          email: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .email,
                                                          profilePic: provider
                                                              .previousMeetings[
                                                                  index]
                                                              .profilepic,
                                                        ),
                                                        resheduleStatus: true,
                                                        cancelReason:
                                                            provider.currText,
                                                        cancelDetail:
                                                            provider.about.text,
                                                        channelName: provider
                                                            .previousMeetings[
                                                                index]
                                                            .channelName,
                                                      ))).then((value) {
                                         
                                            provider.getPreviousMeetings();
                                          });
                                        }
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
                        cancelledText1: "No Previous Meetings",
                        cancelledText2:
                            "You do not have any previous meetings to\n show",
                        buttonText: "Schedule Meeting",
                        buttonpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MentorList()));
                        },
                      ),
                    ),
            )

        //   backgroundColor: Colors.white,
        //   appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(60.0),
        //     child: Container(
        //       decoration: const BoxDecoration(
        //         boxShadow: [
        //           BoxShadow(
        //               color: Color(0xffFFD680),
        //               spreadRadius: 0,
        //               blurRadius: 6,
        //               offset: Offset(0, 2),
        //               blurStyle: BlurStyle.normal),
        //         ],
        //       ),
        //       child: AppBar(
        //         centerTitle: true,
        //         title: const Text(
        //           "Previous Meetings",
        //           style: TextStyle(
        //               color: Color(0xffFDBA2F),
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         leading: const BackButtonCustom(),
        //         backgroundColor: Colors.white,
        //         elevation: 0,
        //         shape: const RoundedRectangleBorder(
        //             borderRadius: BorderRadius.vertical(
        //           bottom: Radius.circular(25),
        //         )),
        //       ),
        //     ),
        //   ),
        //   body: provider.previousMeetings.isNotEmpty
        //       ? Center(
        //           child: ListView.builder(
        //               padding: EdgeInsets.only(bottom: 40),
        //               itemCount: provider.previousMeetings.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 return MeetingCard(
        //                   url: provider.previousMeetings[index].profilepic,
        //                   userName: provider.previousMeetings[index].userName,
        //                   meetingMode: provider
        //                       .previousMeetings[index].communicationMode,
        //                   fromDate: provider.previousMeetings[index].fromDate,
        //                   startTime: provider.previousMeetings[index].startTime,
        //                   status: provider.previousMeetings[index].status,
        //                   icon: provider.previousMeetings[index].status !=
        //                           "Expired"
        //                       ? "assets/done.svg"
        //                       : "assets/expired.svg",
        //                   buttonText1:
        //                       provider.previousMeetings[index].status !=
        //                               "Expired"
        //                           ? "Schedule Another"
        //                           : "Reschedule",
        //                   buttonText2:
        //                       provider.previousMeetings[index].status !=
        //                               "Expired"
        //                           ? "Leave a Review"
        //                           : "",
        //                   buttonText1pressed: () {
        //                     //shedule other meeting previous
        //                     provider.previousMeetings[index].status != "Expired"
        //                         ? Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => MentorList()))
        //                         : showDialog(
        //                             context: context,
        //                             builder: (context) {
        //                               return StatefulBuilder(
        //                                   builder: (context, setState) {
        //                                 return Dialog(
        //                                   backgroundColor: Colors.white,
        //                                   insetPadding: EdgeInsets.only(
        //                                       left: 10, right: 10),
        //                                   shape: RoundedRectangleBorder(
        //                                       borderRadius: BorderRadius.all(
        //                                           Radius.circular(10.0))),
        //                                   elevation: 3,
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(8.0),
        //                                     child: Column(
        //                                       mainAxisSize: MainAxisSize.min,
        //                                       mainAxisAlignment:
        //                                           MainAxisAlignment.center,
        //                                       children: [
        //                                         const SizedBox(
        //                                           height: 20,
        //                                         ),
        //                                         Align(
        //                                           alignment: Alignment.topRight,
        //                                           child: IconButton(
        //                                               onPressed: () {
        //                                                 Navigator.pop(context);
        //                                               },
        //                                               icon: const Icon(
        //                                                   Icons.close)),
        //                                         ),
        //                                         const Text(
        //                                           "Reschedule Meeting",
        //                                           style: TextStyle(
        //                                               color: Color(0xffFDBA2F),
        //                                               fontSize: 18,
        //                                               fontWeight:
        //                                                   FontWeight.w600),
        //                                           textAlign: TextAlign.center,
        //                                         ),
        //                                         const SizedBox(
        //                                           height: 15,
        //                                         ),
        //                                         ListView(
        //                                           physics:
        //                                               const NeverScrollableScrollPhysics(),
        //                                           shrinkWrap: true,
        //                                           children: <Widget>[
        //                                             provider.rescheduleCheckbox
        //                                                     .isNotEmpty
        //                                                 ? Wrap(
        //                                                     children: provider
        //                                                         .rescheduleCheckbox
        //                                                         .map(
        //                                                           (area) =>
        //                                                               IntrinsicWidth(
        //                                                             child:
        //                                                                 SizedBox(
        //                                                               width:
        //                                                                   180,
        //                                                               // height: 40,
        //                                                               child:
        //                                                                   InkWell(
        //                                                                 child:
        //                                                                     Center(
        //                                                                   child:
        //                                                                       Row(
        //                                                                     children: <Widget>[
        //                                                                       Checkbox(
        //                                                                         activeColor: const Color(0xffFDBA2F),
        //                                                                         value: area["isChecked"],
        //                                                                         onChanged: (value) {
        //                                                                           setState(() => area["isChecked"] = value);
        //                                                                           provider.currText = area['name'];
        //                                                                           // print(provider.currText);
        //                                                                         },
        //                                                                       ),
        //                                                                       Expanded(
        //                                                                           child: Text(
        //                                                                         area["name"],
        //                                                                       )),
        //                                                                     ],
        //                                                                   ),
        //                                                                 ),
        //                                                               ),
        //                                                             ),
        //                                                           ),
        //                                                         )
        //                                                         .toList(),
        //                                                   )
        //                                                 : Container(),
        //                                           ],
        //                                         ),
        //                                         const Padding(
        //                                           padding: EdgeInsets.only(
        //                                               left: 15, top: 15),
        //                                           child: Align(
        //                                             alignment:
        //                                                 Alignment.topLeft,
        //                                             child: Text(
        //                                               "Share in detail",
        //                                               style: TextStyle(
        //                                                   color:
        //                                                       Color(0xff202020),
        //                                                   fontSize: 14),
        //                                             ),
        //                                           ),
        //                                         ),
        //                                         const SizedBox(height: 10),
        //                                         Padding(
        //                                           padding:
        //                                               const EdgeInsets.only(
        //                                                   left: 15, right: 15),
        //                                           child: InputField(
        //                                             maxline: 3,
        //                                             // minline: 1,
        //                                             hintText:
        //                                                 "write the reason for resheduling",
        //                                             controller: provider.about,

        //                                             validation:
        //                                                 Validators.basic,
        //                                           ),
        //                                         ),
        //                                         const SizedBox(
        //                                           height: 30,
        //                                         ),
        //                                         MaterialButton(
        //                                             color:
        //                                                 const Color(0xffFDBA2F),
        //                                             materialTapTargetSize:
        //                                                 MaterialTapTargetSize
        //                                                     .shrinkWrap,
        //                                             // minWidth: 30,
        //                                             // height: 30,
        //                                             padding:
        //                                                 const EdgeInsets.only(
        //                                               left: 35,
        //                                               right: 35,
        //                                             ),
        //                                             textColor: Colors.white,

        //                                             // color: const Color(0xff6EBFC3),
        //                                             shape:
        //                                                 const RoundedRectangleBorder(
        //                                               borderRadius:
        //                                                   BorderRadius.all(
        //                                                 Radius.circular(25.0),
        //                                               ),
        //                                               // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
        //                                             ),
        //                                             child: const Text(
        //                                               "Reschedule",
        //                                               style: TextStyle(
        //                                                   fontSize: 12,
        //                                                   fontWeight:
        //                                                       FontWeight.bold),
        //                                             ),
        //                                             onPressed: () {
        //                                               //go to reschedule page of particular mentor

        //                                               // print(
        //                                               //     "go to reschedule page of particular mentor");

        //                                               Navigator.push(
        //                                                   context,
        //                                                   MaterialPageRoute(
        //                                                       builder: (context) =>
        //                                                           BookAppointment(
        //                                                             topmentor:
        //                                                                 MentorModel(
        //                                                               aboutYou: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .about,
        //                                                               fName: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .userName,
        //                                                               canHelpYou: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .canhelp,
        //                                                               designationName: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .designtionName,
        //                                                               id: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .userId,
        //                                                               email: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .email,
        //                                                               profilePic: provider
        //                                                                   .previousMeetings[
        //                                                                       index]
        //                                                                   .profilepic,
        //                                                             ),
        //                                                             resheduleStatus:
        //                                                                 true,
        //                                                             cancelReason:
        //                                                                 provider
        //                                                                     .currText,
        //                                                             cancelDetail:
        //                                                                 provider
        //                                                                     .about
        //                                                                     .text,
        //                                                             channelName: provider
        //                                                                 .previousMeetings[
        //                                                                     index]
        //                                                                 .channelName,
        //                                                           )));
        //                                             }),
        //                                         const SizedBox(
        //                                           height: 30,
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                 );
        //                               });
        //                             });
        //                   },
        //                   buttonText2pressed: () {
        //                     print("mentee feedback");
        //                     print(provider.previousMeetings[index].channelName);
        //                     provider.checkLeaveReview(
        //                         provider.previousMeetings[index].channelName
        //                             .toString(),
        //                         provider.previousMeetings[index],
        //                         context);
        //                     // Navigator.push(
        //                     //     context,
        //                     //     MaterialPageRoute(
        //                     //         builder: (context) => FeedbackPage(
        //                     //               mentor:
        //                     //                   provider.previousMeetings[index],
        //                     //               role: "mentee",
        //                     //             )));
        //                   },
        //                   onPressedViewDetail: () {
        //                     //view detail cancelled
        //                     showDialog<void>(
        //                       context: context,
        //                       builder: (BuildContext context) {
        //                         return ViewDetail(
        //                           url: provider
        //                               .previousMeetings[index].profilepic,
        //                           meetingDetails:
        //                               provider.previousMeetings[index],
        //                           viewStatus:
        //                               provider.previousMeetings[index].status ==
        //                                       "Completed"
        //                                   ? "“This meeting is over”"
        //                                   : "“This meeting is expired”",
        //                           viewStatusColor:
        //                               provider.previousMeetings[index].status ==
        //                                       "Completed"
        //                                   ? Color(0xff36C936)
        //                                   : Color(0xffFF7901),
        //                           buttonText2: "",
        //                           buttonText1: "Reschedule",
        //                           buttonText1pressed: () {
        //                             //reschedule meeting
        //                             showDialog(
        //                                 context: context,
        //                                 builder: (context) {
        //                                   return StatefulBuilder(
        //                                       builder: (context, setState) {
        //                                     return Dialog(
        //                                       insetPadding: EdgeInsets.only(
        //                                           left: 10, right: 10),
        //                                       shape: RoundedRectangleBorder(
        //                                           borderRadius:
        //                                               BorderRadius.all(
        //                                                   Radius.circular(
        //                                                       10.0))),
        //                                       backgroundColor: Colors.white,
        //                                       elevation: 3,
        //                                       child: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(8.0),
        //                                         child: Column(
        //                                           mainAxisSize:
        //                                               MainAxisSize.min,
        //                                           mainAxisAlignment:
        //                                               MainAxisAlignment.center,
        //                                           children: [
        //                                             const SizedBox(
        //                                               height: 20,
        //                                             ),
        //                                             Align(
        //                                               alignment:
        //                                                   Alignment.topRight,
        //                                               child: IconButton(
        //                                                   onPressed: () {
        //                                                     Navigator.pop(
        //                                                         context);
        //                                                   },
        //                                                   icon: const Icon(
        //                                                       Icons.close)),
        //                                             ),
        //                                             const Text(
        //                                               "Reschedule",
        //                                               style: TextStyle(
        //                                                   color:
        //                                                       Color(0xffFDBA2F),
        //                                                   fontSize: 18,
        //                                                   fontWeight:
        //                                                       FontWeight.w600),
        //                                               textAlign:
        //                                                   TextAlign.center,
        //                                             ),
        //                                             const SizedBox(
        //                                               height: 15,
        //                                             ),
        //                                             ListView(
        //                                               physics:
        //                                                   const NeverScrollableScrollPhysics(),
        //                                               shrinkWrap: true,
        //                                               children: <Widget>[
        //                                                 provider.rescheduleCheckbox
        //                                                         .isNotEmpty
        //                                                     ? Wrap(
        //                                                         children: provider
        //                                                             .rescheduleCheckbox
        //                                                             .map(
        //                                                               (area) =>
        //                                                                   IntrinsicWidth(
        //                                                                 child:
        //                                                                     SizedBox(
        //                                                                   width:
        //                                                                       180,
        //                                                                   // height: 40,
        //                                                                   child:
        //                                                                       InkWell(
        //                                                                     child:
        //                                                                         Center(
        //                                                                       child: Row(
        //                                                                         children: <Widget>[
        //                                                                           Checkbox(
        //                                                                             activeColor: const Color(0xffFDBA2F),
        //                                                                             value: area["isChecked"],
        //                                                                             onChanged: (value) {
        //                                                                               setState(() => area["isChecked"] = value);
        //                                                                               provider.currText = area['name'];
        //                                                                               // print(provider.currText);
        //                                                                             },
        //                                                                           ),
        //                                                                           Expanded(
        //                                                                               child: Text(
        //                                                                             area["name"],
        //                                                                           )),
        //                                                                         ],
        //                                                                       ),
        //                                                                     ),
        //                                                                   ),
        //                                                                 ),
        //                                                               ),
        //                                                             )
        //                                                             .toList(),
        //                                                       )
        //                                                     : Container(),
        //                                               ],
        //                                             ),
        //                                             const Padding(
        //                                               padding: EdgeInsets.only(
        //                                                   left: 15, top: 15),
        //                                               child: Align(
        //                                                 alignment:
        //                                                     Alignment.topLeft,
        //                                                 child: Text(
        //                                                   "Share in detail",
        //                                                   style: TextStyle(
        //                                                       color: Color(
        //                                                           0xff202020),
        //                                                       fontSize: 14),
        //                                                 ),
        //                                               ),
        //                                             ),
        //                                             const SizedBox(height: 10),
        //                                             Padding(
        //                                               padding:
        //                                                   const EdgeInsets.only(
        //                                                       left: 15,
        //                                                       right: 15),
        //                                               child: InputField(
        //                                                 maxline: 3,
        //                                                 // minline: 1,
        //                                                 hintText:
        //                                                     "write the reason for resheduling",
        //                                                 controller:
        //                                                     provider.about,

        //                                                 validation:
        //                                                     Validators.basic,
        //                                               ),
        //                                             ),
        //                                             const SizedBox(
        //                                               height: 30,
        //                                             ),
        //                                             MaterialButton(
        //                                                 color: const Color(
        //                                                     0xffFDBA2F),
        //                                                 materialTapTargetSize:
        //                                                     MaterialTapTargetSize
        //                                                         .shrinkWrap,
        //                                                 // minWidth: 30,
        //                                                 // height: 30,
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 35,
        //                                                   right: 35,
        //                                                 ),
        //                                                 textColor: Colors.white,

        //                                                 // color: const Color(0xff6EBFC3),
        //                                                 shape:
        //                                                     const RoundedRectangleBorder(
        //                                                   borderRadius:
        //                                                       BorderRadius.all(
        //                                                     Radius.circular(
        //                                                         25.0),
        //                                                   ),
        //                                                   // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
        //                                                 ),
        //                                                 child: const Text(
        //                                                   "Reschedule",
        //                                                   style: TextStyle(
        //                                                       fontSize: 12,
        //                                                       fontWeight:
        //                                                           FontWeight
        //                                                               .bold),
        //                                                 ),
        //                                                 onPressed: () {
        //                                                   //go to reschedule page of particular mentor

        //                                                   // print(
        //                                                   //     "go to reschedule page of particular mentor");

        //                                                   Navigator.push(
        //                                                       context,
        //                                                       MaterialPageRoute(
        //                                                           builder:
        //                                                               (context) =>
        //                                                                   BookAppointment(
        //                                                                     topmentor:
        //                                                                         MentorModel(
        //                                                                       aboutYou: provider.previousMeetings[index].about,
        //                                                                       fName: provider.previousMeetings[index].userName,
        //                                                                       canHelpYou: provider.previousMeetings[index].canhelp,
        //                                                                       designationName: provider.previousMeetings[index].designtionName,
        //                                                                       id: provider.previousMeetings[index].userId,
        //                                                                       email: provider.previousMeetings[index].email,
        //                                                                       profilePic: provider.previousMeetings[index].profilepic,
        //                                                                     ),
        //                                                                     resheduleStatus:
        //                                                                         true,
        //                                                                     cancelReason:
        //                                                                         provider.currText,
        //                                                                     cancelDetail:
        //                                                                         provider.about.text,
        //                                                                     channelName:
        //                                                                         provider.previousMeetings[index].channelName,
        //                                                                   )));
        //                                                 }),
        //                                             const SizedBox(
        //                                               height: 30,
        //                                             ),
        //                                           ],
        //                                         ),
        //                                       ),
        //                                     );
        //                                   });
        //                                 });
        //                           },
        //                         );
        //                       },
        //                     );
        //                   },
        //                 );
        //               }),
        //         )
        //       : Center(
        //           child: DataNotFound(
        //             nodataimg: "assets/nodatafound.svg",
        //             cancelledText1: "No Previous Meetings",
        //             cancelledText2:
        //                 "You do not have any previous meetings to\n show",
        //             buttonText: "Schedule Meeting",
        //             buttonpress: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => const MentorList()));
        //             },
        //           ),
        //         ),
        // )
        ));
  }

  @override
  PreviousAppointmentsMenteeVM create() => PreviousAppointmentsMenteeVM();

  @override
  void initialise(BuildContext context) {}
}
