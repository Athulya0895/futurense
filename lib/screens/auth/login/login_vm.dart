

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

import 'package:futurensemobileapp/screens/mentee/home/home/home.dart';

import 'package:futurensemobileapp/screens/mentee/myaccount/myaccount.dart';

import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';

import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount.dart';

class LoginVM extends BaseViewModel {
  String? deviceId;
  @override
  void onInit() {}

  final formKey = GlobalKey<FormState>();
  bool showPassword = false;
  String userName = '';
  String password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void changeShowPassword() {
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
    await Firebase.initializeApp();
    // print("firebase message");
    String? deviceId = await FirebaseMessaging.instance.getToken();
    // print("firebase message1");
    if (formKey.currentState!.validate()) {
      FormData formData = FormData();
      formData.fields.addAll([
        const MapEntry("fn", "Login"),
        const MapEntry("key", "tR3PYbcVNZZ796tH88S4VQ2"),
        MapEntry("username", emailController.text),
        MapEntry("password", passwordController.text),
        MapEntry("device_id", deviceId!)
      ]);
      showLoading();
      final response = await api.authRepo.login(formData);

      hideLoading();
      if (response.runtimeType == Response) {
        if (response.data['SUCCESS'] == "TRUE") {
          prefs.token = response.data['TOKEN'];
          prefs.userId = response.data['DATA']['ID'];
          prefs.userType = response.data['ROLE'];
          //  prefs.user = UserModel.fromJson(response.data['data']['user']);

          prefs.role = response.data['ROLE'] == "MENTORS";

          prefs.firsttimeLogin != true
              ? response.data['ROLE'] == "MENTORS"
                  ? Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MentorMyaccount(
                                fromLogin: true,
                              )),
                      (route) => false)
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SetPreferenceMentor()),
                  //     (route) => false)
                  : Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAccount(
                                fromLogin: true,
                              )),
                      (route) => false)
              : response.data['ROLE'] == "MENTORS"
                  ? Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                      (route) => false)
                  : Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeMentee()),
                      (route) => false);
        } else {
          showError(response.data['MESSAGE'] ?? "Login failed");
        }
      } else {
        showError(response.data['MESSAGE']);
      }
    }
  }
}
