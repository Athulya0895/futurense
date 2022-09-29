import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class SetPreferenceVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  final formKey = GlobalKey<FormState>();
  TextEditingController preferenceDescription = TextEditingController();
  // Generate a list of available hobbies here

  List<Map> areaslooking = [
    {"name": "Interview", "isChecked": false},
    {"name": "Java", "isChecked": false},
    {
      "name": "Python",
      "isChecked": false,
    },
    {"name": "Sql", "isChecked": false},
    {"name": "Surfling The Internet", "isChecked": false}
  ];
}
