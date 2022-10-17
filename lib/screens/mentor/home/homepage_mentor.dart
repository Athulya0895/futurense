import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/components/theme/theme.dart';
import 'package:futurensemobileapp/screens/mentor/home/homepage_mentor_vm.dart';
import 'package:futurensemobileapp/screens/mentor/mentee%20list/mentee_list.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final ZoomDrawerController z = ZoomDrawerController();

//Drawer zoom design
class ZoomMentor extends StatefulWidget {
  const ZoomMentor({Key? key}) : super(key: key);

  @override
  _ZoomMentorState createState() => _ZoomMentorState();
}

class _ZoomMentorState extends State<ZoomMentor> {
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
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13)),
                            child: SizedBox(
                              // height: 40,
                              // width: 40,

                              child: Image.asset("assets/profile.png",
                                  fit: BoxFit.fill),
                            ),
                          ).p(8),
                          // SizedBox(
                          //   width: 80,
                          //   height: 80,
                          //   child:
                          //   // CircleAvatar(
                          //   //   backgroundColor: Color(0xff202020),
                          //   //   child: Icon(
                          //   //     Icons.person,
                          //   //     color: Colors.white,
                          //   //   ),
                          //   // ),
                          // ),
                          const SizedBox(height: 5),
                          Text("Peter Parker", style: TextStyles.titleM),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   "Mahmudul@gmail.com",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorMyaccount()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/appointment.svg"),
                    title: const Text('Appointment'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.forum,
                    ),
                    title: const Text('forum'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.message,
                    ),
                    title: const Text('Messages'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                    ),
                    title: const Text('Notifications'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.note,
                    ),
                    title: const Text('preferences'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorMyaccount()),
                          (route) => false);
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
                              const Text('Are you sure you want to log out ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'No'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'YES');
                                // provider.logOut();
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

// body
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
      body: HomepageMentor(),
    );
  }
}

//Homepage Design
class HomepageMentor extends StatefulWidget {
  const HomepageMentor({super.key});

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
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFDBA2F)),
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
                            setState(() {
                              // counter = 0;
                            });
                          }),
                      Positioned(
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
                            '$counter',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
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
                      height: 10,
                    ),
                    _header(),
                    _searchField(),
                    _add(),
                    _upcommingMeetings(),
                    _questionAnswer(),
                  ],
                ),
              ),
              // _topmentorsList()
              _topmenteelist(),
            ],
          ),
        )));
  }

  //header
  Widget _header() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffFDBA2F)),
              shape: BoxShape.circle),
          // height: 40,
          // width: 40,
          child: Image.asset("assets/professor.png", fit: BoxFit.fill),
        ).p(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("Hello Mahmudul !,",
                // style: TextStyles.title.subTitleColor,
                style: TextStyle(
                  color: Color(0xff202020),
                  fontSize: 18,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Thanks for joining the mentorship\n Programe!",
              // style: TextStyles.h1Style
              style: TextStyle(color: Color(0xff979797), fontSize: 14),
            ),
          ],
        ).p16,
      ],
    );
  }

//search
  Widget _searchField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 20, 15),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        // controller: _doctorName,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xffEBF6F7),
          hintText: 'Search for Mentor',
          hintStyle: const TextStyle(color: Color(0xff6EBFC3)),

          // hintStyle: GoogleFonts.lato(
          //   color: Colors.black26,
          //   fontSize: 18,
          //   fontWeight: FontWeight.w800,
          // ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: Color(0xff6EBFC3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              iconSize: 20,
              splashRadius: 20,
              color: Color(0xff6EBFC3),
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
        // style: GoogleFonts.lato(
        //   fontSize: 18,
        //   fontWeight: FontWeight.w800,
        // ),
        onFieldSubmitted: (String value) {
          setState(
            () {
              // value.length == 0
              //     ? Container()
              //     : Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => SearchList(
              //             searchKey: value,
              //           ),
              //         ),
              //       );
            },
          );
        },
      ),
    );
  }

  //advertisment
  Widget _add() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [Color(0xffFDBA2F), Color(0xffFFAA5F)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 20, 15),
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(children: [
        Positioned(
          // top: 40,
          left: -15,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/PinkFlowers.png',
              fit: BoxFit.contain,
              width: 108,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, bottom: 20, top: 20),
          child: RichText(
            text: const TextSpan(
              text: ' 1000+ ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: 'Alumni has joined the mentorship community.',
                  style: TextStyle(
                    color: Colors.white,
                    // backgroundColor: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '\n Help them with your mentorship!  ',
                  style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'courier',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

//upcomming Meetings

  Widget _upcommingMeetings() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Upcoming meetings", style: TextStyles.title.bold),
              TextButton(
                  onPressed: () {
                    //show mentor list
                  },
                  child: const Text(
                    "View all",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff682FFD)),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .159,
          width: AppTheme.fullWidth(context),
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _upcommingCardWidget("Klimsha", "voice call",
                    "Today-10 Am", "assets/profile.png", Color(0xffFFFFFF));
              }),
        ),
      ],
    );
  }

  //upcomming card widget
  Widget _upcommingCardWidget(
    String name,
    String meetingType,
    String meetingDateTime,
    String profile,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      width: AppTheme.fullWidth(context) * .6,
      // margin: const EdgeInsets.only(left: 15, right: 10, top: 10),
      margin: const EdgeInsets.only(
        left: 15,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: Color(0xffFFD551), width: 1, style: BorderStyle.solid),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 2),
            blurRadius: 3,
            color: const Color(0xffA0A2B3).withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: SizedBox(
              // height: 46,
              // width: 46,
              child: Image.asset(profile, fit: BoxFit.fill),
            ),
          ).p(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name + ", " + meetingType, style: TextStyle(fontSize: 12)),
              const SizedBox(
                height: 5,
              ),
              Text(
                meetingDateTime,
                style: TextStyle(fontSize: 12),
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "View details",
                  style: TextStyle(
                      color: Color(
                        0xffFD2FE2,
                      ),
                      fontSize: 14),
                ),
              )

              // Text(details)
            ],
          ),
        ],
      ),
    );
  }

  //Questions and answers

  Widget _questionAnswer() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Questions & answer", style: TextStyles.title.bold),
              TextButton(
                  onPressed: () {
                    //show mentor list
                  },
                  child: const Text(
                    "Explore",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff682FFD)),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .2,
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

  //Qusetion widget

  Widget _questionCardWidget(
    String name,
    String details, {
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      width: AppTheme.fullWidth(context) * .8,
      margin: const EdgeInsets.only(
        left: 15,
        right: 10,
      ),
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
                        color: Color(0xffA0A2B3),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _topmenteelist() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("On boarded mentees", style: TextStyles.title.bold),
                TextButton(
                    onPressed: () {
                      //show mentee list
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenteeList()));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff682FFD)),
                    ))
              ],
            ).hP16,
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
      padding: const EdgeInsets.only(
        left: 15,
      ),
      // implement GridView.builder
      child: SizedBox(
        height: 500,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: provider.mentees.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color(0xff979797).withOpacity(0.1)),
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
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                      child: SizedBox(
                        // height: 40,
                        // width: 40,
                        // decoration: BoxDecoration(
                        //   color: Theme.of(context).backgroundColor,
                        // ),
                        child: Image.asset("assets/profile.png",
                            fit: BoxFit.contain),
                      ),
                    ).p(8),
                    Text(provider.mentees[index]["name"]),
                    Text(provider.mentees[index]["profession"]),
                    Text(provider.mentees[index]["review"]),
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  HomePageMentorVM create() => HomePageMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
