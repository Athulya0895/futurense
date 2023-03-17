import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';


import 'package:futurensemobileapp/components/button/button.dart';

import 'package:futurensemobileapp/components/input/input_field.dart';


import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference_vm.dart';

import 'package:futurensemobileapp/utils/validators.dart';

class SetPrefrenceMentee extends StatefulWidget {
  const SetPrefrenceMentee({super.key});

  @override
  State<SetPrefrenceMentee> createState() => _SetPrefrenceMenteeState();
}

class _SetPrefrenceMenteeState extends State<SetPrefrenceMentee>
    with BasePage<SetPreferenceMenteeVM> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          key: _scaffoldKey,
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
                centerTitle: true,
                title: const Text(
                  "Mentee Preferences",
                  style: TextStyle(
                      color:  Color(0xffFDBA2F),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
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
                          color: Color(0xff222B45),
                          fontWeight: FontWeight.w600,
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
                          fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                        hintText:
                            "Career advice, Interview trainings, Technical discussions, Mental well being, etc.",
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
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView(
                      physics:const NeverScrollableScrollPhysics(),
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
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0))),
                                                    activeColor:
                                                      const  Color(0xffFDBA2F),
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
                                                    style:const TextStyle(
                                                        // height: 1.5,
                                                        fontSize: 14),
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
                    const SizedBox(
                      height: 25,
                    ),
                    CustomMaterialButtton(
                        textColor: Colors.white,
                        text: "Next",
                        onPressed: () {
                          if (provider.formKey.currentState!.validate()) {
                            if (provider.areaslooking.any(
                                (element) => element.values.contains(true))) {
                              // print("yes");
                              provider.UpdateMenteePreference(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MentorMyaccount()));
                            } else {
                              const SnackBar(
                                  content: Text("select atleast one checkbox"));
                            }
                          }
                        }),
                    // MaterialButton(
                    //     shape: const RoundedRectangleBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(15.0))),
                    //     padding: const EdgeInsets.only(bottom: 15, top: 15),
                    //     minWidth: double.infinity,
                    //     color: const Color(0xffFDBA2F),
                    //     child: const Text(
                    //       "Next",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w700),
                    //     ),
                    //     onPressed: () {
                    //       print("pressed");
                    //       if (provider.formKey.currentState!.validate()) {
                    //         if (provider.areaslooking.any(
                    //             (element) => element.values.contains(true))) {
                    //           print("yes");
                    //           provider.UpdateMenteePreference(context);
                    //           // Navigator.push(
                    //           //     context,
                    //           //     MaterialPageRoute(
                    //           //         builder: (context) => MentorMyaccount()));
                    //         } else {
                    //           SnackBar(
                    //               content: Text("select atleast one checkbox"));
                    //         }
                    //       }

                    //     }),
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
