import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/review_feedback/feedback.dart';
import 'package:lottie/lottie.dart';
import 'package:wakelock/wakelock.dart';

class CallPageVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
    //wakelock  used prevent phone from locking the screen
    Wakelock.enable();
  }

  //check whether call is end or not
  checkEndCall(String channelName) async {
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("channel_name", channelName),
    ]);
    showLoading();
    final res = await api.menteeRepo.checkEndCall(formData);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
      } else {
        // print("Call is not ");
      }
    } else {
      // print("something went Wrong");
    }
  }

  //checkMeeting time
  // Late MeetingModel? mentor;
  late MeetingModel? mentor;
  String? canLeaveReview;
  checkLeaveReview(String channelName, String userRole, context,
      {bool? callEnd}) async {
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("channel_name", channelName),
    ]);
    showLoading();

    final res = userRole == "mentee"
        ? await api.menteeRepo.checkLeaveReview(formData)
        : await api.mentorRepo.checkLeaveReview(formData);

    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FeedbackPage(mentor: mentor, role: userRole)),
            (route) => false);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (Context) => FeedbackPage(
        //               mentor: mentor,
        //               role: userRole,
        //             )));
        notifyListeners();
      } else {
        Navigator.pop(context);
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
        //     msg: "Your Already submitted your feedback",
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
