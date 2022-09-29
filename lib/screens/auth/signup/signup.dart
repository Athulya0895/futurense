import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:futurensemobileapp/screens/auth/signup/signup_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with BasePage<SignupVM> {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Data';

  // Group Value for Radio Button.
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Registration Page",
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButtonCustom(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Visibility(
            // visible: provider.currentScreen == Screens.detailsScreen,
            child: SingleChildScrollView(
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: double.infinity, height: 20),
                    const Center(
                      child: Text(
                        "Join free to find Mentor or Become Mentor",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: double.infinity, height: 5),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Select your expertise",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: id,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xffFDBA2F)),
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Data',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xffFDBA2F)),
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 2;
                            });
                          },
                        ),
                        const Text(
                          'Java',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "FirstName",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "First Name",
                        controller: provider.firstNameController,
                        prefixIcon: const Icon(Icons.person),
                        validation: Validators.basic),
                    const SizedBox(height: 20),
                    const Text(
                      "LastName",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                        hintText: "Last Name",
                        controller: provider.lastNameController,
                        prefixIcon: const Icon(Icons.person),
                        validation: Validators.basic),
                    const SizedBox(height: 20),
                    const Text(
                      "Mobile",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: "Mobile",
                      controller: provider.emailController,
                      prefixIcon: const Icon(Icons.phone),
                      validation: Validators.mobile,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Email",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: "Email",
                      controller: provider.emailController,
                      prefixIcon: const Icon(Icons.email),
                      validation: Validators.email,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "JobTitle",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: "Jobtitle",
                      controller: provider.emailController,
                      prefixIcon: const Icon(Icons.abc_sharp),
                      validation: Validators.email,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Country",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: "Country",
                      controller: provider.emailController,
                      prefixIcon: const Icon(Icons.location_city),
                      validation: Validators.email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Town/City",
                      style: TextStyle(
                        color: Color(0xff9295A3),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: "Town/City",
                      controller: provider.emailController,
                      prefixIcon: const Icon(Icons.location_city),
                      validation: Validators.email,
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      color: const Color(0xff202020),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  @override
  SignupVM create() => SignupVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
