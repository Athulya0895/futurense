import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class PreviousMeetingMentorVM extends BaseViewModel {
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
    final res = await api.mentorRepo.getPreviousMeetings();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempprevious = res.data['DATA'] ?? [];
        previousMeetings =
            tempprevious.map((e) => MeetingModel.fromjson(e)).toList();
        print("previousMeetings");
        print(previousMeetings);
        print("previousMeetings");
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Servere Error");
    }
  }
}
