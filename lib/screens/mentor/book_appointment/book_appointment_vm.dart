import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/main.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentor/mentee%20list/mentee_list.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BookAppointmentMentorVM extends BaseViewModel {
  @override
  void onInit() {
    getTimeSlots(DateTime.now());
  }

  final formKey = GlobalKey<FormState>();
  // dropdown
  var selectedMeetingMode;
  var meetingDuration;
  //timeslot
  String? selectedTimeslot;
  List<bool> isSelectedList = [];
  //calander
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
//get timeslots
  late MentorModel? mentor;
  List<dynamic> availableTimeSlots = [];
  List<dynamic> timeSlots = [];

  //get time Slot
  void getTimeSlots(DateTime focusedDay) async {
    // print(focusedDay.toString());
    // print(mentor!.id.toString());
    FormData formData = FormData();
    formData.fields.add(
      MapEntry("date", focusedDay.toString()),
    );

    showLoading();
    final res =
        await api.mentorRepo.getTimeslotMentor(formData, mentor!.id.toString());
    // print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        availableTimeSlots = res.data['DATA'];
        timeSlots = availableTimeSlots
            .where((element) => element['isAvailable'] == true)
            .map((element) => element['time'])
            .toList();
        print(timeSlots);
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("No data from backend");
    }
    notifyListeners();
  }

  TextEditingController problemDetail = TextEditingController();

  //post Shedule Meeting
  late MentorModel? topmentee;
  String? date;
  postSheduleMeeting(DateTime focusedDay, context) async {
    if (formKey.currentState!.validate()) {
      if (selectedTimeslot != null) {
        showLoading();
        final body = jsonEncode({
          "date": focusedDay.toString(),
          "time": selectedTimeslot,
          "mode": selectedMeetingMode,
          "duration": meetingDuration,
          "agenda": problemDetail.text,
        });
        final res = await api.mentorRepo
            .postSheduleMeetingMentor(body, mentor!.id.toString());

        hideLoading();
        if (res.runtimeType == Response) {
          if (res.data['status'] == true) {
            date = res.data['date'];
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  insetPadding: const EdgeInsets.only(left: 35, right: 35),
                  backgroundColor: Colors.white,
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset("assets/success.png"),
                        Center(
                          child: Lottie.asset(
                            'assets/sent.json',
                            repeat: true,
                            // width: 300,
                            // height: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        const Text(
                          "Your meeting request has been",
                          style: TextStyle(
                              color: Color(0xffA0A2B3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          " Sent Successfully",
                          style:
                              TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mentee : ${mentor?.fName} ${mentor?.lName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xffA0A2B3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Date:${DateFormat('dd-MM-yyyy').format(focusedDay)}\nTime: $selectedTimeslot",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xffA0A2B3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),
                        CustomMaterialButtton(
                            text: "Okay",
                            onPressed: () {
                              Navigator.pop(context);
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: const Home(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino);
                            }),

                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              PersistentNavBarNavigator.pushNewScreen(
                                  MyApp.context,
                                  screen: const MenteeList(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const MenteeList()));
                            },
                            child: const Text(
                              "Schedule another",
                              style: TextStyle(
                                  color: Color(0xff682FFD),
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // showError(res.data['message']);
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset("assets/success.png"),
                        Center(
                          child: Lottie.asset(
                            'assets/failedsection.json',
                            repeat: true,
                            // width: 300,
                            // height: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "oops!",
                          style:
                              TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Looks like your choosen time-slot is reserved.\nTry again with a new slot",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffA0A2B3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 47),
                        Container(
                          height: 56,
                          margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          width: double.infinity,
                          child: MaterialButton(
                            disabledColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: const Color(0xffFDBA2F),
                            textColor: Colors.white,
                            child: const Text(
                              "Retry",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        } else {
          showError(res.data['message']);
        }
      } else {
        showError("Select Time Slot");
      }
    }
  }

//post RescheduleMeeting
//Reschedule Meeting
  rescheduleMeeting(String channelName, String cancelDetail,
      String cancelReason, context) async {
    if (formKey.currentState!.validate()) {
      if (selectedTimeslot != null) {
        FormData formData = FormData();
        formData.fields.addAll([
          MapEntry("channel_name", channelName),
          MapEntry("reschedule_reason", cancelReason),
          MapEntry("reason_detail", cancelDetail),
          MapEntry("date", focusedDay.toString()),
          MapEntry("time", selectedTimeslot.toString()),
          MapEntry("mode", selectedMeetingMode),
          MapEntry("duration", meetingDuration),
          MapEntry("agenda", problemDetail.text),
        ]);
        showLoading();
        var res = await api.mentorRepo.rescheduleMeeting(formData);
        hideLoading();
        if (res.runtimeType == Response) {
          if (res.data['status'] == true) {
            // showNotification(res.data['message']);
            var resShowD = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/Rescheduled.json',
                            repeat: true,
                            // width: 300,
                            // height: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Meeting Rescheduled",
                          style: TextStyle(
                              color: Color(0xffFDBA2F),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          // "Date & Time :${DateFormat('dd-MM-yyyy').format(focusedDay)} at $selectedTimeslot",
                          "Your meeting has been reschedule to\n ${DateFormat('dd-MM-yyyy').format(focusedDay)} at $selectedTimeslot. ",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xffA0A2B3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        // const Text(
                        //   " Sent Sucessfully",
                        //   style: TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                        //   textAlign: TextAlign.center,
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Mentee : ${mentor?.fName} ${mentor?.lName}\n \n Date & Time :${DateFormat('dd-MM-yyyy').format(focusedDay!)} at ${selectedTimeslot}",
                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //       color: Color(0xffA0A2B3),
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w500),
                        // ),
                        const SizedBox(height: 47),
                        Container(
                          height: 56,
                          margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          width: double.infinity,
                          child: MaterialButton(
                            disabledColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () async {
                              // print("reschedule onpress");
                              // Navigator.pop(context);
                              // Navigator.pop(context);
                              Navigator.pop(context, true);
                              // PersistentNavBarNavigator.pushNewScreen(context,
                              //     screen: Home(),
                              //     withNavBar: false,
                              //     pageTransitionAnimation:
                              //         PageTransitionAnimation.cupertino);
                              // PersistentNavBarNavigator.pushNewScreen(context,
                              //     screen: UpcomingMeetingMentor(),
                              //     withNavBar: true,
                              //     pageTransitionAnimation:
                              //         PageTransitionAnimation.cupertino);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             UpcomingMeetingMentor(
                              //               mentor: mentor,
                              //             )));
                            },
                            color: const Color(0xffFDBA2F),
                            textColor: Colors.white,
                            child: const Text(
                              "Okay",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            if (resShowD == true) {
              // Navigator.pop(context, true);
              Navigator.pop(context);

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UpcomingMeetingMentor(
              //               mentor: mentor,
              //             )));
            }
          } else {
            showError(res.data['message']);
          }
        }
      } else {
        showError("Select Time Slot");
      }
    }
  }
}
