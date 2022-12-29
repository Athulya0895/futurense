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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
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
                  "Mentee Preferences",
                  style: TextStyle(
                      color: const Color(0xffFDBA2F),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
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
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 40),
            child: Form(
              key: provider.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Set your preferences as Mentee",
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Please mention what kind of mentorship you want",
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                        hintText:
                            "e.g., Career advice, Interview trainings, Technical discussions, Mental well being, etc.",
                        controller: provider.preferenceDescription,
                        maxline: 5,
                        // minline: 1,
                        // prefixIcon: const Icon(Icons.person),

                        validation: Validators.basic),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Which areas are you looking to get support in?",
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        provider.areaslooking.isNotEmpty
                            ? Wrap(
                                children: provider.areaslooking
                                    .map(
                                      (area) => IntrinsicWidth(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          child: InkWell(
                                            child: Center(
                                              child: Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                    activeColor:
                                                        Color(0xffFDBA2F),
                                                    value: area["isChecked"],
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          area["isChecked"] =
                                                              value);
                                                    },
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    area["name"],
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Container(),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        padding: const EdgeInsets.only(bottom: 15, top: 15),
                        minWidth: double.infinity,
                        color: const Color(0xffFDBA2F),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          print("pressed");
                          if (provider.formKey.currentState!.validate()) {
                            if (provider.areaslooking.any(
                                (element) => element.values.contains(true))) {
                              print("yes");
                              provider.UpdateMenteePreference(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MentorMyaccount()));
                            } else {
                              SnackBar(
                                  content: Text("select atleast one checkbox"));
                            }
                          }
                        
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
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
