import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:futurensemobileapp/base/base_page.dart';
// import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/auth/forget_password/forget_pswd.dart';

import 'package:futurensemobileapp/screens/auth/login/login_vm.dart';

import 'package:futurensemobileapp/utils/validators.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with BasePage<LoginVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Container(
              padding:const EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xffFDBA2F),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    // child: Image.asset("assets/bg.png"),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          'assets/futurenselogo.png',
                          width: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Welcome back to the family!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Image.asset(
                  //   'assets/box.png',
                  //   width: 120,
                  // ),
                  Center(
                    child: Container(
                      padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin:const EdgeInsets.only(left: 10, right: 10, top: 0),
                      // height: MediaQuery.of(context).size.height * 0.5,
                      // width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Color(0xffEBF6F7),
                          )
                        ],
                      ),
                      child: Form(
                        key: provider.formKey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Email Id",
                                style: TextStyle(
                                    color: Color(0xff202020), fontSize: 16),
                              ),
                              const SizedBox(height: 7),
                              InputField(
                                hintText: "name@futurense.com",
                                controller: provider.emailController,
                                maxline: 1,
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Color(0xff6EBFC3),
                                ),
                                validation: Validators.email,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              const Text(
                                "Password",
                                style: TextStyle(
                                    color: Color(0xff202020), fontSize: 16),
                              ),
                              const SizedBox(height: 7),
                              InputField(
                                textInputType: TextInputType.visiblePassword,
                                maxline: 1,
                                validation: Validators.password,
                                hintText: "Password",
                                controller: provider.passwordController,
                                obscureText: !provider.showPassword,
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  color: Color(0xff6EBFC3),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.changeShowPassword();
                                  },
                                  icon: Icon(provider.showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    color: const Color(0xff6EBFC3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    onPressed: () {
                                      provider.login(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Get in',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SvgPicture.asset(
                                          "assets/forward.svg",
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffFF7901),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),

                  // Positioned(
                  //   top: 560,
                  //   right: 120,
                  //   bottom: 48,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const ForgetPassword(),
                  //         ),
                  //       );
                  //     },
                  //     child: Column(
                  //       children: const [
                  //         Text(
                  //           'Forgot Password ?',
                  //           style:
                  //               TextStyle(fontSize: 14, color: Color(0xffFF7901)),
                  //         ),
                  //         Divider(
                  //           color: Color(0xffFDBA2F),
                  //           thickness: 1,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginVM create() => LoginVM();

  @override
  void initialise(BuildContext context) {}
}
