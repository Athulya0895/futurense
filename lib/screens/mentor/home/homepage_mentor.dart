import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/components/theme/theme.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/agora_video/src/pages/call.dart';
import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/view_detail.dart';
import 'package:futurensemobileapp/screens/mentee/review_feedback/feedback.dart';
import 'package:futurensemobileapp/screens/mentor/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor_vm.dart';
import 'package:futurensemobileapp/screens/mentor/home/widgets/advertisment.dart';
import 'package:futurensemobileapp/screens/mentor/home/widgets/header.dart';
import 'package:futurensemobileapp/screens/mentor/home/widgets/search.dart';
import 'package:futurensemobileapp/screens/mentor/mentee%20list/mentee_list.dart';
import 'package:futurensemobileapp/screens/mentor/mentee_detail/mentee_detail.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/upcoming_meeting_mentor/upcomming_meeting_mentor_vm.dart';
import 'package:futurensemobileapp/screens/mentor/notification/notification_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/setPreference/setpreference.dart';
import 'package:futurensemobileapp/utils/validators.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../utils/locator.dart';
import '../../../utils/share_prefs.dart';


final ZoomDrawerController z = ZoomDrawerController();

//Drawer zoom design
class ZoomMentor extends StatefulWidget {
  final jumbToIndex;
  // final bool isBottomNavBarToBeShown;
  const ZoomMentor({
    Key? key,
    required this.jumbToIndex,
  }) : super(key: key);

  @override
  _ZoomMentorState createState() => _ZoomMentorState();
}

