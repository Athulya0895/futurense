import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';


import 'package:futurensemobileapp/screens/mentor/chat_mentor/chat_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/forum_mentor/forum_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home_vm.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount.dart';
import 'package:futurensemobileapp/screens/mentor/myappointments_mentor/myappointments_mentor.dart';

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
      ZoomMentor(
        jumbToIndex: jumbToIndex,
      ),
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

  //  bottomNavbartoShow(bool isBottomNavBarToBeShown){
  //   setState(() {
  //     return Container(
  //     height: 0.0,
  //   );
  //   });
  // }
  excludeBottomNavigationBar(var isBottomNavBarToBeShown) {
    controller.jumpToTab(isBottomNavBarToBeShown);
  }

  @override
  Widget build(BuildContext context) {
    var isBottomNavBarToBeShown;
    return builder((() => Scaffold(
          // appBar: AppBar(
          //   // title: const Text("Persistent Bottom Nav Bar"),
          //   elevation: 0,
          //   // backgroundColor: mainColor,
          // ),
          body: PersistentTabView(
            context,
            controller: controller,
            onItemSelected: (index) {
              setState(() {});
            },
            // hideNavigationBar: isBottomNavBarToBeShown,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: controller.index == 0 ? false : true,
            hideNavigationBarWhenKeyboardShows: true,
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
