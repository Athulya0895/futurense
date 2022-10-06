import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';

import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';

import 'package:futurensemobileapp/screens/mentee/myaccount/myaccount.dart';
import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference_vm.dart';

import 'package:futurensemobileapp/utils/validators.dart';

class SetPrefrenceMentee extends StatefulWidget {
  const SetPrefrenceMentee({super.key});

  @override
  State<SetPrefrenceMentee> createState() => _SetPrefrenceMenteeState();
}

class _SetPrefrenceMenteeState extends State<SetPrefrenceMentee>
    with BasePage<SetPreferenceMenteeVM> {
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
                  "Set your mentoring type",
                  style: TextStyle(
                      color: const Color(0xffFDBA2F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                // leading: const BackButtonCustom(),
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
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Set your Preferences As Being Mentored",
                    style: TextStyle(
                        color: Color(0xff202020),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Describe what you are looking for from a mentor",
                    style: TextStyle(
                        color: Color(0xff6B779A),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                      maxline: 5,
                      hintText: "Describe what you are looking for",
                      controller: provider.preferenceDescription,
                      // prefixIcon: const Icon(Icons.person),

                      validation: Validators.basic),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Prefered Meeting Type",
                    style: TextStyle(
                        color: Color(0xff6B779A),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropDownMenuMode(
                      borderRadius: 10,
                      hinttext: "Virtual or in Person Meeting",
                      validationText: "",
                      items: const [
                        "Virtual Meeting",
                        "inPerson Meeting",
                        "virtual & PersonalMeeting"
                      ],
                      setdata: () {}),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Which areas are you looking to develop?",
                    style: TextStyle(
                        color: Color(0xff6B779A),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: provider.areaslooking.length,
                        itemBuilder: (BuildContext context, int i) {
                          return CheckboxListTile(
                              activeColor: const Color(0xffFDBA2F),
                              checkColor: Colors.white,
                              value: provider.areaslooking[i]["isChecked"],
                              title: Row(
                                children: [
                                  Text(
                                    provider.areaslooking[i]["name"],
                                    style: const TextStyle(
                                        color: Color(0xff202020),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  provider.areaslooking[i]["isChecked"] =
                                      newValue;
                                });
                              });
                          // return ListTile(
                          //     leading: const Icon(Icons.list),
                          //     trailing: const Text(
                          //       "GFG",
                          //       style: TextStyle(
                          //           color: Colors.green, fontSize: 15),
                          //     ),
                          //     title: Text("List item $index"));
                        }),
                  ),

                  // Column(
                  //     children: provider.areaslooking.map((area) {
                  //   return
                  //    CheckboxListTile(
                  //       activeColor: const Color(0xffFDBA2F),
                  //       checkColor: Colors.white,
                  //       value: area["isChecked"],
                  //       title: Text(
                  //         area["name"],
                  //         style: const TextStyle(
                  //             color: Color(0xff202020),
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           area["isChecked"] = newValue;
                  //         });
                  //       });
                  // }).toList()),
                  const SizedBox(
                    height: 15,
                  ),

                  Center(
                    child: MaterialButton(
                        padding: const EdgeInsets.only(top: 23, bottom: 23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minWidth: MediaQuery.of(context).size.width * 0.7,
                        color: const Color(0xffFDBA2F),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAccount()));
                        }),
                  ),
                  // Center(
                  //     child: CustomMaterialButtton(
                  //   textColor: Colors.white,
                  //   text: "Next",
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => MyAccount()));
                  //   },
                  // )),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  SetPreferenceMenteeVM create() => SetPreferenceMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
