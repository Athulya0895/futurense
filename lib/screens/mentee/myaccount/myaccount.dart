import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/mentee/home/homepage_mentee.dart';

import 'package:futurensemobileapp/screens/mentee/myaccount/myaccount_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> with BasePage<MyAccountVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(
                  color: const Color(0xff777A95).withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            leading: const BackButtonCustom(),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: const Color(0xff6EBFC3).withOpacity(0.2),
                              shape: BoxShape.circle
                              // borderRadius: BorderRadius.circular(40)
                              ),
                          child: SvgPicture.asset("assets/myaccount.svg"),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset("assets/camera.svg")),
                      )
                      // Positioned(
                      //     bottom: -25,
                      //     left: 165,
                      //     child: SvgPicture.asset("assets/camera.svg"))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "First Name",
                    controller: provider.firstName,
                    prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "Last Name",
                    controller: provider.lastName,
                    prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Email id",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "email@gmail.com",
                    controller: provider.lastName,
                    prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "Phone Number",
                    controller: provider.phoneNumber,
                    prefixIcon: const Icon(Icons.phone),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Your Industry",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMenuMode(
                    borderRadius: 10,
                    selectedItem: "IT",
                    hinttext: "	",
                    validationText: "Please Select your currency type",
                    items: const ["IT", "finanace", "sdf", "cvb"],
                    setdata: (val) {
                      // provider.selectedCurrency = val;
                      // print(provider.selectedCurrency);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Jobtitle",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropDownMenuMode(
                    borderRadius: 10,
                    hinttext: "",
                    items: const [
                      "software engineer",
                      "tester",
                      "Projecrt Manager"
                    ],
                    setdata: () {},
                    validationText: "please choose jobtitle",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "About You",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    maxline: 5,
                    minline: 1,
                    hintText: "Describe here",
                    controller: provider.about,
                    prefixIcon: const Icon(Icons.details),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Current Company",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    maxline: 5,
                    minline: 1,
                    hintText: "Describe here",
                    controller: provider.about,
                    prefixIcon: const Icon(Icons.details),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Industry Expertise",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMenuMode(
                    borderRadius: 10,
                    selectedItem: "IT",
                    hinttext: "	",
                    validationText: "Please Select your currency type",
                    items: const ["IT", "finanace", "sdf", "cvb"],
                    setdata: (val) {
                      // provider.selectedCurrency = val;
                      // print(provider.selectedCurrency);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Linked in Id",
                    style: TextStyle(
                      color: Color(0xff9295A3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    // maxline: 5,
                    hintText: "type your linkedin id",
                    controller: provider.linkedinid,
                    prefixIcon: const Icon(Icons.details_outlined),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Color(0xffFDBA2F),
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add your Experience",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFDBA2F)),
                      ),
                      // SvgPicture.asset("assets/addbutton.svg")
                      IconButton(
                          onPressed: (() {
                            provider.addItemToList();
                          }),
                          icon: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xffFDBA2F),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(Icons.add)))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Your experience",
                    style: TextStyle(
                        color: Color(0xff202020),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(color: Color(0xffA0A2B3).withOpacity(0.5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(4, 2),
                          blurRadius: 3,
                          color: Color(0xffA0A2B3).withOpacity(0.5),
                        )
                      ],
                    ),
                  ),

                  // InputField(
                  //   maxline: 5,
                  //   minline: 1,
                  //   hintText: "type your Experience",
                  //   controller: provider.experience,
                  //   prefixIcon: const Icon(Icons.details_outlined),
                  //   validation: Validators.basic,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   height: 100,
                  //   child: ListView.builder(
                  //       padding: const EdgeInsets.all(8),
                  //       itemCount: provider.experienceList.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Container(
                  //           height: 50,
                  //           margin: const EdgeInsets.all(2),
                  //           child: Text(
                  //             '${provider.experienceList[index]} ',
                  //             style: const TextStyle(fontSize: 14),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  MaterialButton(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minWidth: double.infinity,
                      color: const Color(0xffFDBA2F),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Zoom()));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  MyAccountVM create() => MyAccountVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