class _ZoomMentorState extends State<ZoomMentor>
    with BasePage<HomePageMentorVM> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return builder(() => ZoomDrawer(
          controller: z,
          style: DrawerStyle.defaultStyle,
          // style: DrawerStyle.style1,

          // menuScreenTapClose: false,
          // androidCloseOnBackTap: true,
          // isRtl: ,
          mainScreenTapClose: true,

          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.bounceIn,
          slideWidth: MediaQuery.of(context).size.width * 0.68,
          duration: const Duration(milliseconds: 500),

          borderRadius: 24.0,
          // showShadow: true,

          angle: -5.0,

          // slideWidth: MediaQuery.of(context).size.width *
          //     (ZoomDrawer.isRTL() ? .45 : 0.65),
          menuBackgroundColor: const Color(0xffFDBA2F),
          mainScreen: const HomepageMentor(),
          menuScreen: Theme(
            data: ThemeData.dark(),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: const Color(0xffFDBA2F),
                body: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Center(
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: [
                        InkWell(
                          child: DrawerHeader(
                            decoration: const BoxDecoration(
                                // color: Colors.blue,
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileImage(url: provider.user?.profilePic),
                                const SizedBox(height: 10),
                                Text(
                                  "${provider.user?.mentorFirstName.toString()} ${provider.user?.mentorLastName.toString()}",
                                  style:const TextStyle(fontSize: 18),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                          onTap: () {
                            z.close!();
                            widget.jumbToIndex(4);
                          },
                        ),
                        ListTile(
                          leading: Container(
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.home,
                            ),
                          ),
                          title: const Text('Home', maxLines: 1),
                          onTap: () {
                            z.close!();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Container(
                              padding:const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child:
                                  SvgPicture.asset("assets/appointment.svg")),
                          title: const Text(
                            'My Meetings',
                            maxLines: 1,
                          ),
                          onTap: () {
                            widget.jumbToIndex(2);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // ListTile(
                        //   leading: SvgPicture.asset(
                        //     "assets/forumfilled.svg",
                        //     color: Colors.white,
                        //   ),
                        //   title: const Text('Forum'),
                        //   onTap: () {
                        //     widget.jumbToIndex(1);
                        //   },
                        // ),
                        // ListTile(
                        //   leading: const Icon(
                        //     Icons.message,
                        //   ),
                        //   title: const Text('Messages'),
                        //   onTap: () {
                        //     widget.jumbToIndex(3);
                        //     // Navigator.pop(context);
                        //   },
                        // ),
                        ListTile(
                          leading: Container(
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.notifications,
                            ),
                          ),
                          title: const Text(
                            'Notifications',
                            maxLines: 1,
                          ),
                          onTap: () {
                            // NotificationMentor
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>const NotificationMentor(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Container(
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.note,
                            ),
                          ),
                          title: const Text(
                            'Preferences',
                            maxLines: 1,
                          ),
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen:const SetPreferenceMentor(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SetPreferenceMentor(),
                            //   ),
                            // );
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const SetPreferenceMentor(),
                            //     ),
                            //     (route) => false);
                          },
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        // const Expanded(child: SizedBox()),
                        ListTile(
                          leading: Container(
                              padding:const EdgeInsets.all(10),
                              child: const Icon(Icons.logout)),
                          title: const Text(
                            'Log Out',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text(
                                    'Are you sure you want to\nLog Out ?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'No'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      locator<SharedPrefs>().removeAll();
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()),
                                          (route) => false);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  HomePageMentorVM create() => HomePageMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}

//Homepage Design
class HomepageMentor extends StatefulWidget {
  final jumbToIndex;

  const HomepageMentor({super.key, this.jumbToIndex});

  @override
  State<HomepageMentor> createState() => _HomepageMentorState();
}

class _HomepageMentorState extends State<HomepageMentor>
    with BasePage<HomePageMentorVM> {
  int counter = 0;
  //to implement bottom navigation bar
  late PersistentTabController _controller;
  late bool _hideNavBar;
  @override
  Widget build(BuildContext context) {
    return builder((() => WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
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
                  leading: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(5),
                      // width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffFDBA2F)),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      z.toggle!();
                    },
                  ),
                  actions: [
                    // Using Stack to show Notification Badge
                    Stack(
                      children: <Widget>[
                        IconButton(
                            // padding: EdgeInsets.all(10),
                            // color: Colors.red,

                            icon: Container(
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffFDBA2F)),
                                child: SvgPicture.asset('assets/bell.svg')),
                            //  const Icon(
                            //   Icons.notifications,
                            //   size: 30,
                            //   color: Color(0xffFDBA2F),
                            // ),
                            onPressed: () async {
                              setState(() {
                                // counter = 0;
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationMentor(),
                                ),
                              );
                              provider.checkNewNotification();
                            }),
                        provider.count != "0"
                            ? Positioned(
                                right: 11,
                                top: 11,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff682FFD),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color(0xffA0A2B3)
                                              .withOpacity(0.5))),
                                  constraints: const BoxConstraints(
                                    minWidth: 15,
                                    minHeight: 15,
                                  ),
                                  child: Text(
                                    provider.count ?? "0",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            :const SizedBox()
                      ],
                    ),
                  ],
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
                      const SizedBox(height: 10),
                      Header(user: provider.user),
                      Search(topmenteelist: provider.topMenteeList),
                      Advertisment(totalMentees: provider.topMenteeList.length),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 16, left: 16, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text("Upcoming Meetings",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18)),
                            TextButton(
                                onPressed: () {
                                  //upcoming Meetings received confirmed list
                                  provider.confirmedupcomingmeetings.isNotEmpty
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 const UpcomingMeetingMentor()))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                const  MenteeList()));
                                },
                                child: Text(
                                  provider.confirmedupcomingmeetings.isNotEmpty
                                      ? "View All"
                                      : "Schedule",
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff682FFD)),
                                ))
                          ],
                        ),
                      ),
                      provider.confirmedupcomingmeetings.isNotEmpty
                          ? SizedBox(
                              height: AppTheme.fullHeight(context) * .120,
                              width: AppTheme.fullWidth(context),
                              child: ListView.builder(
                                  itemCount:
                                      provider.confirmedupcomingmeetings.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                  const  UpcomingMeetingMentor()));
                                      }),
                                      child: _upcommingCardWidget(
                                          provider
                                              .confirmedupcomingmeetings[index]
                                              .userName
                                              .toString(),
                                          provider
                                              .confirmedupcomingmeetings[index]
                                              .communicationMode
                                              .toString(),
                                          "${provider.confirmedupcomingmeetings[index].fromDate} ${provider.confirmedupcomingmeetings[index].startTime}",
                                          // provider.confirmedupcomingmeetings[index].fromDate
                                          //     .toString(),
                                          provider
                                              .confirmedupcomingmeetings[index]
                                              .profilepic
                                              .toString(),
                                          const Color(0xffFFFFFF), () {
                                        showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ViewDetail(
                                              url: provider
                                                  .confirmedupcomingmeetings[
                                                      index]
                                                  .profilepic,
                                              meetingDetails: provider
                                                      .confirmedupcomingmeetings[
                                                  index],
                                              viewStatus: provider
                                                          .confirmedupcomingmeetings[
                                                              index]
                                                          .status ==
                                                      'Received'
                                                  ? "Scheduled on time"
                                                  : "Meeting Rescheduled to ${provider.confirmedupcomingmeetings[index].fromDate} - ${provider.confirmedupcomingmeetings[index].startTime}",
                                              viewStatusColor:
                                                 const Color(0xff32CD32),
                                              buttonText2: "",
                                              buttonText1: "Reschedule",
                                              buttonText1pressed: () {
                                                //reschedule meeting
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return StatefulBuilder(
                                                          builder: (context,
                                                              setState) {
                                                        return Dialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          insetPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                          elevation: 3,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child: IconButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      icon:const Icon(Icons.close)),
                                                                ),
                                                                const Text(
                                                                  "Reschedule",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffFDBA2F),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                ListView(
                                                                  physics:
                                                                    const  NeverScrollableScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  children: <
                                                                      Widget>[
                                                                    provider.rescheduleCheckbox
                                                                            .isNotEmpty
                                                                        ? Wrap(
                                                                            children: provider.rescheduleCheckbox
                                                                                .map(
                                                                                  (area) => IntrinsicWidth(
                                                                                    child: SizedBox(
                                                                                      width: 180,
                                                                                      // height: 40,
                                                                                      child: InkWell(
                                                                                        child: Center(
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              Checkbox(
                                                                                                activeColor:const Color(0xffFDBA2F),
                                                                                                value: area["isChecked"],
                                                                                                onChanged: (value) {
                                                                                                  setState(() => area["isChecked"] = value);
                                                                                                  provider.currText = area['name'];
                                                                                                  // print(provider.currText);
                                                                                                },
                                                                                              ),
                                                                                              Expanded(
                                                                                                  child: Text(
                                                                                                area["name"],
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                                .toList(),
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              15,
                                                                          top:
                                                                              15),
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Text(
                                                                      "Share in detail",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xff202020),
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                                  child:
                                                                      InputField(
                                                                    maxline: 3,
                                                                    // minline: 1,
                                                                    hintText:
                                                                        "write the reason for resheduling",
                                                                    controller:
                                                                        provider
                                                                            .about,

                                                                    validation:
                                                                        Validators
                                                                            .basic,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                MaterialButton(
                                                                    color:const Color(
                                                                        0xffFDBA2F),
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .shrinkWrap,
                                                                    // minWidth: 30,
                                                                    // height: 30,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 35,
                                                                      right: 35,
                                                                    ),
                                                                    textColor:
                                                                        Colors
                                                                            .white,

                                                                    // color: const Color(0xff6EBFC3),
                                                                    shape:
                                                                        const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            25.0),
                                                                      ),
                                                                      // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Reschedule",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      //go to reschedule page of particular mentor

                                                                      // print(
                                                                      //     "go to reschedule page of particular mentor");

                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => BookAppointmentMentor(
                                                                                    mentor: MentorModel(
                                                                                      aboutYou: provider.confirmedupcomingmeetings[index].about,
                                                                                      fName: provider.confirmedupcomingmeetings[index].userName,
                                                                                      canHelpYou: provider.confirmedupcomingmeetings[index].canhelp,
                                                                                      designationName: provider.confirmedupcomingmeetings[index].designtionName ?? "-",
                                                                                      id: provider.confirmedupcomingmeetings[index].userId,
                                                                                      email: provider.confirmedupcomingmeetings[index].email,
                                                                                      profilePic: provider.confirmedupcomingmeetings[index].profilepic,
                                                                                    ),
                                                                                    resheduleStatus: true,
                                                                                    cancelReason: provider.currText,
                                                                                    cancelDetail: provider.about.text,
                                                                                    channelName: provider.confirmedupcomingmeetings[index].channelName,
                                                                                  )));
                                                                    }),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    });
                                              },
                                              //video call icon
                                              icon: provider
                                                          .confirmedupcomingmeetings[
                                                              index]
                                                          .communicationMode ==
                                                      "Audio Call"
                                                  ? "assets/call.svg"
                                                  : "assets/videocall.svg",
                                              iconbuttonPressed: () {
                                                // print(
                                                //     "pressed videocall by mentor");
                                                //video call agora
                                                // print("channel Name mentor");
                                                // print(provider
                                                //     .confirmedupcomingmeetings[
                                                //         index]
                                                //     .channelName);
                                                // print("channel Name mentor");
                                                provider
                                                            .confirmedupcomingmeetings[
                                                                index]
                                                            .canJoin ==
                                                        true
                                                    ? onJoin(provider
                                                            .confirmedupcomingmeetings[
                                                        index])
                                                    : Fluttertoast.showToast(
                                                        msg:
                                                            "Your meeting is not yet started. Wait for your scheduled time",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                        );
                                      }),
                                    );
                                  }),
                            )
                          : Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:const Color(0xffFFD551),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              padding:const EdgeInsets.only(top: 15, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Start scheduling your meetings!",
                                    style: TextStyle(
                                        color: Color(0xffFDBA2F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "No upcoming meetings to show",
                                    style: TextStyle(
                                        color: Color(0xffD8D8D8), fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                      // _questionAnswer(),
                    ],
                  ),
                ),
                _topmenteelist(),
              ],
            ),
          ),
        )));
  }

  //upcomming card widget
  Widget _upcommingCardWidget(
    String name,
    String meetingType,
    String meetingDateTime,
    String profile,
    Color color,
    Function viewdetailsButton,
  ) {
    return Container(
      padding:const EdgeInsets.only(left: 10),
      width: AppTheme.fullWidth(context) * .60,
      margin: const EdgeInsets.only(left: 15, right: 10, top: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: const Color(0xffFFD551), width: 1, style: BorderStyle.solid),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 2),
            blurRadius: 3,
            color: const Color(0xffA0A2B3).withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImage(
            url: profile,
            heighturl: 46,
            widthurl: 46,
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding:const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("$name, $meetingType",
                //     style: const TextStyle(fontSize: 12)),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: name.length < 16
                        ? "$name,"
                        : "${name.substring(0, 16)}..,",
                    style: const TextStyle(
                        color: Color(0xff202020),
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500),
                    children: <InlineSpan>[
                      const WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: SizedBox(width: 3)),
                      TextSpan(
                          text: meetingType,
                          style: const TextStyle(
                              color: Color(0xff6EBFC3),
                              fontWeight: FontWeight.w300,
                              fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  meetingDateTime,
                  style: const TextStyle(fontSize: 10),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero, // Set this
                    padding:const EdgeInsets.all(0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                    // and this
                  ),
                  onPressed: () {
                    viewdetailsButton();
                  },
                  child: const Text(
                    "View details",
                    style: TextStyle(
                        color: Color(
                          0xffFD2FE2,
                        ),
                        fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Questions and answers

  // Widget _questionAnswer() {
  //   return Column(
  //     children: <Widget>[
  //       Padding(
  //         padding:
  //             const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             Text("Questions & Answer", style: TextStyles.title.bold),
  //             TextButton(
  //                 onPressed: () {
  //                   //show mentor list
  //                 },
  //                 child: const Text(
  //                   "Explore",
  //                   style: TextStyle(
  //                       decoration: TextDecoration.underline,
  //                       color: Color(0xff682FFD)),
  //                 ))
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: AppTheme.fullHeight(context) * .2,
  //         width: AppTheme.fullWidth(context),
  //         child: ListView.builder(
  //             itemCount: 5,
  //             scrollDirection: Axis.horizontal,
  //             itemBuilder: (BuildContext context, int index) {
  //               return _questionCardWidget("what is Sap ?",
  //                   "SAP stands for System Applications and Products in Data Processing. ",
  //                   color: Colors.white);
  //             }),
  //       ),
  //     ],
  //   );
  // }

  //Qusetion widget

  // Widget _questionCardWidget(
  //   String name,
  //   String details, {
  //   required Color color,
  // }) {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
  //     width: AppTheme.fullWidth(context) * .8,
  //     margin: const EdgeInsets.only(
  //       left: 15,
  //       right: 10,
  //     ),
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: const BorderRadius.all(Radius.circular(10)),
  //       border: Border.all(
  //           color: const Color(0xffFFD680), style: BorderStyle.solid),
  //       boxShadow: const <BoxShadow>[
  //         BoxShadow(
  //           offset: Offset(0, 2),
  //           blurStyle: BlurStyle.inner,
  //           blurRadius: 6,
  //           spreadRadius: 1.5,
  //           color: Color(0xffFFD680),
  //         )
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         const VerticalDivider(
  //           color: Color(0xff129A7F),
  //           thickness: 1,
  //         ),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(name, style: TextStyles.title.subTitleColor),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             SizedBox(
  //               width: AppTheme.fullWidth(context) * .6,
  //               child: Text(details,
  //                   maxLines: 4,
  //                   style: const TextStyle(
  //                     color: Color(0xffA0A2B3),
  //                   )),
  //             )
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _topmenteelist() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              const  Text("Onboarded Mentees",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                TextButton(
                  onPressed: () {
                    //show mentee list
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MenteeList()));
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff682FFD)),
                  ),
                )
              ],
            ),
          ),
          // getmentorWidgetList()
          _menteeWidgetList(),
        ],
      ),
    );
  }

  //mentee widget list
  Widget _menteeWidgetList() {
   
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
      // implement GridView.builder
      child: SizedBox(
        // height: 500,
        child: GridView.builder(
            shrinkWrap: true,
            physics:const ScrollPhysics(),
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              // childAspectRatio: 3 / 3.9,
              childAspectRatio:
                  ((MediaQuery.of(context).size.width / 2) - 30) / 210,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: provider.topMenteeList.length > 6
                ? 6
                : provider.topMenteeList.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenteeDetail(
                              topmentor: provider.topMenteeList[index])));
                }),
                child: Stack(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 200,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color(0xff979797).withOpacity(0.1)),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 6,
                            spreadRadius: 1.5,
                            color: Color(0xffFFD680),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const SizedBox(height: 10),
                          ProfileImage(
                              url: provider.topMenteeList[index].profilePic),

                          const SizedBox(height: 8),
                          Text(
                            "${provider.topMenteeList[index].fName.toString()} ${provider.topMenteeList[index].lName.toString()}",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                color: Color(0xff222B45),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            provider.topMenteeList[index].designationName
                                .toString(),
                            style: const TextStyle(
                                color: Color(0xff6B779A), fontSize: 10),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                              provider.topMenteeList[index].rating == "0" ||
                                      provider.topMenteeList[index].reviews ==
                                          "0"
                                  ? "No Reviews"
                                  : "⭐️ ${provider.topMenteeList[index].rating.toString()}(${provider.topMenteeList[index].reviews.toString()} reviews)",
                              style: const TextStyle(
                                  color: Color(0xffFD2FE2), fontSize: 10)),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   bottom: 5,
                    //   right: 40,
                    //   child: Center(
                    //     child: Container(
                    //       padding: const EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color: const Color(0xff6EBFC3),
                    //       ),
                    //       child: const Text(
                    //         "View More",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // )
                    Positioned(
                      bottom: -1,
                      right: 40,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff6EBFC3),
                        ),
                        child: const Text(
                          "View More",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

//join call
  Future<void> onJoin(MeetingModel? mentor) async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    // print("agora token");
    // print(mentor?.agoraToken);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: mentor?.channelName,
          tokenAgora: mentor?.agoraToken,
          userRole: "mentor",
          role: ClientRole.Broadcaster,
          mentor: mentor,
          meetingMode: mentor?.communicationMode,
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hey ,'), // To display the title it is optional
            content: const Text(
                'Did you want to continue the call Click on Resume.or else click on Sharefeedback'), // Message which will be pop up on the screen
            // Action widget which will provide the user to acknowledge the choice
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color:const Color(0xffFDBA2F),
                // FlatButton widget is used to make a text to work like a button
                textColor: Colors.white,
                onPressed: () {
                  // print(" Resume call");
                  // print(mentor?.agoraToken);
                  // print("________");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallPage(
                        channelName: mentor?.channelName,
                        tokenAgora: mentor?.agoraToken,
                        userRole: "mentor",
                        role: ClientRole.Broadcaster,
                        mentor: mentor,
                        meetingMode: mentor?.communicationMode,
                      ),
                    ),
                  );
                }, // function used to perform after pressing the button
                child:const Text('Resume call'),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.redAccent,
                textColor: Colors.white,
                onPressed: () {
                  //Go to feedback page make it must type
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FeedbackPage(
                                mentor: mentor,
                                role: "mentor",
                              )));
                },
                child:const Text('End Call'),
              ),
            ],
          );
        });
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    // print(status);
  }

  @override
  HomePageMentorVM create() => HomePageMentorVM();

  @override
  void initialise(BuildContext context) {}
}
