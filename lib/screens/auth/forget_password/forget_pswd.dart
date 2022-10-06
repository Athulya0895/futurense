import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/auth/forget_password/forget_pswd_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';
import 'package:pinput/pinput.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with BasePage<ForgetPasswordVM> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffFFD680),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: AppBar(
                title: const Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: const Color(0xffFDBA2F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: double.infinity, height: 40),
                    const Text(
                      "forget Password ?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: double.infinity, height: 10),
                    const Text(
                      "Please enter your email id below to recive your OTP number.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff6B779A)),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      !provider.enterOtpScreen
                          ? "Email address "
                          : "please enter verification",
                      style: const TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: !provider.enterOtpScreen,
                      replacement: Form(
                        key: provider.formKeyOTP,
                        child: Pinput(
                          defaultPinTheme: defaultPinTheme.copyDecorationWith(
                              color: Colors.white),
                          focusedPinTheme: defaultPinTheme
                              .copyDecorationWith(
                                color: Colors.white,
                                border: Border.all(color: Colors.orange),
                                borderRadius: BorderRadius.circular(8),
                              )
                              .copyWith(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: const Color.fromARGB(255, 218, 226, 233),
                            ),
                          ),
                          controller: provider.otpController,
                          length: 6,
                          // validator: provider.verfyOTP,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onChanged: (val) {
                            provider.pin = val;
                          },
                        ),
                      ),
                      child: Form(
                        key: provider.formKey,
                        child: InputField(
                          validation: Validators.email,
                          controller: provider.emailController,
                          hintText: "Enter email address",
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                        height: 56,
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: double.infinity,
                        child: Visibility(
                          visible: !provider.enterOtpScreen,
                          child: MaterialButton(
                            child: const Text("Send the Verification Code"),
                            onPressed: () {
                              provider.sendEmail();
                            },
                            color: const Color(0xffFDBA2F),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          replacement: MaterialButton(
                            child: const Text("Verify"),
                            onPressed: () {
                              provider.validateOtp(context);
                            },
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        )),
                    Visibility(
                      // visible: provider.enterOtpScreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Did not receive verification code?",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.resendOtp();
                            },
                            child: const Text(
                              "Resend",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  ForgetPasswordVM create() => ForgetPasswordVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
