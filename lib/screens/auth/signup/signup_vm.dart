import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class SignupVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
}
