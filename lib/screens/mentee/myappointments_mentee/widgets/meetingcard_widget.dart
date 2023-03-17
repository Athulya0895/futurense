import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';

class MeetingCard extends StatelessWidget {
  final String? url;
  final String? userName;
  final String? meetingMode;
  final String? fromDate;
  final String? startTime;
  final String? status;
  final String? icon;
  final String? buttonText1;
  final String? buttonText2;
  final String? cancelledby;
  final Function? onPressedViewDetail;
  final Function? buttonText1pressed;
  final Function? buttonText2pressed;
  final Function? iconButtonpressed;
  const MeetingCard(
      {super.key,
      required this.url,
      required this.userName,
      required this.meetingMode,
      this.fromDate,
      this.startTime,
      required this.status,
      required this.icon,
      this.buttonText1,
      required this.onPressedViewDetail,
      this.cancelledby,
      this.buttonText2,
      this.buttonText1pressed,
      this.buttonText2pressed,
      this.iconButtonpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //delete expanded
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                    ProfileImage(url:url),
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
                        userName ?? "-",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff202020),
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        meetingMode ?? "-",
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      fromDate != null || startTime != null
                          ? Text("$fromDate  -  $startTime",
                              style: const TextStyle(fontSize: 12))
                          : Text(
                              "Cancelled by $cancelledby",
                              style: const TextStyle(color: Color(0xffFF7901)),
                            ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero,
                          // and this
                        ),
                        onPressed: () {
                          onPressedViewDetail!();
                        },
                        child: const Text(
                          "View details",
                          style: TextStyle(
                              color: Color(
                                0xffFD2FE2,
                              ),
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                      decoration: BoxDecoration(
                          color: const Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        status ?? "_",
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xff979797)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          iconButtonpressed!();
                          // print("meeting");
                        },
                        icon:
                            SvgPicture.asset(icon ?? "assets/cancelledimg.svg"))
                    // SvgPicture.asset(icon ?? ""
                    //     // "assets/cancelledimg.svg",
                    //     // width: 34,
                    //     // height: 34,
                    //     ),
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
                  buttonText2!.isNotEmpty
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
                                      color: Color(0xffFFAA5F), width: 1)),
                              child: Text(
                                buttonText2 ?? "",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                // print("pressed");
                                buttonText2pressed!();
                              }),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 10,
                  ),
                  buttonText1!.isNotEmpty
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
    );
  }
}



//previous mentor
// Center(
//             child: ListView.builder(
//                 itemCount: provider.previousMeetings.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         side: BorderSide(color: Color(0xffF5F5F5), width: 1)),
//                     margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//                     child: Column(
//                       children: [
//                         ListTile(
//                           contentPadding:
//                               const EdgeInsets.fromLTRB(10, 15, 10, 15),
//                           leading: ProfileImage(
//                               provider.previousMeetings[index].profilepic),

//                           trailing: IconButton(
//                               onPressed: (() {}),
//                               icon: Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     color: Color(0xffFFC02D),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: SvgPicture.asset(
//                                   "assets/tick.svg",
//                                   color: Colors.white,
//                                 ),
//                               )),
//                           title: Padding(
//                             padding: EdgeInsets.only(top: 10),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   provider.previousMeetings[index].userName
//                                       .toString(),
//                                   style: const TextStyle(
//                                       fontSize: 16, color: Color(0xff202020)),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   provider
//                                       .previousMeetings[index].communicationMode
//                                       .toString(),
//                                   style: const TextStyle(fontSize: 12),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "${provider.previousMeetings[index].fromDate}  -  ${provider.previousMeetings[index].startTime}",
//                                     style: TextStyle(fontSize: 12)),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text("View details",
//                                     style: TextStyle(
//                                         fontSize: 12, color: Color(0xffFD2FE2)))
//                               ],
//                             ),
//                           ),
//                           // subtitle: Column(
//                           //   mainAxisAlignment:
//                           //       MainAxisAlignment.start,
//                           //   crossAxisAlignment:
//                           //       CrossAxisAlignment.start,
//                           //   children: [
//                           //     Text(
//                           //       " Voice Call",
//                           //     ),
//                           //   ],
//                           // ),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           // height:
//                           //     MediaQuery.of(context).size.height *
//                           //         0.06,
//                           padding: const EdgeInsets.only(top: 10, bottom: 10),
//                           decoration: BoxDecoration(
//                               color: const Color(0xffEBF6F7),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 MaterialButton(
//                                     // color: Colors.transparent,
//                                     textColor: const Color(0xffFFAA5F),
//                                     shape: const RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(10.0),
//                                         ),
//                                         side: BorderSide(
//                                             color: Color(0xffFFAA5F),
//                                             width: 1)),
//                                     child: const Text("Leave a Review "),
//                                     onPressed: () {}),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 MaterialButton(
//                                     color: const Color(0xff6EBFC3),
//                                     textColor: Colors.white,
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(10.0),
//                                       ),
//                                     ),
//                                     child: const Text(
//                                       "Schedule Another",
//                                       style: TextStyle(fontSize: 12),
//                                     ),
//                                     onPressed: () {}),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           ),