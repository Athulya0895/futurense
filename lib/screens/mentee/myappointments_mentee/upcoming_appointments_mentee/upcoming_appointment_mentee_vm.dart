import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class UpcomingAppointmentsMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    getConfirmedUpcomingMeeting();
    getSentUpcomingMeeting();
    getreceivedUpcomingMeeting();
  }

  List<Map> cancelCheckbox = [
    {"name": "Schedule clash", "isChecked": false},
    {"name": "Personal reasons", "isChecked": false},
    {
      "name": "Others",
      "isChecked": false,
    },
  ];
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
  List tempconfirmed = [];
  List<MeetingModel> confirmedupcomingmeetings = [];
   getConfirmedUpcomingMeeting() async {
    showLoading();
    final res = await api.menteeRepo.getConfirmedUpcomingMeeting();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempconfirmed = res.data['DATA'] ?? [];
        confirmedupcomingmeetings =
            tempconfirmed.map((e) => MeetingModel.fromjson(e)).toList();
        print("confirmedupcomingmeetings");
        print(confirmedupcomingmeetings);
        print("confirmedupcomingmeetings");
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Servere Error");
    }
  }

//get sent upcoming meeting
  List tempsent = [];
  List<MeetingModel> sentUpcomingMeeting = [];
   getSentUpcomingMeeting() async {
    showLoading();
    final res = await api.menteeRepo.getSentUpcomingMeeting();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempsent = res.data['DATA'] ?? [];
        sentUpcomingMeeting =
            tempsent.map((e) => MeetingModel.fromjson(e)).toList();
        print("sentUpcomingMeeting");
        print(sentUpcomingMeeting);
        print("sentUpcomingMeeting");
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Servere Error");
    }
  }

//get Received upcoming meeting
  List tempreceived = [];
  List<MeetingModel> receivedUpcomingMeeting = [];
   getreceivedUpcomingMeeting() async {
    showLoading();
    final res = await api.menteeRepo.getReceivedUpcomingMeeting();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempreceived = res.data['DATA'] ?? [];
        receivedUpcomingMeeting =
            tempreceived.map((e) => MeetingModel.fromjson(e)).toList();
        print("receivedUpcomingMeeting");
        print(receivedUpcomingMeeting);
        print("receivedUpcomingMeeting");
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Server Error");
    }
  }

//Accept meetingrequest from mentor
  void acceptMeeting(String channelName) async {
    FormData formData = FormData();
    formData.fields.addAll([MapEntry("channel_name", channelName)]);
    showLoading();
    final res = await api.menteeRepo.acceptMeeting(formData);
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        showNotification(res.data['message']);
      } else {
        showNotification(res.data['message']);
      }
    } else {
      showError("Something went wrong");
    }
  }

  //cancel Meeting

  void cancelMeeting(String channelName, context) async {
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("channel_name", channelName),
      MapEntry("cancel_reason", currText),
      MapEntry("cancel_detail", about.text),
    ]);
    showLoading();
    final res = await api.menteeRepo.cancelMeeting(formData);
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        showNotification(res.data['message']);
        Navigator.pop(context);
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("something went Wrong");
    }
  }
}
