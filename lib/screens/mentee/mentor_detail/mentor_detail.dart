import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/components/show_more.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat_home/chat_home.dart';
import 'package:futurensemobileapp/screens/mentee/mentee_review/mentee_review.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail_vm.dart';

class MentorDetails extends StatefulWidget {
  MentorModel? topmentor;
  MentorDetails({super.key, required this.topmentor});

  @override
  State<MentorDetails> createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails>
    with BasePage<MentorDetailVM> {
//to showmore
  late String firstHalf;
  late String secondHalf;
  bool flag = true;
  String text =
      "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contri.";
  @override
  void initState() {
    super.initState();
    void textmore(String text) {
      if (text.length > 50) {
        firstHalf = text.substring(0, 50);
        secondHalf = text.substring(50, text.length);
      } else {
        firstHalf = text;
        secondHalf = "";
      }
    }
    // if (text.length > 50) {
    //   firstHalf = text.substring(0, 50);
    //   secondHalf = text.substring(50, text.length);
    // } else {
    //   firstHalf = text;
    //   secondHalf = "";
    // }
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
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
                title: Text(
                  "${widget.topmentor!.fName.toString()} ${widget.topmentor!.lName.toString()}",
                  style: TextStyle(
                      color: const Color(0xffFDBA2F),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                headerdetailmentor(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 16, left: 16, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "About  ${widget.topmentor!.fName.toString()} ${widget.topmentor!.lName.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Color(0xffDCF1F4)),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0, 6),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              spreadRadius: 2,
                              color: Color(0xffDCF1F4),
                            )
                          ],
                        ),
                        child: ViewMore(
                          text: widget.topmentor!.aboutYou.toString(),
                        ),
                      ),
                      // const Text(
                      //     "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contri... "),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Experience",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "${widget.topmentor?.workExperience.toString() ?? ""}  years",
                          style: const TextStyle(
                              color: Color(0xff6B779A), fontSize: 14)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Can help you with",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.topmentor!.canHelpYou.toString(),
                          style: const TextStyle(
                              color: Color(0xff6B779A), fontSize: 14)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Target Skills",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff222B45)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.topmentor?.skills ?? "",
                        style: const TextStyle(
                            color: Color(0xff6B779A), fontSize: 14),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Text("Prefered Communication",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: _communicationtile(
                                "Messaging",
                                // "Chat me up, share photos.",
                                SvgPicture.asset("assets/message.svg")),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ChatHome()));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _communicationtile(
                              "Audio Call",
                              // "Call your Mentor directly.",
                              SvgPicture.asset("assets/phone.svg")),
                          const SizedBox(
                            height: 20,
                          ),
                          _communicationtile(
                              "Video Call",
                              // "See your Mentor live",
                              SvgPicture.asset("assets/video.svg")),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomMaterialButtton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookAppointment(
                                        topmentor: widget.topmentor,
                                      )));
                        },
                        text: "Schedule Meeting",
                        textColor: Colors.white,
                      ),
                      // MaterialButton(
                      //     minWidth: double.infinity,
                      //     padding:
                      //         const EdgeInsets.only(top: 15, bottom: 15),
                      //     child: Text("Set Meeting"),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     textColor: Colors.white,
                      //     color: const Color(0xffFDBA2F),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (Context) => BookAppointment(
                      //                     topmentor: widget.topmentor,
                      //                   )));
                      //     }),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenteeReview(
                                            mentordetails: widget.topmentor,
                                          )));
                            },
                            child: const Text(
                              "Check Reviews",
                              style: TextStyle(
                                  color: Color(0xff682FFD),
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }

//header details of mentee
  Widget headerdetailmentor() {
    return Column(
      children: [
        Container(
          // height: 300,
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.only(bottom: 20),
          width: MediaQuery.of(context).size.width * 1.5,
          decoration: BoxDecoration(
              // color: Colors.yellow,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  const Color(0xff7AC4C8).withOpacity(0.5),
                ],
              ),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     offset: Offset(0.5, 0),
              //     blurStyle: BlurStyle.inner,
              //     blurRadius: 60,
              //     color: Color(0xff979797),
              //   )
              // ],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          // child:
          //  const Center(
          //     child:
          //      Text(
          //   'Pro. Bellamy Nicholas',
          //   style: TextStyle(
          //     fontSize: 48.0,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xff),
          //   ),
          // )
          // ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  child: SizedBox(
                      // height: 40,
                      // width: 40,

                      child:
                          ProfileImage(widget.topmentor?.profilePic.toString())
                      // Image.asset("assets/professor.png", fit: BoxFit.fill),
                      ),
                ).p(8),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${widget.topmentor!.fName.toString()} ${widget.topmentor!.lName.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.topmentor!.designationName.toString(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.topmentor!.email.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xff7AC4C8)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _headercontainer(
                        "Students\nmentored",
                        widget.topmentor!.studentsMentored.toString(),
                        const Color(0xff7ACEFA).withOpacity(.15),
                        SvgPicture.asset("assets/students.svg")),
                    _headercontainer(
                        "Experience",
                        "${widget.topmentor!.workExperience ?? "0"} Years",
                        const Color(0xffe80010).withOpacity(.15),
                        SvgPicture.asset("assets/experience.svg")),
                    _headercontainer(
                        "Reviews",
                        "${widget.topmentor!.rating.toString()}, ${widget.topmentor!.reviews.toString()}+",
                        const Color(0xffF7C480).withOpacity(.15),
                        SvgPicture.asset("assets/reviews.svg")),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

//Communication available for particular mentor
  Widget _communicationtile(String name, SvgPicture icon) {
    return Column(
      children: [
        Container(
            // height: 20,
            // width: 20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffEDA1AB).withOpacity(0.15),
            ),
            child: icon),
        const SizedBox(
          height: 10,
        ),
        Text(name)
      ],
    );
  }

  Widget _headercontainer(
      String title, String count, Color color, SvgPicture icon) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 155,
          width: 105,
          padding: const EdgeInsets.fromLTRB(10, 70, 20, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            // border: Border.all(
            //   color: Color(0xff979797),
            // ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 25,
                color: const Color(0xff6B779A).withOpacity(0.5),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  style: TextStyles.title.subTitleColor)
              Text(
                count,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: icon,
        ),
      ],
    );
  }

  @override
  MentorDetailVM create() => MentorDetailVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
