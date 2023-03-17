import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/components/show_more.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';

import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/mentor/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentor/mentee_detail/mentee_detail_vm.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_review/mentor_review.dart';
import 'package:readmore/readmore.dart';

class MenteeDetail extends StatefulWidget {
  MentorModel? topmentor;
  MenteeDetail({super.key, required this.topmentor});

  @override
  State<MenteeDetail> createState() => _MenteeDetailState();
}

class _MenteeDetailState extends State<MenteeDetail>
    with BasePage<MenteeDetailVM> {
  String text =
      "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contri.";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
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
                centerTitle: true,
                title: Text(
                  "${widget.topmentor!.fName.toString()} ${widget.topmentor!.lName.toString()}",
                  style: const TextStyle(
                      color: Color(0xffFDBA2F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
          body: CustomScrollView(
            physics:const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    headerdetailmentor(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 16, left: 16, bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About ${widget.topmentor?.fName.toString()} ${widget.topmentor?.lName.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // containerWidget(
                          //     widget.topmentor!.aboutYou.toString()),
                          showMoretext(widget.topmentor!.aboutYou.toString()),

                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Experience",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   "${widget.topmentor?.workExperience.toString() ?? ""}  years",
                          //   style: const TextStyle(color: Color(0xff6B779A)),
                          // ),
                          showMoretext(
                              "${widget.topmentor?.workExperience.toString() ?? ""}  years"),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Looking for mentorship in",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   widget.topmentor?.canHelpYou.toString() ?? "",
                          //   style: const TextStyle(color: Color(0xff6B779A)),
                          // ),
                          showMoretext(
                              widget.topmentor?.canHelpYou.toString() ?? ""),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Target Skills",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   widget.topmentor?.skills ?? "",
                          //   style: const TextStyle(color: Color(0xff6B779A)),
                          // ),
                          showMoretext(widget.topmentor?.skills ?? ""),
                          const SizedBox(
                            height: 30,
                          ),

                          const Text("Preferred Communication",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: _communicationtile(
                                  "Messaging",
                                  // "Chat me up, share photos.",
                                  SvgPicture.asset("assets/message.svg"),
                                const  Color(0xffEDA1AB).withOpacity(0.15),
                                ),
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
                                SvgPicture.asset("assets/audiocall.svg"),
                               const Color(0xff7ACEFA).withOpacity(0.15),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              _communicationtile(
                                "Video Call",
                                // "See your Mentor live",
                                SvgPicture.asset("assets/video.svg"),
                              const  Color(0xffF7C480).withOpacity(0.15),
                              ),
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
                                      builder: (context) =>
                                          BookAppointmentMentor(
                                            mentor: widget.topmentor,
                                          )));
                            },
                            text: "Schedule Meeting",
                            textColor: Colors.white,
                          ),
                          // MaterialButton(
                          //     minWidth: double.infinity,
                          //     padding:
                          //         const EdgeInsets.only(top: 15, bottom: 15),
                          //     child: const Text("Set Meeting"),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     textColor: Colors.white,
                          //     color: const Color(0xffFDBA2F),
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (Context) =>
                          //                   BookAppointmentMentor(
                          //                     mentor: widget.topmentor,
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
                                          builder: (context) => MentorReview(
                                                menteedetail: widget.topmentor,
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
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       top: 20, right: 16, left: 16, bottom: 4),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Text("Top Mentors", style: TextStyles.title.bold),
                    //     ],
                    //   ).hP16,
                    // ),
                  ],
                ),
              ),
            ],
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

          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ProfileImage(url: widget.topmentor?.profilePic).p(8),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "${widget.topmentor?.fName.toString()} ${widget.topmentor?.lName.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
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
                widget.topmentor?.email.toString() ?? "email@example.com",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xff7AC4C8)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _headercontainer(
                      "Experience",
                      "${widget.topmentor?.workExperience.toString() ?? "0"} Years",
                      const Color(0xffe80010).withOpacity(.15),
                      SvgPicture.asset("assets/experience.svg")),
                  const SizedBox(
                    width: 10,
                  ),
                  _headercontainer(
                      widget.topmentor?.rating == "0" ||
                              widget.topmentor?.reviews == "0"
                          ? ""
                          : "${widget.topmentor?.reviews.toString()}+ Reviews",
                      widget.topmentor?.rating == "0" ||
                              widget.topmentor?.reviews == "0"
                          ? "No Reviews"
                          : " ${widget.topmentor?.rating.toString()} ⭐️",
                      const Color(0xffF7C480).withOpacity(.15),
                      SvgPicture.asset("assets/reviews.svg")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

//details about mentee
  Widget containerWidget(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          // border: Border.all(color: Color(0xffDCF1F4)),

          boxShadow: const [
            BoxShadow(
                color: Color(0xffDCF1F4),
                spreadRadius: 0,
                blurRadius: 4,
                offset:  Offset(0, 3))
          ]),
      child: ViewMore(
        text: text,
      ),
    );
  }

  Widget showMoretext(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 15, 8, 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          // border: Border.all(color: Color(0xffDCF1F4)),

          boxShadow: const [
            BoxShadow(
                color: Color(0xffDCF1F4),
                spreadRadius: 0,
                blurRadius: 4,
                offset:  Offset(0, 3))
          ]),
      child: ReadMoreText(
        text,
        style:const TextStyle(color: Color(0xff6B779A)),
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'View More',
        trimExpandedText: 'Show less',
        moreStyle:const TextStyle(
            color: Color(0xff682FFD),
            decoration: TextDecoration.underline,
            fontSize: 12),
      ),
    );
  }

//Communication available for particular mentor
  Widget _communicationtile(String name, SvgPicture icon, Color color) {
    return Column(
      children: [
        Container(
            // height: 20,
            // width: 20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
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
          // padding: const EdgeInsets.fromLTRB(20, 70, 20, 10),
          // constraints: BoxConstraints(
          //   maxWidth: 150,
          // ),
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
  MenteeDetailVM create() => MenteeDetailVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
