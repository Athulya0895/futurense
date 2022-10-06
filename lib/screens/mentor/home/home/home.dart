import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment.dart';
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

  List<Widget> _buildScreens() {
    return [
      const ZoomMentor(),
      const ForumMentor(),
      const ChatMentor(),
      const MyappointmentsMentor(),
      const MentorMyaccount(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffE7CBCB),
          ),
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/home.svg',
            color: controller.index == 0 ? Color(0xffFDBA2F) : Colors.grey,
          ),
        ),
        title: ("HOME"),
        activeColorPrimary: Color(0xffFDBA2F),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xffE7CBCB)),
          child: SvgPicture.asset(
            'assets/forums.svg',
            color: controller.index == 1 ? Color(0xffFDBA2F) : Colors.grey,
          ),
        ),
        title: ("FORUMS"),
        activeColorPrimary: Color(0xffFDBA2F),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/chats.svg',
          color: controller.index == 2 ? Color(0xffFDBA2F) : Colors.grey,
        ),
        title: ("CHATS"),
        activeColorPrimary: Color(0xffFDBA2F),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/myappointments.svg',
          color: controller.index == 3 ? Color(0xffFDBA2F) : Colors.grey,
        ),
        title: ("MY APPOINTMENTS"),
        activeColorPrimary: Color(0xffFDBA2F),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/profile.svg',
          color: controller.index == 4 ? Color(0xffFDBA2F) : Colors.grey,
        ),
        title: ("PROFILE"),
        activeColorPrimary: Color(0xffFDBA2F),
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

  @override
  Widget build(BuildContext context) {
    return builder((() => PersistentTabView(
          context,
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
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
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
          navBarStyle: NavBarStyle.style12,
        )));
  }

  @override
  HomeVM create() => HomeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
