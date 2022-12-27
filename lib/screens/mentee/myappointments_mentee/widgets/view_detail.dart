import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class ViewDetail extends StatelessWidget {
  final MeetingModel? meetingDetails;
  final String? buttonText1;
  final String? buttonText2;
  final Function? buttonText1pressed;
  final Function? buttonText2pressed;
  final String? url;
  final Function? iconbuttonPressed;
  final String? icon;
  // final String? userName;
  // final String? meetingMode;
  // final String? duration;
  // final String
  const ViewDetail(
      {super.key,
      this.meetingDetails,
      this.buttonText1,
      this.buttonText2,
      this.buttonText1pressed,
      this.buttonText2pressed,
      this.url,
      this.iconbuttonPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(left: 10, right: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
          const Text(
            "Meeting Details",
            style: TextStyle(
                color: Color(0xffFDBA2F),
                fontSize: 18,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            //delete expanded
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xffF5F5F5), width: 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileImage(url),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meetingDetails?.userName ?? "",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff202020),
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              meetingDetails?.communicationMode ?? "",
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "${meetingDetails?.fromDate ?? ""}  -  ${meetingDetails?.startTime ?? ""}",
                                style: const TextStyle(fontSize: 12)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Meeting Duration : ${meetingDetails?.duration ?? ""}",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Meeting Agenda : ${meetingDetails?.meetingAgenda}",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                iconbuttonPressed!();
                                print("meeting");
                              },
                              icon: SvgPicture.asset(icon ?? "")),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text("data")
                Container(
                    width: double.infinity,
                    // height: 67,
                    height: MediaQuery.of(context).size.height * 0.067,
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xffEBF6F7),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buttonText2 != null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: MaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    // minWidth: 30,
                                    // height: 30,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    textColor: const Color(0xffFFAA5F),

                                    // color: const Color(0xff6EBFC3),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        side: BorderSide(
                                            color: Color(0xffFFAA5F),
                                            width: 1)),
                                    child: Text(
                                      buttonText2 ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      buttonText2pressed!();
                                    }),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 10,
                        ),
                        buttonText1 != null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: MaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    // minWidth: 30,
                                    // height: 30,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    textColor: Colors.white,
                                    color: const Color(0xff6EBFC3),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      buttonText1 ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      // print("pressed");
                                      buttonText1pressed!();
                                    }),
                              )
                            : const SizedBox()
                      ],
                    )),
              ],
            ),
          ),
          // Column(
          //   children: [
          //     Card(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           side: const BorderSide(color: Color(0xffF5F5F5), width: 1)),
          //       margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          //       child: Column(
          //         children: [
          //           ListTile(
          //             contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          //             leading: ProfileImage(url),
          //             trailing: IconButton(
          //                 onPressed: () {
          //                   iconbuttonPressed!();
          //                 },
          //                 icon: SvgPicture.asset(icon ?? "")),
          //             //  Container(
          //             //   padding: const EdgeInsets.all(10),
          //             //   decoration: BoxDecoration(
          //             //       color: const Color(0xffFFC02D),
          //             //       borderRadius: BorderRadius.circular(10)),
          //             //   child: SvgPicture.asset(
          //             //     meetingDetails?.communicationMode == "audio Call"
          //             //         ? "assets/call.svg"
          //             //         : "assets/videocall.svg",
          //             //     color: Colors.white,
          //             //   ),
          //             // )

          //             title: Padding(
          //               padding: const EdgeInsets.only(top: 10),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     meetingDetails?.userName ?? "",
          //                     style: const TextStyle(
          //                         fontSize: 16, color: Color(0xff202020)),
          //                   ),
          //                   const SizedBox(
          //                     height: 5,
          //                   ),
          //                   Text(
          //                     meetingDetails?.communicationMode ?? "",
          //                     style: const TextStyle(fontSize: 12),
          //                   ),
          //                   const SizedBox(
          //                     height: 5,
          //                   ),
          //                   Text(
          //                       "${meetingDetails?.fromDate ?? ""}  -  ${meetingDetails?.startTime ?? ""}",
          //                       style: const TextStyle(fontSize: 12)),
          //                   const SizedBox(
          //                     height: 5,
          //                   ),
          //                   Text(
          //                     "Meeting Duration : ${meetingDetails?.duration ?? ""}",
          //                     style: const TextStyle(
          //                         fontSize: 12, fontWeight: FontWeight.w700),
          //                   ),
          //                   Text(
          //                     "Meeting Agenda: : ${meetingDetails?.meetingAgenda}",
          //                     style: const TextStyle(
          //                       fontSize: 12,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Container(
          //             width: double.infinity,
          //             // height:
          //             //     MediaQuery.of(context).size.height *
          //             //         0.06,
          //             padding: const EdgeInsets.only(top: 10, bottom: 10),
          //             decoration: BoxDecoration(
          //                 color: const Color(0xffEBF6F7),
          //                 borderRadius: BorderRadius.circular(10)),
          //             child: Padding(
          //               padding: const EdgeInsets.only(right: 10),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   // buttonText2pressed != null
          //                   buttonText2 != null
          //                       ? MaterialButton(
          //                           // color: Colors.transparent,
          //                           textColor: const Color(0xffFFAA5F),
          //                           shape: const RoundedRectangleBorder(
          //                               borderRadius: BorderRadius.all(
          //                                 Radius.circular(10.0),
          //                               ),
          //                               side: BorderSide(
          //                                   color: Color(0xffFFAA5F),
          //                                   width: 1)),
          //                           child: Text(buttonText2.toString()),
          //                           onPressed: () {
          //                             buttonText2pressed!();
          //                           })
          //                       : const SizedBox(),
          //                   const SizedBox(
          //                     width: 20,
          //                   ),
          //                   buttonText1 != null
          //                       ? MaterialButton(
          //                           color: const Color(0xff6EBFC3),
          //                           textColor: Colors.white,
          //                           shape: const RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.all(
          //                               Radius.circular(10.0),
          //                             ),
          //                           ),
          //                           child: Text(
          //                             buttonText1.toString(),
          //                             style: const TextStyle(fontSize: 12),
          //                           ),
          //                           onPressed: () {
          //                             buttonText1pressed!();
          //                           })
          //                       : SizedBox(),
          //                 ],
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}











 // return Card(
                                  //   shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       side: BorderSide(
                                  //           color: Color(0xffF5F5F5),
                                  //           width: 1)),
                                  //   margin: const EdgeInsets.fromLTRB(
                                  //       10, 20, 10, 10),
                                  //   child: Column(
                                  //     children: [
                                  //       ListTile(
                                  //         contentPadding:
                                  //             const EdgeInsets.fromLTRB(
                                  //                 10, 15, 10, 15),
                                  //         leading: ProfileImage(provider
                                  //             .meetingDetails[index]
                                  //             .profilepic),

                                  //         //  Image.asset("assets/profile.png"),

                                  //         trailing: IconButton(
                                  //           onPressed: (() {
                                  //             // onJoin(provider
                                  //             //     .meetingDetails[
                                  //             //         index]
                                  //             //     .channelName
                                  //             //     .toString());
                                  //             onJoin("test");
                                  //             print(provider
                                  //                 .meetingDetails[
                                  //                     index]
                                  //                 .channelName);
                                  //           }),
                                  //           icon: Container(
                                  //             padding: EdgeInsets.all(10),
                                  //             decoration: BoxDecoration(
                                  //                 color: Color(0xffFFC02D),
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         10)),
                                  //             child: SvgPicture.asset(
                                  //               "assets/phone.svg",
                                  //               color: Colors.white,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         title: Padding(
                                  //           padding: EdgeInsets.only(top: 10),
                                  //           child: Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.start,
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               Text(
                                  //                 "${provider.confirmedupcomingmeetings[index].userName}",
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Color(0xff202020),
                                  //                     fontWeight:
                                  //                         FontWeight.w600),
                                  //               ),
                                  //               const SizedBox(
                                  //                 height: 5,
                                  //               ),
                                  //               Text(
                                  //                 provider
                                  //                     .confirmedupcomingmeetings[
                                  //                         index]
                                  //                     .communicationMode
                                  //                     .toString(),
                                  //                 style:
                                  //                     TextStyle(fontSize: 12),
                                  //               ),
                                  //               const SizedBox(
                                  //                 height: 5,
                                  //               ),
                                  //               Text(
                                  //                   "${provider.confirmedupcomingmeetings[index].fromDate}  -  ${provider.confirmedupcomingmeetings[index].startTime}",
                                  //                   style: const TextStyle(
                                  //                       fontSize: 12)),
                                  //               TextButton(
                                  //                 style: TextButton.styleFrom(
                                  //                   minimumSize:
                                  //                       Size.zero, // Set this
                                  //                   padding: EdgeInsets.zero,
                                  //                   // and this
                                  //                 ),
                                  //                 onPressed: () {
                                  //                   showDialog<void>(
                                  //                     context: context,
                                  //                     builder: (BuildContext
                                  //                         context) {
                                  //                       return Dialog(
                                  //                         backgroundColor:
                                  //                             Colors.white,
                                  //                         elevation: 3,
                                  //                         child: Column(
                                  //                           mainAxisSize:
                                  //                               MainAxisSize
                                  //                                   .min,
                                  //                           mainAxisAlignment:
                                  //                               MainAxisAlignment
                                  //                                   .center,
                                  //                           children: [
                                  //                             const SizedBox(
                                  //                               height: 20,
                                  //                             ),
                                  //                             Align(
                                  //                               alignment:
                                  //                                   Alignment
                                  //                                       .topRight,
                                  //                               child:
                                  //                                   IconButton(
                                  //                                       onPressed:
                                  //                                           () {
                                  //                                         Navigator.pop(
                                  //                                             context);
                                  //                                       },
                                  //                                       icon: Icon(
                                  //                                           Icons.close)),
                                  //                             ),
                                  //                             const Text(
                                  //                               "Meeting Details",
                                  //                               style: TextStyle(
                                  //                                   color: Color(
                                  //                                       0xffFDBA2F),
                                  //                                   fontSize:
                                  //                                       18,
                                  //                                   fontWeight:
                                  //                                       FontWeight
                                  //                                           .w600),
                                  //                               textAlign:
                                  //                                   TextAlign
                                  //                                       .center,
                                  //                             ),
                                  //                             const SizedBox(
                                  //                               height: 5,
                                  //                             ),
                                  //                             Column(
                                  //                               children: [
                                  //                                 Card(
                                  //                                   shape: RoundedRectangleBorder(
                                  //                                       borderRadius:
                                  //                                           BorderRadius.circular(
                                  //                                               10),
                                  //                                       side: BorderSide(
                                  //                                           color:
                                  //                                               Color(0xffF5F5F5),
                                  //                                           width: 1)),
                                  //                                   margin:
                                  //                                       const EdgeInsets.fromLTRB(
                                  //                                           10,
                                  //                                           20,
                                  //                                           10,
                                  //                                           10),
                                  //                                   child:
                                  //                                       Column(
                                  //                                     children: [
                                  //                                       ListTile(
                                  //                                         contentPadding: const EdgeInsets.fromLTRB(
                                  //                                             10,
                                  //                                             15,
                                  //                                             10,
                                  //                                             15),
                                  //                                         leading:
                                  //                                             Image.asset("assets/profile.png"),
                                  //                                         trailing: IconButton(
                                  //                                             onPressed: (() {}),
                                  //                                             icon: Container(
                                  //                                               padding: EdgeInsets.all(10),
                                  //                                               decoration: BoxDecoration(color: Color(0xffFFC02D), borderRadius: BorderRadius.circular(10)),
                                  //                                               child: SvgPicture.asset(
                                  //                                                 "assets/phone.svg",
                                  //                                                 color: Colors.white,
                                  //                                               ),
                                  //                                             )),
                                  //                                         title:
                                  //                                             Padding(
                                  //                                           padding:
                                  //                                               EdgeInsets.only(top: 10),
                                  //                                           child:
                                  //                                               Column(
                                  //                                             mainAxisAlignment: MainAxisAlignment.start,
                                  //                                             crossAxisAlignment: CrossAxisAlignment.start,
                                  //                                             children: const [
                                  //                                               Text(
                                  //                                                 "Klimisch J",
                                  //                                                 style: TextStyle(fontSize: 16, color: Color(0xff202020)),
                                  //                                               ),
                                  //                                               SizedBox(
                                  //                                                 height: 5,
                                  //                                               ),
                                  //                                               Text(
                                  //                                                 "Voice Call ",
                                  //                                                 style: TextStyle(fontSize: 12),
                                  //                                               ),
                                  //                                               SizedBox(
                                  //                                                 height: 5,
                                  //                                               ),
                                  //                                               Text("Today- 10:00 AM", style: TextStyle(fontSize: 12)),
                                  //                                               SizedBox(
                                  //                                                 height: 5,
                                  //                                               ),
                                  //                                               Text(
                                  //                                                 "Meeting Duration : 1 hour",
                                  //                                                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                               ),
                                  //                                               Text(
                                  //                                                 "Meeting Agenda: : Varius faucibus ex Ut diam vehicula, vitae in Donec ex hendrerit lobortis, tincidunt Praesent Vestibulum Cras tortor. nec commodo nisl. id tincidunt Donec at.",
                                  //                                                 style: TextStyle(
                                  //                                                   fontSize: 12,
                                  //                                                 ),
                                  //                                               ),
                                  //                                             ],
                                  //                                           ),
                                  //                                         ),
                                  //                                       ),
                                  //                                       Container(
                                  //                                         width:
                                  //                                             double.infinity,
                                  //                                         // height:
                                  //                                         //     MediaQuery.of(context).size.height *
                                  //                                         //         0.06,
                                  //                                         padding: EdgeInsets.only(
                                  //                                             top: 10,
                                  //                                             bottom: 10),
                                  //                                         decoration: BoxDecoration(
                                  //                                             color: Color(0xffEBF6F7),
                                  //                                             borderRadius: BorderRadius.circular(10)),
                                  //                                         child:
                                  //                                             Padding(
                                  //                                           padding:
                                  //                                               const EdgeInsets.only(right: 10),
                                  //                                           child:
                                  //                                               Row(
                                  //                                             mainAxisAlignment: MainAxisAlignment.end,
                                  //                                             children: [
                                  //                                               MaterialButton(
                                  //                                                   // color: Colors.transparent,
                                  //                                                   textColor: Color(0xffFFAA5F),
                                  //                                                   shape: const RoundedRectangleBorder(
                                  //                                                       borderRadius: BorderRadius.all(
                                  //                                                         Radius.circular(10.0),
                                  //                                                       ),
                                  //                                                       side: BorderSide(color: Color(0xffFFAA5F), width: 1)),
                                  //                                                   child: const Text("Cancel"),
                                  //                                                   onPressed: () {}),
                                  //                                               const SizedBox(
                                  //                                                 width: 20,
                                  //                                               ),
                                  //                                               MaterialButton(
                                  //                                                   color: const Color(0xff6EBFC3),
                                  //                                                   textColor: Colors.white,
                                  //                                                   shape: const RoundedRectangleBorder(
                                  //                                                     borderRadius: BorderRadius.all(
                                  //                                                       Radius.circular(10.0),
                                  //                                                     ),
                                  //                                                   ),
                                  //                                                   child: const Text(
                                  //                                                     "Reschedule",
                                  //                                                     style: TextStyle(fontSize: 12),
                                  //                                                   ),
                                  //                                                   onPressed: () {}),
                                  //                                             ],
                                  //                                           ),
                                  //                                         ),
                                  //                                       )
                                  //                                     ],
                                  //                                   ),
                                  //                                 )
                                  //                               ],
                                  //                             )
                                  //                           ],
                                  //                         ),
                                  //                       );
                                  //                     },
                                  //                   );
                                  //                 },
                                  //                 child: const Text(
                                  //                   "View Details",
                                  //                   style: TextStyle(
                                  //                       color: Color(
                                  //                         0xffFD2FE2,
                                  //                       ),
                                  //                       fontSize: 12),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         // subtitle: Column(
                                  //         //   mainAxisAlignment:
                                  //         //       MainAxisAlignment.start,
                                  //         //   crossAxisAlignment:
                                  //         //       CrossAxisAlignment.start,
                                  //         //   children: [
                                  //         //     Text(
                                  //         //       " Voice Call",
                                  //         //     ),
                                  //         //   ],
                                  //         // ),
                                  //       ),
                                  //       Container(
                                  //         width: double.infinity,
                                  //         // height:
                                  //         //     MediaQuery.of(context).size.height *
                                  //         //         0.06,
                                  //         padding: EdgeInsets.only(
                                  //             top: 10, bottom: 10),
                                  //         decoration: BoxDecoration(
                                  //             color: Color(0xffEBF6F7),
                                  //             borderRadius:
                                  //                 BorderRadius.circular(10)),
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.only(
                                  //               right: 10),
                                  //           child: Row(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.end,
                                  //             children: [
                                  //               MaterialButton(
                                  //                   // color: Colors.transparent,
                                  //                   textColor:
                                  //                       Color(0xffFFAA5F),
                                  //                   shape:
                                  //                       const RoundedRectangleBorder(
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .all(
                                  //                             Radius.circular(
                                  //                                 10.0),
                                  //                           ),
                                  //                           side: BorderSide(
                                  //                               color: Color(
                                  //                                   0xffFFAA5F),
                                  //                               width: 1)),
                                  //                   child: const Text("Cancel"),
                                  //                   onPressed: () {}),
                                  //               const SizedBox(
                                  //                 width: 20,
                                  //               ),
                                  //               MaterialButton(
                                  //                   color:
                                  //                       const Color(0xff6EBFC3),
                                  //                   textColor: Colors.white,
                                  //                   shape:
                                  //                       const RoundedRectangleBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.all(
                                  //                       Radius.circular(10.0),
                                  //                     ),
                                  //                   ),
                                  //                   child: const Text(
                                  //                     "Reschedule",
                                  //                     style: TextStyle(
                                  //                         fontSize: 12),
                                  //                   ),
                                  //                   onPressed: () {}),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // );






// ? Center(
                              //     child: ListView.builder(
                              //         itemCount: provider
                              //             .confirmedupcomingmeetings.length,
                              //         itemBuilder:
                              //             (BuildContext context, int index) {
                              //           return Card(
                              //             shape: RoundedRectangleBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(10),
                              //                 side: const BorderSide(
                              //                     color: Color(0xffF5F5F5),
                              //                     width: 1)),
                              //             margin: const EdgeInsets.fromLTRB(
                              //                 10, 20, 10, 10),
                              //             child: Column(
                              //               children: [
                              //                 ListTile(
                              //                   contentPadding:
                              //                       const EdgeInsets.fromLTRB(
                              //                           10, 15, 10, 15),
                              //                   leading: ProfileImage(provider
                              //                       .confirmedupcomingmeetings[
                              //                           index]
                              //                       .profilepic),

                              //                   trailing: IconButton(
                              //                       onPressed: (() {
                              //                         // onJoin(provider
                              //                         //     .confirmedupcomingmeetings[
                              //                         //         index]
                              //                         //     .channelName
                              //                         //     .toString());
                              //                         onJoin("test");
                              //                         print(provider
                              //                             .confirmedupcomingmeetings[
                              //                                 index]
                              //                             .channelName);
                              //                       }),
                              //                       icon: Container(
                              //                         padding:
                              //                             EdgeInsets.all(10),
                              //                         decoration: BoxDecoration(
                              //                             color:
                              //                                 Color(0xffFFC02D),
                              //                             borderRadius:
                              //                                 BorderRadius
                              //                                     .circular(
                              //                                         10)),
                              //                         child: SvgPicture.asset(
                              //                           "assets/phone.svg",
                              //                           color: Colors.white,
                              //                         ),
                              //                       )),
                              //                   title: Padding(
                              //                     padding:
                              //                         EdgeInsets.only(top: 10),
                              //                     child: Column(
                              //                       mainAxisAlignment:
                              //                           MainAxisAlignment.start,
                              //                       crossAxisAlignment:
                              //                           CrossAxisAlignment
                              //                               .start,
                              //                       children: [
                              //                         Text(
                              //                           provider
                              //                               .confirmedupcomingmeetings[
                              //                                   index]
                              //                               .userName
                              //                               .toString(),
                              //                           style: TextStyle(
                              //                               fontSize: 16,
                              //                               color: Color(
                              //                                   0xff202020)),
                              //                         ),
                              //                         const SizedBox(
                              //                           height: 5,
                              //                         ),
                              //                         Text(
                              //                           provider
                              //                               .confirmedupcomingmeetings[
                              //                                   index]
                              //                               .communicationMode
                              //                               .toString(),
                              //                           style: TextStyle(
                              //                               fontSize: 12),
                              //                         ),
                              //                         const SizedBox(
                              //                           height: 5,
                              //                         ),
                              //                         Text(
                              //                             "${provider.confirmedupcomingmeetings[index].fromDate}  -  ${provider.confirmedupcomingmeetings[index].startTime}",
                              //                             style: TextStyle(
                              //                                 fontSize: 12)),
                              //                         const SizedBox(
                              //                           height: 5,
                              //                         ),
                              //                         TextButton(
                              //                           onPressed: () =>
                              //                               Navigator.pop(
                              //                                   context),
                              //                           style: TextButton.styleFrom(
                              //                               padding:
                              //                                   EdgeInsets.zero,
                              //                               minimumSize:
                              //                                   Size(50, 30),
                              //                               tapTargetSize:
                              //                                   MaterialTapTargetSize
                              //                                       .shrinkWrap,
                              //                               textStyle: TextStyle(
                              //                                   fontSize: 12,
                              //                                   color: Color(
                              //                                       0xffFD2FE2)),
                              //                               alignment: Alignment
                              //                                   .centerLeft),
                              //                           child: Text(
                              //                               "View details"),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                   ),
                              //                   // subtitle: Column(
                              //                   //   mainAxisAlignment:
                              //                   //       MainAxisAlignment.start,
                              //                   //   crossAxisAlignment:
                              //                   //       CrossAxisAlignment.start,
                              //                   //   children: [
                              //                   //     Text(
                              //                   //       " Voice Call",
                              //                   //     ),
                              //                   //   ],
                              //                   // ),
                              //                 ),
                              //                 Container(
                              //                   // width: double.infinity,
                              //                   // height:
                              //                   //     MediaQuery.of(context).size.height *
                              //                   //         0.06,
                              //                   padding: EdgeInsets.only(
                              //                       top: 10, bottom: 10),
                              //                   decoration: BoxDecoration(
                              //                       color: Color(0xffEBF6F7),
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10)),
                              //                   child: Padding(
                              //                     padding:
                              //                         const EdgeInsets.only(
                              //                             right: 10),
                              //                     child: Align(
                              //                       alignment:
                              //                           Alignment.centerRight,
                              //                       child: MaterialButton(
                              //                           color: const Color(
                              //                               0xff6EBFC3),
                              //                           textColor: Colors.white,
                              //                           shape:
                              //                               const RoundedRectangleBorder(
                              //                             borderRadius:
                              //                                 BorderRadius.all(
                              //                               Radius.circular(
                              //                                   10.0),
                              //                             ),
                              //                           ),
                              //                           child: const Text(
                              //                             "Reschedule",
                              //                             style: TextStyle(
                              //                                 fontSize: 12),
                              //                           ),
                              //                           onPressed: () async {
                              //                             final res =
                              //                                 await showDialog(
                              //                                     context:
                              //                                         context,
                              //                                     builder:
                              //                                         (BuildContext
                              //                                             context) {
                              //                                       return Dialog(
                              //                                         insetPadding: EdgeInsets.only(
                              //                                             left:
                              //                                                 15,
                              //                                             right:
                              //                                                 15),

                              //                                         clipBehavior:
                              //                                             Clip.antiAliasWithSaveLayer,

                              //                                         shape: RoundedRectangleBorder(
                              //                                             borderRadius:
                              //                                                 BorderRadius.circular(10.0)), //this right here
                              //                                         child: Container(
                              //                                             // width: double
                              //                                             //     .infinity,
                              //                                             child: Padding(
                              //                                                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              //                                                 child: Column(
                              //                                                   mainAxisAlignment: MainAxisAlignment.center,
                              //                                                   crossAxisAlignment: CrossAxisAlignment.start,
                              //                                                   children: [
                              //                                                     Align(
                              //                                                       alignment: Alignment.topRight,
                              //                                                       child: Container(
                              //                                                           // padding: EdgeInsets.all(5),
                              //                                                           decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xffD8D8D8))),
                              //                                                           child: IconButton(
                              //                                                               onPressed: (() {
                              //                                                                 Navigator.pop(context);
                              //                                                               }),
                              //                                                               icon: Icon(Icons.close))
                              //                                                           //     const Icon(
                              //                                                           //   Icons
                              //                                                           //       .close,
                              //                                                           //   color:
                              //                                                           //       Color(0xffFDBA2F),
                              //                                                           // ),
                              //                                                           ),
                              //                                                     ),
                              //                                                     const SizedBox(
                              //                                                       height: 10,
                              //                                                     ),
                              //                                                     const Center(
                              //                                                       child: Text(
                              //                                                         "Reschedule",
                              //                                                         style: TextStyle(color: Color(0xffFDBA2F), fontSize: 18, fontWeight: FontWeight.bold),
                              //                                                       ),
                              //                                                     ),
                              //                                                     const SizedBox(
                              //                                                       height: 10,
                              //                                                     ),
                              //                                                     const TextField(
                              //                                                       decoration: InputDecoration(border: InputBorder.none, hintText: 'Why you want to cancel?'),
                              //                                                     ),
                              //                                                     Column(
                              //                                                         children: provider.cancelReasons.map((area) {
                              //                                                       return CheckboxListTile(
                              //                                                           activeColor: const Color(0xffFDBA2F),
                              //                                                           checkColor: Colors.white,
                              //                                                           value: area["isChecked"],
                              //                                                           title: Text(
                              //                                                             area["name"],
                              //                                                             style: const TextStyle(color: Color(0xff202020), fontSize: 14, fontWeight: FontWeight.w500),
                              //                                                           ),
                              //                                                           onChanged: (newValue) {
                              //                                                             setState(() {
                              //                                                               area["isChecked"] = newValue;
                              //                                                             });
                              //                                                           });
                              //                                                     }).toList()),
                              //                                                     const SizedBox(
                              //                                                       height: 20,
                              //                                                     ),
                              //                                                     const Text(
                              //                                                       "Share in detail",
                              //                                                       style: TextStyle(
                              //                                                         color: Color(0xff202020),
                              //                                                       ),
                              //                                                     ),
                              //                                                     const SizedBox(height: 5),
                              //                                                     InputField(
                              //                                                       maxline: 5,
                              //                                                       // minline: 1,
                              //                                                       hintText: "Describe here",
                              //                                                       controller: provider.cancelReason,

                              //                                                       validation: Validators.basic,
                              //                                                     ),
                              //                                                     const SizedBox(
                              //                                                       height: 20,
                              //                                                     ),
                              //                                                     MaterialButton(
                              //                                                       minWidth: double.infinity,
                              //                                                       onPressed: () {
                              //                                                         Navigator.pop(context, "Cancel");
                              //                                                       },
                              //                                                       color: const Color(0xFFFDBA2F),
                              //                                                       child: Row(
                              //                                                         mainAxisAlignment: MainAxisAlignment.center,
                              //                                                         children: const [
                              //                                                           Text(
                              //                                                             "Cancel",
                              //                                                             style: TextStyle(color: Colors.white),
                              //                                                           ),
                              //                                                           SizedBox(
                              //                                                             width: 10,
                              //                                                           ),
                              //                                                           Icon(
                              //                                                             Icons.arrow_forward,
                              //                                                             color: Colors.white,
                              //                                                           )
                              //                                                         ],
                              //                                                       ),
                              //                                                     )
                              //                                                   ],
                              //                                                 )
                              //                                                 // : Column(
                              //                                                 //     children: [
                              //                                                 //       Center(
                              //                                                 //         child: Lottie.asset(
                              //                                                 //           'assets/success.json',
                              //                                                 //           repeat: true,
                              //                                                 //           width: 300,
                              //                                                 //           height: 300,
                              //                                                 //           fit: BoxFit.fill,
                              //                                                 //         ),
                              //                                                 //       ),
                              //                                                 //       const Center(
                              //                                                 //         child: Text(
                              //                                                 //           "No data found.please select from dropdown",
                              //                                                 //           style: TextStyle(color: Color(0xff7E7E7E), fontSize: 12),
                              //                                                 //         ),
                              //                                                 //       )
                              //                                                 //     ],
                              //                                                 //   ),
                              //                                                 )),
                              //                                       );
                              //                                     });
                              //                             // res is passing from navigator.pop
                              //                             if (res == "Cancel") {
                              //                               //TODO show cancel popup
                              //                             }
                              //                             print(res);
                              //                           }),
                              //                     ),
                              //                   ),
                              //                 )
                              //               ],
                              //             ),
                              //           );
                              //         }),
                              //   )