import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class UpcommingMeetingMentorVM extends BaseViewModel {
  @override
  void onInit() {
    getConfirmedUpcomingMeeting();
    getSentUpcomingMeeting();
    getreceivedUpcomingMeeting();
  }

//Reschedule
  List<Map> rescheduleCheckbox = [
    {"name": "Schedule clash", "isChecked": false},
    {"name": "Personal reasons", "isChecked": false},
    {
      "name": "Others",
      "isChecked": false,
    },
  ];
  String currText = '';
  TextEditingController about = TextEditingController();

//get UpcomingConfirmed meeting
  List tempconfirmed = [];
  List<MeetingModel> confirmedupcomingmeetings = [];
  void getConfirmedUpcomingMeeting() async {
    showLoading();
    final res = await api.mentorRepo.getConfirmedUpcomingMeeting();
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
      showNotification(res.data['message']);
    }
  }

//get sent upcoming meeting
  List tempsent = [];
  List<MeetingModel> sentUpcomingMeeting = [];
  void getSentUpcomingMeeting() async {
    showLoading();
    final res = await api.mentorRepo.getSentUpcomingMeeting();
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
    final res = await api.mentorRepo.getReceivedUpcomingMeeting();
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
    final res = await api.mentorRepo.acceptMeeting(formData);
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

  TextEditingController cancelReason = TextEditingController();
  List<Map> cancelReasons = [
    {"name": "Schedule clash", "isChecked": false},
    {"name": "Don’t have any issue", "isChecked": false},
    {
      "name": "Personal reasons",
      "isChecked": false,
    },
    {"name": "Others", "isChecked": false},
  ];

  // void cancelMeeting(String channelName, context) async {
  //   FormData formData = FormData();
  //   formData.fields.addAll([
  //     MapEntry("channel_name", channelName),
  //     MapEntry("cancel_reason", currText),
  //     MapEntry("cancel_detail", about.text),
  //   ]);
  //   showLoading();
  //   final res = await api.menteeRepo.cancelMeeting(formData);
  //   if (res.runtimeType == Response) {
  //     if (res.data['status'] == true) {
  //       showNotification(res.data['message']);
  //       Navigator.pop(context);
  //     } else {
  //       showError(res.data['message']);
  //     }
  //   } else {
  //     showError("something went Wrong");
  //   }
  // }

}
