import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

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

//send Email
  void sendEmail() async {
    if (formKey.currentState!.validate()) {
      showLoading();
      Map<String, dynamic> body = {"email": emailController.text};
      Response res = true as Response;
      // await api.authRepo.forgetPasswordSendEmail(jsonEncode(body));
      hideLoading();
      if (res.data['success'] == true) {
        enterOtpScreen = true;
        notifyListeners();
      } else {
        showError(res.data['message'] ?? "");
      }
    }
  }

  void validateOtp(BuildContext context) async {
    showLoading();
    Map<String, dynamic> body = {
      "email": emailController.text,
      "otp": otpController.text.toString()
    };
    hideLoading();
    // Response res =
    //     await api.authRepo.forgetPasswordValidateEmail(jsonEncode(body));
    // if (res.data['success'] == true) {
    //   prefs.token = res.data['access'];
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ConfirmPassword(email: emailController.text),
    //     ),
    //   );
    // } else {
    //   showError("incorrect pin");
    // }
  }

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
