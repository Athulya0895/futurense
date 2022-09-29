import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/auth/forget_password/forget_pswd.dart';

import 'package:futurensemobileapp/screens/auth/login/login_vm.dart';
import 'package:futurensemobileapp/screens/auth/signup/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with BasePage<LoginVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        backgroundColor: Color(0xffFDBA2F),

        // body: Container(
        //   color: Colors.white,
        //   child: Text(provider.userName),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   "assets/logo.svg",
            //   // color: Colors.green,
            // ),
            Image.asset(
              'assets/futurenselogo.png',
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const Text(
            //   "FUTURENSE",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     letterSpacing: 1,
            //     fontSize: 28,
            //   ),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            const Text(
              "Welcomes you to the family!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    15,
                    15,
                    15,
                    50,
                  ),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  // height: 416,
                  // width: 346,
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        // const Text(
                        //   "User Name",
                        //   style: TextStyle(
                        //     color: Color(0xff9295A3),
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter user name';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            provider.userName = val!;
                          },
                          controller: provider.emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              // borderSide: BorderSide.none,

                              borderSide:
                                  const BorderSide(color: Color(0xff6433a0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintText: "User Name",
                            contentPadding: const EdgeInsets.all(15.0),
                            fillColor: const Color(0xffEBF6F7),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: provider.passwordController,
                          obscureText: provider.showPassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // provider.visiblePassword();
                              },
                              icon: Icon(provider.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            fillColor: const Color(0xffEBF6F7),
                            contentPadding: const EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEEEEEE)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            if (value.toString().length < 6) {
                              return 'Password must contain at least six characters!';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            provider.password = newValue!;
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            //forgot password screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()));
                          },
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffFDBA2F)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          color: const Color(0xff6EBFC3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            provider.login(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Does not have account?'),
                            TextButton(
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffFDBA2F)),
                              ),
                              onPressed: () {
                                //signup screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Signup()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginVM create() => LoginVM();

  @override
  void initialise(BuildContext context) {}
}
