import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

class HomePageMentorVM extends BaseViewModel {
  @override
  void onInit() {
    getUserDetails();
    user = prefs.user;
    getConfirmedUpcomingMeeting();
    getTopMentees();
  }

//reschedule
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
  //get topMentees

  List tempmenteeList = [];
  List<MentorModel> topMenteeList = [];
  void getTopMentees() async {
    print("aaabbccdd");
    showLoading();
    final res = await api.mentorRepo.getTopMentees();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        print("length");
        tempmenteeList = res.data['DATA'] as List;
        topMenteeList =
            tempmenteeList.map((e) => MentorModel.fromjson(e)).toList();
        print(topMenteeList.length);
        print("length");
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("servere Error");
    }
  }

// getuser
//get userdetails
  UserModel? user;
  String? data;
  void getUserDetails() async {
    FormData formData = FormData();
    formData.fields.addAll([
      const MapEntry("fn", "GetAllFacultyById"), //get faculty by id
      const MapEntry("key", "F9U6R9EAN8S98E"),
      MapEntry("user_id", prefs.userId.toString()),
    ]);
    showLoading();
    final res = await api.mentorRepo.getMentor(formData);
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      print("true response");
      if (res.data["status"] == true) {
        final data = res.data['data'];
        // user = UserModel.fromJson(data);
        // print("pref user");
        // print(user);
        // print("prefs user");
        if (data?.isNotEmpty == true) {
          print("not empty");
          user = UserModel.fromJson(data);
          notifyListeners();
          prefs.user = user;
          print("pref user");
          print(user);
          print("prefs user");
        }
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }

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
      showError("Servere Error");
    }
  }
}
