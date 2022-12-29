import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/main.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment.dart';
import 'package:futurensemobileapp/screens/mentor/chat_mentor/chat_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/forum_mentor/forum_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home_vm.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/myappointments_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/upcoming_meeting_mentor/upcomming_meeting_mentor_vm.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with BasePage<HomeVM> {
  late PersistentTabController controller;
  Color mainColor = const Color(0xffFDBA2F);

  List<Widget> _buildScreens() {
    return [
      ZoomMentor(jumbToIndex: jumbToIndex),
      // HomepageMentor(jumbToIndex: jumbToIndex),
      ForumMentor(
        jumbToIndex: jumbToIndex,
      ),
      MyappointmentsMentor(
        jumbToIndex: jumbToIndex,
      ),
      ChatMentor(jumbToIndex: jumbToIndex),
      MentorMyaccount(jumbToIndex: jumbToIndex),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset('assets/home.svg'),
        icon: SvgPicture.asset('assets/homefilled.svg'),
        title: ("Home"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset('assets/forums.svg'),
        icon: SvgPicture.asset('assets/forumfilled.svg'),
        title: ("Forum"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset('assets/myappointments.svg'),
        icon: SvgPicture.asset('assets/myappointmentfilled.svg'),
        title: ("Meetings"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset('assets/chats.svg'),
        icon: SvgPicture.asset('assets/chatfilled.svg'),
        title: ("Chat"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset('assets/profile.svg'),
        icon: SvgPicture.asset('assets/profilefilled.svg'),
        title: ("Profile"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      // PersistentBottomNavBarItem(
      //   iconSize: 50,
      //   icon: Container(
      //     // height: 50,
      //     // width: 50,
      //     padding: EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: Color(0xffE7CBCB).withOpacity(0.2),
      //     ),

      //     child: SvgPicture.asset(
      //       'assets/home.svg',
      //       color:
      //           controller.index == 0 ? Color(0xffFDBA2F) : Color(0xff979797),
      //     ),
      //   ),
      //   title: ("HOME"),
      //   activeColorPrimary: const Color(0xffFDBA2F),
      //   inactiveColorPrimary: Color(0xff979797),
      // ),
      // PersistentBottomNavBarItem(
      //   iconSize: 50,
      //   icon: Container(
      //     height: 50,
      //     width: 50,
      //     padding: EdgeInsets.all(5),
      //     decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Color(0xffE7CBCB).withOpacity(0.2)),
      //     child: controller.index == 1
      //         ? SvgPicture.asset(
      //             'assets/forumfilled.svg',
      //             color:
      //                 controller.index == 1 ? Color(0xffFDBA2F) : Colors.grey,
      //           )
      //         : SvgPicture.asset(
      //             'assets/forums.svg',
      //             color:
      //                 controller.index == 1 ? Color(0xffFDBA2F) : Colors.grey,
      //           ),
      //   ),
      //   title: ("FORUM"),
      //   activeColorPrimary: Color(0xffFDBA2F),
      //   inactiveColorPrimary: Color(0xff979797),
      // ),
      // PersistentBottomNavBarItem(
      //   iconSize: 50,
      //   icon: Container(
      //     height: 50,
      //     width: 50,
      //     padding: EdgeInsets.all(5),
      //     decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Color(0xffE7CBCB).withOpacity(0.2)),
      //     child: controller.index == 2
      //         ? SvgPicture.asset(
      //             'assets/myappointmentfilled.svg',
      //             color:
      //                 controller.index == 2 ? Color(0xffFDBA2F) : Colors.grey,
      //           )
      //         : SvgPicture.asset(
      //             'assets/myappointments.svg',
      //             color:
      //                 controller.index == 2 ? Color(0xffFDBA2F) : Colors.grey,
      //           ),
      //   ),
      //   title: ("MY MEETINGS"),
      //   activeColorPrimary: Color(0xffFDBA2F),
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
      // PersistentBottomNavBarItem(
      //   iconSize: 50,
      //   icon: Container(
      //     height: 50,
      //     width: 50,
      //     padding: EdgeInsets.all(5),
      //     decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Color(0xffE7CBCB).withOpacity(0.2)),
      //     child: controller.index == 3
      //         ? SvgPicture.asset(
      //             'assets/chatfilled.svg',
      //             color:
      //                 controller.index == 3 ? Color(0xffFDBA2F) : Colors.grey,
      //           )
      //         : SvgPicture.asset(
      //             'assets/chats.svg',
      //             color: controller.index == 3
      //                 ? Color(0xffFDBA2F)
      //                 : Color(0xff979797),
      //           ),
      //   ),
      //   title: ("CHAT"),
      //   activeColorPrimary: Color(0xffFDBA2F),
      //   inactiveColorPrimary: Color(0xff979797),
      // ),
      // PersistentBottomNavBarItem(
      //   iconSize: 50,
      //   icon: Container(
      //     // height: 50,
      //     // width: 50,
      //     padding: EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Color(0xffE7CBCB).withOpacity(0.2)),
      //     child: controller.index == 4
      //         ? SvgPicture.asset(
      //             'assets/profilefilled.svg',
      //             color:
      //                 controller.index == 4 ? Color(0xffFDBA2F) : Colors.grey,
      //           )
      //         : SvgPicture.asset(
      //             'assets/profile.svg',
      //             color: controller.index == 4
      //                 ? Color(0xffFDBA2F)
      //                 : Color(0xff979797),
      //           ),
      //   ),
      //   title: ("PROFILE"),
      //   activeColorPrimary: Color(0xffFDBA2F),
      //   inactiveColorPrimary: Color(0xff979797),
      // ),
    ];
  }

  @override
  void initState() {
    controller = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  void jumpToTest() {
    controller.jumpToTab(2);
    setState(() {});
  }

  void jumbToIndex(int index) {
    setState(() {
      controller.jumpToTab(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          // appBar: AppBar(
          //   // title: const Text("Persistent Bottom Nav Bar"),
          //   elevation: 0,
          //   // backgroundColor: mainColor,
          // ),
          body: PersistentTabView(
            MyApp.context,
            controller: controller,
            onItemSelected: (index) {
              setState(() {});
            },
            screens: _buildScreens(),
            items: _navBarsItems(),
            // confineInSafeArea: true,
            // backgroundColor: Colors.white,
            // handleAndroidBackButtonPress: true,
            // resizeToAvoidBottomInset: true,
            // stateManagement: true,
            // hideNavigationBarWhenKeyboardShows: true,
            // navBarHeight: 90,
            decoration: const NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              colorBehindNavBar: Colors.white,
              // border: Border.all(color: Color(0xffFDBA2F))
              boxShadow: [
                BoxShadow(
                    color: Color(0xffFFD680),
                    spreadRadius: 0.5,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.normal),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: false,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
          ),
        )));
  }

  @override
  HomeVM create() => HomeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
