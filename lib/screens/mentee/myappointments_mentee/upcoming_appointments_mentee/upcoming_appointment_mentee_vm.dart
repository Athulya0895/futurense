import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class UpcomingAppointmentsMenteeVM extends BaseViewModel {
  List tempconfirmed = [];
  List<MeetingModel> confirmedupcomingmeetings = [];
  @override
  void onInit() {
    getConfirmedUpcomingMeeting();
    getSentUpcomingMeeting();
    getreceivedUpcomingMeeting();
    //  final prefs = locator<SharedPrefs>();
    print("useId_____");
    print(prefs.userId);
    //socket Nodejs
    // String url = 'http://13.127.192.123';
    // String url1 = 'http://192.168.69.106:6001';
    // String url2 = 'http://192.168.70.102:6001';
    String url3 = "http://13.127.192.123:6001";

    IO.Socket socket = IO.io(
        url3,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    //socket on userId
    socket.on(prefs.userId.toString(), (data) {
      // print(data);
      // print("received");
      // print(data['received']);
      tempconfirmed = data['confirmed'] ?? [];
      confirmedupcomingmeetings =
          tempconfirmed.map((e) => MeetingModel.fromjson(e)).toList();

      tempsent = data['sent'] ?? [];
      sentUpcomingMeeting =
          tempsent.map((e) => MeetingModel.fromjson(e)).toList();
      tempreceived = data['received'] ?? [];
      receivedUpcomingMeeting =
          tempreceived.map((e) => MeetingModel.fromjson(e)).toList();
      notifyListeners();
    });
    socket.onDisconnect((_) => print('disconnect'));
    socket.onerror((e) => print(e));
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

// get UpcomingConfirmed meeting

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
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Servere Error");
    }
  }
// //test server getconfirmed meeting
//   getConfirmedUpcomingMeeting() async {
//     confirmedupcomingmeetings =
//         tempconfirmed.map((e) => MeetingModel.fromjson(e)).toList();
//     print("confirmedupcomingmeetings");
//     print(confirmedupcomingmeetings);
//     print("confirmedupcomingmeetings");
//   }

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
        notifyListeners();
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
        notifyListeners();
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
        getreceivedUpcomingMeeting();
        getConfirmedUpcomingMeeting();
        getSentUpcomingMeeting();
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
