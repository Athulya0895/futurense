import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class UpcommingMeetingMentorVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
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
}
