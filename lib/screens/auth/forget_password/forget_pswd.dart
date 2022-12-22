import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/auth/forget_password/forget_pswd_vm.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
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
            preferredSize:const Size.fromHeight(60.0),
            child: Container(
              decoration: const BoxDecoration(
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
                      color:  Color(0xffFDBA2F),
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
                      "Forgot Password ?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: double.infinity, height: 10),
                    const Text(
                      "Please enter your email id below to receive the Password reset link",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff6B779A)),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Email ID",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    provider.setresend != true
                        ? Form(
                            key: provider.formKey,
                            child: InputField(
                              validation: Validators.email,
                              controller: provider.emailController,
                              hintText: "Enter email address",
                              prefixIcon: const Icon(Icons.email),
                            ),
                          )
                        : IgnorePointer(
                            child: Form(
                              key: provider.formKey,
                              child: InputField(
                                enabletextfield: false,
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
                        child: MaterialButton(
                          onPressed: () {
                            provider.setresend != true
                                ? provider.sendEmail(context)
                                : provider.showError(
                                    "Click Resend Link to send Email again");
                            setState(() {
                              provider.setresend = true;
                            });
                          },
                          color: provider.setresend != true
                              ? const Color(0xffFDBA2F)
                              : const Color(0xffF1F4F7),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: provider.setresend != true
                              ? const Text("Send the Reset Link")
                              : const Text(
                                  "Send the Reset Link",
                                  style: TextStyle(color: Color(0xffD8D8D8)),
                                ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Center(
                              child: Text(
                                "Did not receive the link?",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xffFF7901)),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                //  provider.resendOtp();
                                provider.sendEmail(context);
                              },
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xffFD2FE2)),
                              ),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>const Login()));
                            },
                            child: const Text(
                              "Back to Login",
                              style: TextStyle(
                                  color: Color(0xff6EBFC3), fontSize: 16),
                            ))
                      ],
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
