import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat_home/chat_home.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail_vm.dart';

class MentorDetails extends StatefulWidget {
  const MentorDetails({super.key});

  @override
  State<MentorDetails> createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails>
    with BasePage<MentorDetailVM> {
  Widget headerdetailmentor() {
    return Column(
      children: [
        Container(
          // height: 300,
          padding: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
              // color: Colors.yellow,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xffFCFAFA),
                ],
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0.5, 0),
                  blurStyle: BlurStyle.inner,
                  blurRadius: 60,
                  color: Color(0xff979797),
                )
              ],
              borderRadius: BorderRadius.only(
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
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                child: SizedBox(
                  // height: 40,
                  // width: 40,

                  child: Image.asset("assets/professor.png", fit: BoxFit.fill),
                ),
              ).p(8),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "'Pro. Bellamy Nicholas'",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Data Scientist in Informaqtion Technology &Services"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _headercontainer(
                      "Students",
                      "1000+",
                      const Color(0xff6EBFC3).withOpacity(.15),
                      SvgPicture.asset("assets/students.svg")),
                  _headercontainer(
                      "Experience",
                      "1000+",
                      const Color(0xffe80010).withOpacity(.15),
                      SvgPicture.asset("assets/experience.svg")),
                  _headercontainer(
                      "Ratings",
                      "4.5",
                      const Color(0xff682ffd).withOpacity(.15),
                      SvgPicture.asset("assets/students.svg")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

//Communication available for particular mentor
  Widget _communicationtile(String name, String details, SvgPicture icon) {
    return Row(
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
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Text(details),
          ],
        )
      ],
    );
  }

  Widget _headercontainer(
      String title, String count, Color color, SvgPicture icon) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            // border: Border.all(
            //   color: Color(0xff979797),
            // ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 25,
                color: Color(0xff6B779A).withOpacity(0.5),
              )
            ],
          ),
          child: Column(
            children: [
              //  style: TextStyles.title.subTitleColor)
              Text(
                count,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(50.0), // here the desired height
          //     child: AppBar(
          //       leading: const BackButtonCustom(),
          //     ))
          appBar: AppBar(
            title: Text(
              "",
              style: TextStyle(
                  color: const Color(0xff777A95).withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            leading: const BackButtonCustom(),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: CustomScrollView(
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
                          top: 20, right: 16, left: 16, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Mentor",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contribution. "),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Experience",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("10 years of experience in developement"),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Skill Set",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Flutter , Mysql,java , node js"),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Working Time",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Mon - Sat (08:30 AM - 09:00 PM)"),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Communication",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: _communicationtile(
                                "Messaging",
                                "Chat me up, share photos.",
                                SvgPicture.asset("assets/message.svg")),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatHome()));
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _communicationtile(
                              "Audio Call",
                              "Call your Mentor directly.",
                              SvgPicture.asset("assets/phone.svg")),
                          const SizedBox(
                            height: 20,
                          ),
                          _communicationtile(
                              "Video Call",
                              "See your Mentor live",
                              SvgPicture.asset("assets/video.svg")),
                          const SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                              minWidth: double.infinity,
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: const Text("Book Appointment"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textColor: Colors.white,
                              color: Color(0xffFDBA2F),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) =>
                                            BookAppointment()));
                              })
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

  @override
  MentorDetailVM create() => MentorDetailVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
