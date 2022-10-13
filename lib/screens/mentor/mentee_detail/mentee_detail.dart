import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentor/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentor/mentee_detail/mentee_detail_vm.dart';

class MenteeDetail extends StatefulWidget {
  const MenteeDetail({super.key});

  @override
  State<MenteeDetail> createState() => _MenteeDetailState();
}

class _MenteeDetailState extends State<MenteeDetail>
    with BasePage<MenteeDetailVM> {
//to showmore
  late String firstHalf;
  late String secondHalf;
  bool flag = true;
  String text =
      "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contri.";
  @override
  void initState() {
    super.initState();

    if (text.length > 50) {
      firstHalf = text.substring(0, 50);
      secondHalf = text.substring(50, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
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
                title: const Text(
                  "Bellamy N",
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
                            "About Mentee",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
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
                            child: secondHalf.isEmpty
                                ? Text(firstHalf)
                                : Column(
                                    children: <Widget>[
                                      Text(flag
                                          ? (firstHalf + "...")
                                          : (firstHalf + secondHalf)),
                                      InkWell(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              flag ? "View more " : "show less",
                                              style: const TextStyle(
                                                  color: Color(0xffFDBA2F),
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            flag = !flag;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                          ),
                          // const Text(
                          //     "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contri... "),
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
                            "Looking for mentorship in",
                            style: TextStyles.title.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              "Bellamy Nicholas is a top mentor at London Bridge Univercity at London. He has achieved several awards and recognition for is contri."),
                          const SizedBox(
                            height: 20,
                          ),

                          Text(
                            "Preffered Communication",
                            style: TextStyles.title.bold,
                          ),
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
                          MaterialButton(
                              minWidth: double.infinity,
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: const Text("Set Meeting"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textColor: Colors.white,
                              color: const Color(0xffFDBA2F),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) =>
                                            BookAppointmentMentor()));
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

//header details of mentee
  Widget headerdetailmentor() {
    return Column(
      children: [
        Container(
          // height: 300,
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.only(bottom: 20),
          width: MediaQuery.of(context).size.width * 1.5,
          decoration: BoxDecoration(
              // color: Colors.yellow,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xff7AC4C8).withOpacity(0.5),
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
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  child: SizedBox(
                    // height: 40,
                    // width: 40,

                    child:
                        Image.asset("assets/professor.png", fit: BoxFit.fill),
                  ),
                ).p(8),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Bellamy N",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Junior Developer at ABC Pvt. Ltd",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "bellamyN@futurense.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff7AC4C8)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _headercontainer(
                        "Experience",
                        "1000+",
                        const Color(0xffe80010).withOpacity(.15),
                        SvgPicture.asset("assets/experience.svg")),
                    _headercontainer(
                        "Reviews",
                        "4.5,13+",
                        const Color(0xff682ffd).withOpacity(.15),
                        SvgPicture.asset("assets/students.svg")),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

//details about mentee
// Widget _menteeDetails(){
//   return
// }

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
  MenteeDetailVM create() => MenteeDetailVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
