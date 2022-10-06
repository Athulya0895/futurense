import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class MentorMyaccountVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  //data storing
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController yourIndustry = TextEditingController();
  TextEditingController yourCity = TextEditingController();
  TextEditingController jobtitle = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController linkedinid = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController industryexpertise = TextEditingController();

//LIST for adding multiple experience
  final List<String> experienceList = <String>[];
  //to add multiple item to list
  void addItemToList() {
    experienceList.insert(0, experience.text);
    notifyListeners();
  }
}
