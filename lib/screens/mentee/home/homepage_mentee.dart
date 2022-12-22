import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/profile/profile_image.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';

import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/components/theme/theme.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

import 'package:futurensemobileapp/screens/auth/login/login.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentee/category/engagement_manager/engagement_manager.dart';
import 'package:futurensemobileapp/screens/mentee/category/mental_wellbeing/mental_wellbeing.dart';
import 'package:futurensemobileapp/screens/mentee/category/technical_assistance/technical_assistance.dart';

import 'package:futurensemobileapp/screens/mentee/home/homepage_mentee_vm.dart';
import 'package:futurensemobileapp/screens/mentee/home/widget/search_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/mentor_list.dart';

import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/upcoming_appointments_mentee/upcoming_appointments_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/widgets/view_detail.dart';
import 'package:futurensemobileapp/screens/mentee/notification/notification.dart';
import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference.dart';
import 'package:futurensemobileapp/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../utils/locator.dart';
import '../../../utils/share_prefs.dart';

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatefulWidget {
  final jumbToIndex; //for changing the bottom navigation index
  const Zoom({Key? key, this.jumbToIndex}) : super(key: key);

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      // showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      // angle: 0.0,
      menuBackgroundColor: const Color(0xffFDBA2F),
      mainScreen: const Body(),
      menuScreen: Theme(
        data: ThemeData.dark(),
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
                          ProfileImage(locator<SharedPrefs>().user?.profilePic),
                          const SizedBox(height: 5),
                          Text(
                            locator<SharedPrefs>()
                                    .user
                                    ?.mentorFirstName
                                    .toString() ??
                                "",
                            style: TextStyles.titleM,
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
                    leading: const Icon(
                      Icons.home,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      z.close!();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/appointment.svg"),
                    title: const Text('My Meetings'),
                    onTap: () {
                      widget.jumbToIndex(2);
                    },
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
                    leading: const Icon(
                      Icons.notifications,
                    ),
                    title: const Text('Notifications'),
                    onTap: () {
                      // NotificationMentor
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationMentee(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.note,
                    ),
                    title: const Text('Preferences'),
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const SetPrefrenceMentee(),
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
                    height: 90,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content:
                              const Text('Are you sure you want to\nLog Out ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'No'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                locator<SharedPrefs>().removeAll();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()),
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
    );
  }
}

//body
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    value: -1.0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageMentee(),
    );
  }
}

//Home Page design

class HomePageMentee extends StatefulWidget {
  const HomePageMentee({super.key});

  @override
  State<HomePageMentee> createState() => _HomePageMenteeState();
}

class _HomePageMenteeState extends State<HomePageMentee>
    with BasePage<HomePageMenteeVM> {
  int counter = 0;

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
                leading: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(5),
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
                          icon: const Icon(
                            Icons.notifications,
                            size: 30,
                            color: Color(0xffFDBA2F),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationMentee()));
                            setState(() {
                              // counter = 0;
                            });
                          }),
                      counter != 0
                          ? Positioned(
                              right: 11,
                              top: 11,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: const Color(0xff682FFD),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: const Color(0xffA0A2B3)
                                            .withOpacity(0.5))),
                                constraints: const BoxConstraints(
                                  minWidth: 14,
                                  minHeight: 14,
                                ),
                                child: Text(
                                  counter != 0 ? '$counter' : "",
                                  //  style: GoogleFonts.archivo(
                                  //     fontWeight: FontWeight.w700,
                                  //     fontSize: 18,
                                  //     color: Colors.black),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : const SizedBox()
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
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 20,
                    ),
                    _header(),
                    // _searchField(),
                    SearchMentee(topmentorlist: provider.topMentorList),
                    _category(),
                    _upcommingMeetings(),
                    // _questionAnswer()
                  ],
                ),
              ),
              _topmentorsList()
            ],
          ),
        )));
  }

  //header----------------------------------------------------------------

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          ProfileImage(provider.user?.profilePic.toString()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello, ${provider.user?.mentorFirstName.toString()} ${provider.user?.mentorLastName.toString()}",
                // style: TextStyle(
                //     fontFamily: "Helvetica",
                //     fontSize: 20,
                //     fontWeight: FontWeight.w600)
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "Welcome to the Futurense Family",
                // style: TextStyles.h1Style
                style: TextStyle(color: Color(0xff979797), fontSize: 14),
              ),
            ],
          ).p16,
        ],
      ),
    );
  }

//search-------------------------------------------------------------------------------------------

  //categories------------------------------------------------------------------

  Widget _category() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text("Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCardWidget(
                  "${provider.category?[2]?['Technical Assistance']} +\nMentors",
                  "Technical Assistance",
                  color: const Color(0xffFDBA2F),
                  lightColor: const Color(0xffFFC958), onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TechnicalAssistance()));
              }),
              _categoryCardWidget(
                  "${provider.category?[1]['Mental Well Being']} + \nMentors",
                  "Mental Well Being",
                  color: const Color(0xff90D8DC),
                  lightColor: const Color(0xff95E1E4), onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MentalWellBeing()));
              }),
              _categoryCardWidget(
                  "${provider.category?[0]['Engagement Manager']} +\nMentors",
                  "Your Engagement Manager",
                  color: const Color(0xffFFAA5F),
                  lightColor: const Color(0xffFFBC80), onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EngagementManager()));
              })
            ],
          ),
        ),
      ],
    );
  }

