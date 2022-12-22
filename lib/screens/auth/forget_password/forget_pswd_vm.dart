import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/components/button/button.dart';

import 'package:url_launcher/url_launcher.dart';

class ForgetPasswordVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  bool setresend = false;
  String pin = "";
  final formKey = GlobalKey<FormState>();
  final formKeyOTP = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  //

  Future<void> launchemail(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : const Text("something went wrong");
  }

//send Email
  void sendEmail(BuildContext context) async {
    // setresend = true;
    // notifyListeners();
    if (formKey.currentState!.validate()) {
      FormData formData = FormData();
      formData.fields.addAll([
        const MapEntry("fn", "ForgotPassword"),
        MapEntry("email", emailController.text),
      ]);
      showLoading();
      final response = await api.authRepo.login(formData);

      hideLoading();
      if (response.runtimeType == Response) {
        if (response.data['SUCCESS'] == "TRUE") {
          // Utils.sendEmail(email: emailController.text);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Check your Email',
                    style: TextStyle(
                        color: Color(0xffFDBA2F), fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                      'Reset password Link has been sent to your Email Address'),
                  actions: <Widget>[
                    CustomMaterialButtton(
                        text: "Okay",
                        onPressed: () {
                          setresend = true;
                          notifyListeners();
                          Navigator.pop(context);
                        })
                    // MaterialButton(
                    //   child: const Text(
                    //     'Okay',
                    //     style: TextStyle(color: Color(0xff6EBFC3)),
                    //   ),
                    //   onPressed: () {
                    //     setresend = true;
                    //     notifyListeners();
                    //     Navigator.pop(context);

                    //     // Navigator.push(context,
                    //     //     MaterialPageRoute(builder: (context) => Login()));
                    //     // Utils.openLink(
                    //     //     url:
                    //     //         // 'https://mail.google.com/mail/u/0/?tab=rm#inbox'
                    //     //         'https://outlook.office.com/mail/inbox/id/AAQkADk5ZWEyZmRiLTk2MjYtNDExMi05ZDY0LWYwMDFmY2I2M2U1OQAQANKgIGv7twlJk%2BGmH6KeW10%3D');
                    //   },
                    // ),
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
