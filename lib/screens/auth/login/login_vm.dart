import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';

import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference.dart';

class LoginVM extends BaseViewModel {
  @override
  void onInit() {}

  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  String userName = '';
  String password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  showVisiblePassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

//  void login(BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       showLoading();
//       String body = jsonEncode({
//         "email": emailController.text,
//         "password": passwordController.text,
//         "phone_1": mobileController.text
//       });
//       Response response = await api.authRepo.login(body);
//       hideLoading();
//       if (response.data['success'] == true) {
//         prefs.token = response.data['access'];
//         prefs.user = User.fromJson(response.data['user_details']);
//         // prefs.token = response.data['refresh'];
//         prefs.userType = "1";
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => const UserHome()),
//             (route) => false);
//       } else {
//         showError(response.data['message']);
//       }
//     }
//   }



  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      FormData formData = FormData();
      formData.fields.addAll([
        const MapEntry("fn", "Login"),
        const MapEntry("key", "tR3PYbcVNZZ796tH88S4VQ2"),
        MapEntry("username", emailController.text),
        MapEntry("password", passwordController.text),
      ]);
      showLoading();
      final response = await api.authRepo.login(formData);
      print(response);
      hideLoading();
      if (response.runtimeType == Response) {
        print("response");
        if (response.data['STATUS'] == "SUCCESS") {
          print("true");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SetPreference()),
              (route) => false);
        } else {
          showError(response.data['MESSAGE']);
        }
      } else {
        showError("Something went wrong");
      }
    }
  }


}