//Category Card widget--------------------------------------------------------------------

  Widget _categoryCardWidget(
    String title,
    String subtitle, {
    required Color color,
    required Color lightColor,
    required Function onpressed,
  }) {
    // TextStyle titleStyle = TextStyles.title.bold.white;
    // TextStyle subtitleStyle = TextStyles.body.bold.white;

    return AspectRatio(
      aspectRatio: 5.6 / 8,
      child: InkWell(
        child: Container(
            // height: 280,
            width: AppTheme.fullWidth(context) * .3,
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 10,
                  color: lightColor.withOpacity(.8),
                )
              ],
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -30,
                  right: -30,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 70,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Flexible(
                        child: Text(
                      "for",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    Flexible(
                        child: Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    )),
                  ],
                ).p16
              ],
            )),
        onTap: () {
          onpressed();
        },
      ),
    );
  }

//Questions and answers-------------------------------------------------------------------------

  Widget _questionAnswer() {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Questions & Answer", style: TextStyles.title.bold),
              TextButton(
                  onPressed: () {
                    //show mentor list
                  },
                  child: const Text(
                    "Explore",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .165,
          width: AppTheme.fullWidth(context),
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _questionCardWidget("what is Sap ?",
                    "SAP stands for System Applications and Products in Data Processing. ",
                    color: Colors.white);
              }),
        ),
      ],
    );
  }

  //Qusetion widget-------------------------------------------------------

  Widget _questionCardWidget(
    String name,
    String details, {
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      width: AppTheme.fullWidth(context) * .8,
      margin: const EdgeInsets.only(left: 15, right: 10, top: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: const Color(0xffFFD680), style: BorderStyle.solid),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 2),
            blurStyle: BlurStyle.inner,
            blurRadius: 6,
            spreadRadius: 1.5,
            color: Color(0xffFFD680),
          )
        ],
      ),
      child: Row(
        children: [
          const VerticalDivider(
            color: Color(0xff129A7F),
            thickness: 1,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.title.subTitleColor),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: AppTheme.fullWidth(context) * .6,
                child: Expanded(
                  child: Text(details,
                      maxLines: 4,
                      style: const TextStyle(
                          color: Color(0xffA0A2B3), fontSize: 12)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

//upcomming Meetings--------------------------------------------

  Widget _upcommingMeetings() {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text("Upcoming Meetings",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UpcomingAppointmentsMentee()));
                    // PersistentNavBarNavigator.pushNewScreen(context,
                    //     screen: UpcomingAppointmentsMentee(),
                    //     withNavBar: false,
                    //     pageTransitionAnimation: PageTransitionAnimation.fade);
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff682FFD)),
                  ))
            ],
          ),
        ),
        provider.confirmedupcomingmeetings.isNotEmpty
            ? SizedBox(
                height: AppTheme.fullHeight(context) * .140,
                width: AppTheme.fullWidth(context),
                child: ListView.builder(
                    itemCount: provider.confirmedupcomingmeetings.length,
                    // < 3
                    //     ? provider.confirmedupcomingmeetings.length
                    //     : 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UpcomingAppointmentsMentee()));
                        }),
                        child: _upcommingCardWidget(
                            provider.confirmedupcomingmeetings[index].userName
                                .toString(),
                            provider.confirmedupcomingmeetings[index]
                                .communicationMode
                                .toString(),
                            "${provider.confirmedupcomingmeetings[index].fromDate} - ${provider.confirmedupcomingmeetings[index].startTime}",
                            provider.confirmedupcomingmeetings[index].profilepic
                                .toString(),
                            const Color(0xffFFFFFF), () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return ViewDetail(
                                url: provider.confirmedupcomingmeetings[index]
                                    .profilepic,
                                meetingDetails:
                                    provider.confirmedupcomingmeetings[index],
                                buttonText1: "Reschedule",
                                buttonText1pressed: () {
                                  //reschedule meeting
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return Dialog(
                                            backgroundColor: Colors.white,
                                            elevation: 3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon:
                                                            Icon(Icons.close)),
                                                  ),
                                                  const Text(
                                                    "Reschedule",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFDBA2F),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  ListView(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                      provider.rescheduleCheckbox
                                                              .isNotEmpty
                                                          ? Wrap(
                                                              children: provider
                                                                  .rescheduleCheckbox
                                                                  .map(
                                                                    (area) =>
                                                                        IntrinsicWidth(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            180,
                                                                        // height: 40,
                                                                        child:
                                                                            InkWell(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Row(
                                                                              children: <Widget>[
                                                                                Checkbox(
                                                                                  activeColor: Color(0xffFDBA2F),
                                                                                  value: area["isChecked"],
                                                                                  onChanged: (value) {
                                                                                    setState(() => area["isChecked"] = value);
                                                                                    provider.currText = area['name'];
                                                                                    print(provider.currText);
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
                                                    padding: EdgeInsets.only(
                                                        left: 15, top: 15),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Share in detail",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff202020),
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    child: InputField(
                                                      maxline: 3,
                                                      // minline: 1,
                                                      hintText:
                                                          "write the reason for resheduling",
                                                      controller:
                                                          provider.about,

                                                      validation:
                                                          Validators.basic,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  MaterialButton(
                                                      color: Color(0xffFDBA2F),
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      // minWidth: 30,
                                                      // height: 30,
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 35,
                                                        right: 35,
                                                      ),
                                                      textColor: Colors.white,

                                                      // color: const Color(0xff6EBFC3),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(25.0),
                                                        ),
                                                        // side: BorderSide(color: Color(0xffFFAA5F), width: 1)
                                                      ),
                                                      child: const Text(
                                                        "Reschedule  ->",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        //go to reschedule page of particular mentor

                                                        print(
                                                            "go to reschedule page of particular mentor");

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        BookAppointment(
                                                                          topmentor:
                                                                              MentorModel(
                                                                            aboutYou:
                                                                                provider.confirmedupcomingmeetings[index].about,
                                                                            fName:
                                                                                provider.confirmedupcomingmeetings[index].userName,
                                                                            canHelpYou:
                                                                                provider.confirmedupcomingmeetings[index].canhelp,
                                                                            designationName:
                                                                                provider.confirmedupcomingmeetings[index].designtionName,
                                                                            id: provider.confirmedupcomingmeetings[index].userId,
                                                                            email:
                                                                                provider.confirmedupcomingmeetings[index].email,
                                                                            profilePic:
                                                                                provider.confirmedupcomingmeetings[index].profilepic,
                                                                          ),
                                                                          resheduleStatus:
                                                                              true,
                                                                          cancelReason:
                                                                              provider.currText,
                                                                          cancelDetail: provider
                                                                              .about
                                                                              .text,
                                                                          channelName: provider
                                                                              .confirmedupcomingmeetings[index]
                                                                              .channelName,
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
                              );
                            },
                          );
                        }),
                      );
                    }),
              )
            : Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffFFD551),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                      style: TextStyle(color: Color(0xffD8D8D8), fontSize: 12),
                    )
                  ],
                ),
              )
      ],
    );
  }

  //upcomming card widget--------------------------------------------------
  Widget _upcommingCardWidget(
    String name,
    String meetingType,
    String meetingDateTime,
    String profile,
    Color color,
    Function viewdetailsButton,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      // padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      width: AppTheme.fullWidth(context) * .58,
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
        children: [
          ProfileImage(profile),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("$name, $meetingType", style: const TextStyle(fontSize: 10)),
              const SizedBox(
                height: 5,
              ),
              Text(
                meetingDateTime,
                style: const TextStyle(fontSize: 10),
              ),

              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero,
                  // and this
                ),
                onPressed: () {
                  //upcoming meetings
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

              // Text(details)
            ],
          ),
        ],
      ),
    );
  }

  //top Mentors list-----------------------------------------------------------------

  Widget _topmentorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Top Mentors",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                TextButton(
                    onPressed: () {
                      //show mentor list
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorList(
                                  topmentorlists: provider.topMentorList)));
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff682FFD)),
                    ))
              ],
            ).hP16,
          ),
          _mentorWidgetList()
        ],
      ),
    );
  }

//Mentor List widet ----------------------------------------------------------------------------------

  Widget _mentorWidgetList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
      // implement GridView.builder
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: provider.topMentorList.length > 6
              ? 6
              : provider.topMentorList.length,
          shrinkWrap: true,
          physics:
              const ScrollPhysics(), //only five topmentors need to be displayed
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MentorDetails(
                            topmentor: provider.topMentorList[index])));
              }),
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    padding: const EdgeInsets.only(top: 10),
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
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileImage(provider.topMentorList[index].profilePic),
                        Text(
                          "${provider.topMentorList[index].fName.toString()} ${provider.topMentorList[index].lName.toString()}",
                          textAlign: TextAlign.center,
                        ),
                        Text(provider.topMentorList[index].designationName
                            .toString()),
                        Text(
                          provider.topMentorList[index].rating == null ||
                                  provider.topMentorList[index].reviews == null
                              ? "No Reviews"
                              : "⭐️ ${provider.topMentorList[index].rating.toString()}(${provider.topMentorList[index].reviews.toString()} reviews)",
                          style: const TextStyle(color: Color(0xffFD2FE2)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
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
    );
  }

  @override
  HomePageMenteeVM create() => HomePageMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
