import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class CancelledAppointmentsMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    getcancelMeetings();
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
  List tempCancel = [];
  List<MeetingModel> cancelMeetings = [];
  void getcancelMeetings() async {
    showLoading();
    final res = await api.menteeRepo.getCancelledMeetings();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempCancel = res.data['DATA'] ?? [];
        cancelMeetings =
            tempCancel.map((e) => MeetingModel.fromjson(e)).toList();
        // print("cancelMeetings");
        // print(cancelMeetings);
        // print("cancelMeetings");
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Servere Error");
    }
  }
}
