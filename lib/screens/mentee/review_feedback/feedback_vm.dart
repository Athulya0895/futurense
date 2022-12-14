import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';
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
        showNotification(res.data['message']);
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
        showError(res.data['message']);
      }
    } else {
      showError("Server Error");
    }
  }
}
