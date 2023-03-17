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
  final String? viewStatus;
  final Color? viewStatusColor;
  final String? cancelReason;
  final String? cancelDetailReason;
  final String? rescheduleReason;
  final String? rescheduleDetailReason;
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
      required this.viewStatus,
      required this.viewStatusColor,
      this.cancelReason,
      this.cancelDetailReason,
      this.rescheduleReason,
      this.rescheduleDetailReason,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding:const EdgeInsets.only(left: 10, right: 10),
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    padding:const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color:const Color(0xffD8D8D8))),
                    child: SvgPicture.asset('assets/closing.svg'),
                    //  const Icon(
                    //   Icons.close,
                    //   color: Color(0xffFDBA2F),
                    // )
                  )),
            ),
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
                          ProfileImage(url: url),
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
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              // alignment: Alignment.centerRight,
                              onPressed: () {
                                iconbuttonPressed!();
                                // print("meeting");
                              },
                              icon: SvgPicture.asset(icon ?? "")),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            viewStatus!,
                            // "Meeting Rescheduled to Tomorrow 11:00 AM",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: viewStatusColor),
                          ),
                          // Text(
                          //   "Meeting Duration : ${meetingDetails?.duration ?? ""}",
                          //   style: const TextStyle(
                          //       fontSize: 12, fontWeight: FontWeight.w500),
                          // ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Meeting Duration : ',
                              style: const TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xff202020)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: meetingDetails?.duration ?? "",
                                    style:const TextStyle(color: Color(0xff777A95))),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Meeting Agenda : ',
                              style: const TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xff202020)),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        meetingDetails?.meetingAgenda ?? "-",
                                    style:const TextStyle(color: Color(0xff777A95))),
                              ],
                            ),
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          cancelReason != null
                              ? RichText(
                                  text: TextSpan(
                                    text: 'Reason: ',
                                    style: const TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xff202020)),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${cancelReason ?? ""}"
                                              "\n"
                                              "${cancelDetailReason ?? ""}",
                                          style:const TextStyle(
                                              color: Color(0xff777A95))),
                                    ],
                                  ),
                                )
                              :const SizedBox(),

                               rescheduleReason != null
                              ? RichText(
                                  text: TextSpan(
                                    text: 'Reschedule Reason: ',
                                    style: const TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xff202020)),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${rescheduleReason ?? ""}"
                                              "\n"
                                              "${rescheduleDetailReason ?? ""}",
                                          style:const TextStyle(
                                              color: Color(0xff777A95))),
                                    ],
                                  ),
                                )
                              :const SizedBox()
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
