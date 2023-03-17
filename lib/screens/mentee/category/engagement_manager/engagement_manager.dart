import 'package:flutter/material.dart';


import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';


import 'package:futurensemobileapp/screens/mentee/category/engagement_manager/engagement_manager_vm.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';

class EngagementManager extends StatefulWidget {
  const EngagementManager({super.key});

  @override
  State<EngagementManager> createState() => _EngagementManagerState();
}

class _EngagementManagerState extends State<EngagementManager>
    with BasePage<EngagementManagerVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
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
                title:const Text(
                  "Engagement Sessions",
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
            padding:const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: SingleChildScrollView(physics:const BouncingScrollPhysics(),

              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("Hello Mahmudul !n \n")
                  // RichText(
                  //   text: const TextSpan(
                  //       text: 'Hello Mahmudul !',
                  //       style:
                  //           TextStyle(color: Color(0xff202020), fontSize: 18),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //           text: '\nBellamy is your Engagement Manager',
                  //           style: TextStyle(
                  //               color: Color(0xff6B779A), fontSize: 18),
                  //         ),
                  //         TextSpan(
                  //           text:
                  //               '\n\n Now, you can connect with your manager for any support queries & other issues ',
                  //           style: TextStyle(
                  //               color: Color(0xff6B779A), fontSize: 18),
                  //         )
                  //       ]),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: provider.topEngagementmanager.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MentorDetails(
                                          topmentor: provider
                                              .topEngagementmanager[index],
                                        )));
                          }),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color:const Color(0xffFFD551),
                                  width: 1,
                                  style: BorderStyle.solid),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset:const Offset(4, 2),
                                  blurRadius: 3,
                                  color:
                                      const Color(0xffA0A2B3).withOpacity(0.5),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: cross,
                              children: [
                                ProfileImage(url:provider
                                    .topEngagementmanager[index].profilePic),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${provider.topEngagementmanager[index].fName.toString()} ${provider.topEngagementmanager[index].lName.toString()}",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Engagement manager",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      provider.topEngagementmanager[index]
                                              .email ??
                                          "email@123",
                                      style:const TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                   const Text(
                                      "+91 2299833399",
                                      style: TextStyle(fontSize: 10),
                                    ),

                                    // Text(details)
                                  ],
                                ),
                                // Expanded(
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.end,
                                //     children: [
                                //       SvgPicture.asset("assets/messageimg.svg")
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        );
                      }),

                  // Center(
                  //   child: MaterialButton(
                  //       minWidth: MediaQuery.of(context).size.width * 0.7,
                  //       padding: const EdgeInsets.only(top: 15, bottom: 15),
                  //       child: const Text("Schedule Meeting ->"),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       textColor: Colors.white,
                  //       color: const Color(0xffFDBA2F),
                  //       onPressed: () {
                  //         // Navigator.push(
                  //         //     context,
                  //         //     MaterialPageRoute(
                  //         //         builder: (Context) =>
                  //         //             BookAppointmentMentor(
                  //         //               mentor: widget.topmentor,
                  //         //             )));
                  //       }),
                  // ),
                  SizedBox(
                      width: double.infinity,
                      // height: ,
                      child: Image.asset(
                        "assets/officemeet.png",
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
          ),
        )));
  }

  @override
  EngagementManagerVM create() => EngagementManagerVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
