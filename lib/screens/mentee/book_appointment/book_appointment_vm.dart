import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class BookAppointmentVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  TextEditingController problemDetail = TextEditingController();
  final List<Map> timeslote = List.generate(
      5,
      (index) => {
            "timeslot1": "09:00 AM",
          }).toList();
}
