import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount.dart';
import 'package:futurensemobileapp/screens/mentor/setPreference/setpreference_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class SetPreferenceMentor extends StatefulWidget {
  const SetPreferenceMentor({super.key});

  @override
  State<SetPreferenceMentor> createState() => _SetPreferenceMentorState();
}

class _SetPreferenceMentorState extends State<SetPreferenceMentor>
    with BasePage<SetPreferenceMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
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
                title: Center(
                  child: const Text(
                    "Mentor Preferences",
                    style: TextStyle(
                        color: const Color(0xffFDBA2F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Set your Preferences As Mentor",
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Describe your experience and what you'd like to help memntees with",
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                        hintText:
                            "Use 3-4 sentence to sell yourself as a prospective mentor",
                        controller: provider.preferenceDescription,
                        maxline: 5,
                        // minline: 1,
                        // prefixIcon: const Icon(Icons.person),

                        validation: Validators.basic),
                    const SizedBox(
                      height: 35,
                    ),
                    // const Text(
                    //   "Prefered Meeting Type",
                    //   style: TextStyle(
                    //       color: Color(0xff6B779A),
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 14),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // DropDownMenuMode(
                    //     borderRadius: 10,
                    //     hinttext: "Virtual or in Person Meeting",
                    //     validationText: "",
                    //     items: const [
                    //       "Virtual Meeting",
                    //       "inPerson Meeting",
                    //       "virtual & PersonalMeeting"
                    //     ],
                    //     setdata: () {}),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    // const Text(
                    //   "How many people can you mentor ?",
                    //   style: TextStyle(
                    //       color: Color(0xff6B779A),
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 14),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // DropDownMenuMode(
                    //     borderRadius: 10,
                    //     hinttext: "Virtual or in Person Meeting",
                    //     validationText: "",
                    //     items: const [
                    //       "1 People",
                    //       "2 People",
                    //       "3 People",
                    //       "4 People",
                    //       "5 People",
                    //       "Up to Ten People"
                    //     ],
                    //     setdata: () {}),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const Text(
                      "Where can you offer help and support?",
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),

                    //               ListView(
                    //   shrinkWrap: true,
                    //   children: <Widget>[
                    //     provider.areaslooking.isNotEmpty
                    //         ? Wrap(
                    //             children: provider.areaslooking.map(
                    //               (item) {
                    //                 // var index = _list.indexOf(item);
                    //                 return IntrinsicWidth(
                    //                   child: Container(
                    //                     width: 100,
                    //                     height: 40,
                    //                     child: InkWell(
                    //                       child: Center(
                    //                         child: Row(
                    //                           children: <Widget>[
                    //                             Checkbox(
                    //                                 value: item["isChecked"],
                    //                                 onChanged: ( val) {
                    //                                   setState(() {
                    //                                     selected[index] = val;
                    //                                   });
                    //                                 }),
                    //                             Expanded(child: Text(item.toString())),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 );
                    //               },
                    //             ).toList(),
                    //           )
                    //         : Container(),
                    //   ],
                    // ),
                    // ListView.builder(
                    //     itemCount: provider.areaslooking.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Row(
                    //           children: provider.areaslooking.map((area) {
                    //         return CheckboxListTile(
                    //             activeColor: const Color(0xffFDBA2F),
                    //             checkColor: Colors.white,
                    //             value: area["isChecked"],
                    //             title: Text(
                    //               area["name"],
                    //               style: const TextStyle(
                    //                   color: Color(0xff202020),
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.w500),
                    //             ),
                    //             onChanged: (newValue) {
                    //               setState(() {
                    //                 area["isChecked"] = newValue;
                    //               });
                    //             });
                    //       }).toList());
                    //       // return ListTile(
                    //       //     leading: const Icon(Icons.list),
                    //       //     trailing: const Text(
                    //       //       "GFG",
                    //       //       style: TextStyle(
                    //       //           color: Colors.green, fontSize: 15),
                    //       //     ),
                    //       //     title: Text("List item $index"));
                    //     }),

                    Wrap(
                        children: provider.areaslooking.map((area) {
                      return MaterialButton(
                        onPressed: () => setState(
                            () => area["isChecked"] = !area["isChecked"]),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: Checkbox(
                                value: area["isChecked"],
                                onChanged: (value) {
                                  setState(() => area["isChecked"] = value);
                                },
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              area["name"],
                            )
                          ],
                        ),
                      );
                      return CheckboxListTile(
                          // contentPadding: EdgeInsets.zero,
                          activeColor: const Color(0xffFDBA2F),
                          checkColor: Colors.white,
                          value: area["isChecked"],
                          title: Text(
                            area["name"],
                            style: const TextStyle(
                                color: Color(0xff202020),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              area["isChecked"] = newValue;
                            });
                          });
                    }).toList()),
                    const SizedBox(
                      height: 15,
                    ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MentorMyaccount()));
                        })
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  @override
  SetPreferenceMentorVM create() => SetPreferenceMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
