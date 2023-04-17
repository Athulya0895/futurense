import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/review_feedback/feedback.dart';
import 'package:lottie/lottie.dart';

class PreviousAppointmentsMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    getPreviousMeetings();
  }

  String currText = '';
  TextEditingController about = TextEditingController();
  //Reschedule
  List<Map> rescheduleCheckbox = [
    {"name": "Schedule clash", "isChecked": false},
    {"name": "Personal reasons", "isChecked": false},
    {
      "name": "Others",
      "isChecked": false,
    },
  ];
//get UpcomingConfirmed meeting
  List tempprevious = [];
  List<MeetingModel> previousMeetings = [];
  void getPreviousMeetings() async {
    showLoading();
    final res = await api.menteeRepo.getPreviousMeetings();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempprevious = res.data['DATA'] ?? [];
        previousMeetings =
            tempprevious.map((e) => MeetingModel.fromjson(e)).toList();
        // print("previousMeetings");
        // print(previousMeetings);
        // print("previousMeetings");
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Servere Error");
    }
  }

//  late MeetingModel? mentee;
  String? canLeaveReview;
  checkLeaveReview(String channelName, MeetingModel? mentee, context) async {
   
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("channel_name", channelName),
    ]);
    showLoading();
  
    final res = await api.menteeRepo.checkLeaveReview(formData);

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
      
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FeedbackPage(
                      mentor: mentee,
                      role: "mentee",
                    )));
        notifyListeners();
      } else {
        await showDialog<void>(
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
                        fit: BoxFit.fill,
                        reverse: true,
                        repeat: false,
                        onLoaded: (value) async {
                          Future.delayed(value.duration).then((value) {
                            Navigator.pop(context);
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     PageRouteBuilder(
                            //         pageBuilder:
                            //             (context, animation1, animation2) =>
                            //                 const Home(),
                            //         transitionDuration: Duration.zero,
                            //         reverseTransitionDuration: Duration.zero),
                            //     (route) => false);
                          });
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Your Feedback has  already been Submitted",
                      style: TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          },
        );
        // Fluttertoast.showToast(
        //     msg: "Already submitted your feedback",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    } else {
      showError("Something Went Wrong");
    }
  }
}
