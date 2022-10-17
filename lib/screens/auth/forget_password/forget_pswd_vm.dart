import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:futurensemobileapp/utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgetPasswordVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  bool enterOtpScreen = false;
  String pin = "";
  final formKey = GlobalKey<FormState>();
  final formKeyOTP = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  //

  Future<void> launchemail(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : Text("something went wrong");
  }

//send Email
  void sendEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      FormData formData = FormData();
      formData.fields.addAll([
        const MapEntry("fn", "ForgotPassword"),
        MapEntry("email", emailController.text),
      ]);
      showLoading();
      final response = await api.authRepo.login(formData);
      print(response);
      hideLoading();
      if (response.runtimeType == Response) {
        print("response");
        if (response.data['SUCCESS'] == "TRUE") {
          print("true");
          // Utils.sendEmail(email: emailController.text);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Done'),
                  content:
                      Text('To reset Password Link is sent your email address'),
                  actions: <Widget>[
                    MaterialButton(
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Login()));
                        Utils.openLink(
                            url:
                                // 'https://mail.google.com/mail/u/0/?tab=rm#inbox'
                                'https://outlook.office.com/mail/inbox/id/AAQkADk5ZWEyZmRiLTk2MjYtNDExMi05ZDY0LWYwMDFmY2I2M2U1OQAQANKgIGv7twlJk%2BGmH6KeW10%3D');
                      },
                    ),
                  ],
                );
              });
        } else {
          showError(response.data['MESSAGE']);
        }
      } else {
        showError("Something went wrong");
      }
    }
  }

  // void validateOtp(BuildContext context) async {
  //   showLoading();
  //   Map<String, dynamic> body = {
  //     "email": emailController.text,
  //     "otp": otpController.text.toString()
  //   };
  //   hideLoading();
  //   Response res =
  //       await api.authRepo.forgetPasswordValidateEmail(jsonEncode(body));
  //   if (res.data['success'] == true) {
  //     prefs.token = res.data['access'];
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ConfirmPassword(email: emailController.text),
  //       ),
  //     );
  //   } else {
  //     showError("incorrect pin");
  //   }
  // }

  //resend otp
  resendOtp() async {
    showLoading();
    // Map<String, dynamic> body = {"email": emailController.text};
    // Response res = await api.authRepo.forgetPasswordSendEmail(jsonEncode(body));
    // hideLoading();
    // if (res.data['success'] == true) {
    //   showNotification("OTP send to your email");
    //   // enterOtpScreen = true;
    //   // notifyListeners();
    // } else {
    //   showError(res.data['message'] ?? "");
    // }
  }
}
