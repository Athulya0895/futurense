import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

class HomePageMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    getUserDetails();
    user = prefs.user;
    getCategory();
    getConfirmedUpcomingMeeting();
    getTopMentors();
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
//get categories
  List? category;
  void getCategory() async {
    showLoading();
    final res = await api.menteeRepo.getCategory();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        category = res.data['DATA'];
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("Data is not coming from backend");
    }
    notifyListeners();
  }

//get Top MentorList
  List tempmentorList = [];
  List<MentorModel> topMentorList = [];
  void getTopMentors() async {
    showLoading();
    final res = await api.menteeRepo.getTopMentors();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempmentorList = res.data['DATA'] as List;
        topMentorList =
            tempmentorList.map((e) => MentorModel.fromjson(e)).toList();

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

    hideLoading();
    if (res.runtimeType == Response) {
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
}
