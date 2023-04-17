import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FeedbackVM extends BaseViewModel {
  @override
  void onInit() {}

  //rating value
  double? ratingValue;
  //review text
  TextEditingController review = TextEditingController();
//post Feedback
  MeetingModel? mentor;
  String? role;
  void postFeedback(BuildContext context, String? channelName) async {
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("rating", ratingValue.toString()), //get faculty by id
      MapEntry("review", review.text),
      MapEntry("channel_name", channelName!)
    ]);
    showLoading();
    final res = role == "mentee"
        ? await api.menteeRepo.postFeedback(formData, mentor!.userId.toString())
        : await api.mentorRepo.postFeedback(formData, mentor?.userId ?? "");
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        // showNotification(res.data['message']);
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
                        'assets/Rescheduled.json',
                        fit: BoxFit.fill,
                        reverse: true,
                        repeat: false,
                        onLoaded: (value) async {
                          Future.delayed(value.duration).then((value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Home(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero),
                                (route) => false);
                          });
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Feedback Shared Sucessfully!",
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
        role == "mentee"
            ? PersistentNavBarNavigator.pushNewScreen(context,
                screen: const HomeMentee(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino)
            : PersistentNavBarNavigator.pushNewScreen(context,
                screen: const Home(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeMentee()));
      } else {
        // showError(res.data['message']);

        // Fluttertoast.showToast(
        //     msg: "Feedback already given",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        // 'assets/failedsection.json'
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const Home(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero),
                                (route) => false);
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
      }
    } else {
      showError("Server Error");
    }
  }
}
