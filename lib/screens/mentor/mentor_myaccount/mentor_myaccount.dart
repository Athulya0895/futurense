import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/home/homepage_mentee.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class MentorMyaccount extends StatefulWidget {
  const MentorMyaccount({super.key});

  @override
  State<MentorMyaccount> createState() => _MentorMyaccountState();
}

class _MentorMyaccountState extends State<MentorMyaccount>
    with BasePage<MentorMyaccountVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
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
                title: Center(
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                        color: const Color(0xffFDBA2F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
                // actions: [
                //   IconButton(
                //       onPressed: () {
                //filter click show dialogue
                // showGeneralDialog(
                //   context: context,
                //   barrierDismissible: true,
                //   transitionDuration: Duration(milliseconds: 500),
                //   barrierLabel:
                //       MaterialLocalizations.of(context).dialogLabel,
                //   barrierColor: Colors.black.withOpacity(0.5),
                //   pageBuilder: (context, _, __) {
                //     return Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: <Widget>[
                //         Container(
                //           width: MediaQuery.of(context).size.width,
                //           // color: Colors.white,
                //           child: Card(
                //             child: Padding(
                //               padding: const EdgeInsets.only(
                //                   left: 15, right: 15),
                //               child: Column(
                //                 children: [
                //                   ListView(
                //                     shrinkWrap: true,
                //                     children: <Widget>[
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment
                //                                 .spaceBetween,
                //                         children: [
                //                           Text(
                //                             "Choose filter",
                //                             style: TextStyles.titleM,
                //                           ),
                //                           IconButton(
                //                               onPressed: () {
                //                                 Navigator.pop(context);
                //                                 // setState(() {
                //                                 //   isSelectedfilter =
                //                                 //       false;
                //                                 // });
                //                                 // provider.filter();
                //                               },
                //                               icon: Icon(Icons.close))
                //                         ],
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       const Text(
                //                         "Key Mentoring Areas",
                //                         style: TextStyle(
                //                           color: Color(0xff9295A3),
                //                         ),
                //                       ),
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       DropDownMenuMode(
                //                         borderRadius: 10,
                //                         selectedItem: "IT",
                //                         hinttext: "	",
                //                         validationText:
                //                             "Please Select your currency type",
                //                         items: const [
                //                           "IT",
                //                           "finanace",
                //                           "sdf",
                //                           "cvb"
                //                         ],
                //                         setdata: (val) {
                //                           // provider.selectedCurrency = val;
                //                           // print(provider.selectedCurrency);
                //                         },
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       Row(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: const [
                //                           Expanded(
                //                               child: Text(
                //                             "Organisation",
                //                             style: TextStyle(
                //                               color: Color(0xff9295A3),
                //                             ),
                //                           )),
                //                           Expanded(
                //                               child: Text(
                //                             "Industry",
                //                             style: TextStyle(
                //                               color: Color(0xff9295A3),
                //                             ),
                //                           ))
                //                         ],
                //                       ),
                //                       const SizedBox(
                //                         height: 5,
                //                       ),
                //                       Row(
                //                         children: [
                //                           Expanded(
                //                               child: DropDownMenuMode(
                //                             borderRadius: 10,
                //                             hinttext: "",
                //                             items: const [
                //                               "asdf",
                //                               "sdfgh",
                //                               ""
                //                             ],
                //                             setdata: () {},
                //                             // controller: provider.yourCity,
                //                             validationText:
                //                                 'please choose your city',
                //                           )),
                //                           const SizedBox(
                //                             width: 10,
                //                           ),
                //                           Expanded(
                //                               child: DropDownMenuMode(
                //                             borderRadius: 10,
                //                             hinttext: "",
                //                             items: const [
                //                               "software engineer",
                //                               "tester",
                //                               "Projecrt Manager"
                //                             ],
                //                             setdata: () {},
                //                             validationText:
                //                                 "please choose jobtitle",
                //                           ))
                //                         ],
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       const Text(
                //                         "Jobtitle",
                //                         style: TextStyle(
                //                           color: Color(0xff9295A3),
                //                         ),
                //                       ),
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       DropDownMenuMode(
                //                         borderRadius: 10,
                //                         selectedItem: "",
                //                         hinttext: "",
                //                         validationText:
                //                             "Please Select jobtitle",
                //                         items: const [
                //                           "Software Engineer",
                //                           "finanace",
                //                           "python",
                //                           "java developer"
                //                         ],
                //                         setdata: (val) {
                //                           // provider.selectedCurrency = val;
                //                           // print(provider.selectedCurrency);
                //                         },
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.end,
                //                         children: [
                //                           MaterialButton(
                //                             shape:
                //                                 RoundedRectangleBorder(
                //                               borderRadius:
                //                                   BorderRadius.circular(
                //                                       10.0),
                //                             ),
                //                             color:
                //                                 const Color(0xffFD2FE2)
                //                                     .withOpacity(0.5),
                //                             onPressed: () {},
                //                             child: const Text(
                //                               "Clear",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                           ),
                //                           const SizedBox(
                //                             width: 10,
                //                           ),
                //                           MaterialButton(
                //                             shape:
                //                                 RoundedRectangleBorder(
                //                               borderRadius:
                //                                   BorderRadius.circular(
                //                                       10.0),
                //                             ),
                //                             color: Color(0xffFDBA2F),
                //                             onPressed: () {},
                //                             child: const Text(
                //                               "ok",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                           ),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                //   transitionBuilder:
                //       (context, animation, secondaryAnimation, child) {
                //     return SlideTransition(
                //       position: CurvedAnimation(
                //         parent: animation,
                //         curve: Curves.easeOut,
                //       ).drive(Tween<Offset>(
                //         begin: Offset(0, -1.0),
                //         end: Offset.zero,
                //       )),
                //       child: child,
                //     );
                //   },
                // );
                //       },
                //       icon: Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             border: Border.all(color: const Color(0xffF1F4F7))),
                //         padding: const EdgeInsets.all(5),
                //         child: Center(
                //           child: const Icon(
                //             Icons.more_vert,
                //             color: Color(0xff979797),
                //           ),
                //         ),
                //       ))
                // ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
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
                    "First Name",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "First Name",
                    // initialval: provider.prefs.user!.mentorName.toString(),
                    controller: provider.firstName,
                    // prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "Last Name",
                    controller: provider.lastName,
                    // prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "email@gmail.com",
                    controller: provider.email,
                    // prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Contact Number",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "Phone Number",
                    controller: provider.phoneNumber,
                    // prefixIcon: const Icon(Icons.phone),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Current company",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMenuMode(
                    borderRadius: 10,
                    selectedItem: "TCS",
                    hinttext: "	",
                    validationText: "Please Select your currency type",
                    items: const ["Tcs", "wipro", "usd", "futurense"],
                    setdata: (val) {
                      // provider.selectedCurrency = val;
                      // print(provider.selectedCurrency);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          "Jobtitle",
                          style: TextStyle(
                            color: Color(0xff202020),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Experience",
                          style: TextStyle(
                            color: Color(0xff202020),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropDownMenuMode(
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
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropDownMenuMode(
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
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "About You",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    maxline: 5,
                    // minline: 1,
                    hintText: "Describe here",
                    controller: provider.about,

                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Linked in Id",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    // maxline: 5,
                    hintText: "type your linkedin id",
                    controller: provider.linkedinid,

                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Divider(
                  //   color: Color(0xffFDBA2F),
                  //   thickness: 1,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Add your Experience",
                  //       style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w600,
                  //           color: Color(0xffFDBA2F)),
                  //     ),
                  //     // SvgPicture.asset("assets/addbutton.svg")
                  //     IconButton(
                  //         onPressed: (() {
                  //           provider.addItemToList();
                  //         }),
                  //         icon: Container(
                  //             padding: EdgeInsets.all(5),
                  //             decoration: BoxDecoration(
                  //                 color: Color(0xffFDBA2F),
                  //                 borderRadius: BorderRadius.circular(5)),
                  //             child: Icon(Icons.add)))
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // const Text(
                  //   "Your experience",
                  //   style: TextStyle(
                  //       color: Color(0xff202020),
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w700),
                  // ),
                  // const SizedBox(height: 5),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     border:
                  //         Border.all(color: Color(0xffA0A2B3).withOpacity(0.5)),
                  //     boxShadow: <BoxShadow>[
                  //       BoxShadow(
                  //         offset: Offset(4, 2),
                  //         blurRadius: 3,
                  //         color: Color(0xffA0A2B3).withOpacity(0.5),
                  //       )
                  //     ],
                  //   ),
                  // ),

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
                  // Center(
                  //     child: CustomMaterialButtton(
                  //   textColor: Colors.white,
                  //   text: "Next",
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => Zoom()));
                  //   },
                  // )
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ZoomMentor()));

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  @override
  MentorMyaccountVM create() => MentorMyaccountVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
