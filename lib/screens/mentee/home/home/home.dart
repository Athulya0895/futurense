import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/main.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat_home/chat_home.dart';
import 'package:futurensemobileapp/screens/mentee/forum/forum.dart';
import 'package:futurensemobileapp/screens/mentee/home/home/home_vm.dart';
import 'package:futurensemobileapp/screens/mentee/home/homepage_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/myaccount/myaccount.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/myappointments_mentee.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeMentee extends StatefulWidget {
  const HomeMentee({super.key});

  @override
  State<HomeMentee> createState() => _HomeMenteeState();
}

class _HomeMenteeState extends State<HomeMentee> with BasePage<HomeMenteeVM> {
  late PersistentTabController controller;
  Color mainColor = const Color(0xffFDBA2F);

  List<Widget> _buildScreens() {
    return [
      Zoom(jumbToIndex: jumbToIndex),
      ForumMentee(jumbToIndex: jumbToIndex),
      MyappointmentsMentee(
        jumbToIndex: jumbToIndex,
      ),
      ChatHome(
        jumbToindex: jumbToIndex,
      ),
      MyAccount(jumbToIndex: jumbToIndex),
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
    controller.jumpToTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          // drawer: ,
          body: PersistentTabView(
            MyApp.context,
            controller: controller,
            onItemSelected: (index) {
              setState(() {});
            },
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
            popAllScreensOnTapOfSelectedTab: true,
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
  HomeMenteeVM create() => HomeMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
