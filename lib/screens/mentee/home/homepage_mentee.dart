import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/light_color.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/components/theme/theme.dart';

import 'package:futurensemobileapp/screens/mentee/home/homepage_mentee_vm.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/mentor_list.dart';
import 'package:futurensemobileapp/screens/mentee/myaccount/myaccount.dart';

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

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
      menuBackgroundColor: Color(0xffFDBA2F),
      mainScreen: const Body(),
      menuScreen: Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Color(0xffFDBA2F),
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
                            borderRadius: BorderRadius.all(Radius.circular(13)),
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
                          SizedBox(height: 5),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyAccount()));
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => MyAccount()),
                      //     (route) => false);
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
                          MaterialPageRoute(builder: (context) => MyAccount()),
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
    return Scaffold(
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
          child: Image.asset("assets/profile.png", fit: BoxFit.fill),
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
              "Find your suitable mentor here",
              // style: TextStyles.h1Style
              style: TextStyle(color: Color(0xff979797), fontSize: 16),
            ),
          ],
        ).p16,
      ],
    );
  }

//search
  Widget _searchField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
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
          fillColor: Color(0xffEBF6F7),
          hintText: 'Search for Mentor',
          hintStyle: TextStyle(color: Color(0xff6EBFC3)),

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
    // return Container(
    //   height: 55,
    //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    //   width: MediaQuery.of(context).size.width,
    //   decoration: BoxDecoration(
    //     color: const Color(0xff6B779A).withOpacity(0.1),
    //     borderRadius: const BorderRadius.all(Radius.circular(13)),
    //     // boxShadow: <BoxShadow>[
    //     //   BoxShadow(
    //     //     color: Colors.grey,
    //     //     blurRadius: 15,
    //     //     offset: Offset(5, 5),
    //     //   )
    //     // ],
    //   ),
    //   child: TextField(
    //     decoration: InputDecoration(
    //       contentPadding:
    //           const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    //       border: InputBorder.none,
    //       hintText: "Search for mentor",
    //       hintStyle: TextStyles.body.subTitleColor,
    //       suffixIcon: SizedBox(
    //         width: 50,
    //         child: const Icon(Icons.search, color: Colors.orange)
    //             .alignCenter
    //             .ripple(
    //               () {},
    //               borderRadius: BorderRadius.circular(13),
    //             ),
    //       ),
    //     ),
    //   ),
    // );
  }

  //categories

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Category", style: TextStyles.title.bold),
              // Text(
              //   "swipe",
              //   style: TextStyles.titleNormal
              //       .copyWith(color: Theme.of(context).primaryColor),
              // ).p(8).ripple(() {})
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
                "Technical Assistance",
                "27 Mentors",
                color: const Color(0xffFDBA2F),
                lightColor: const Color(0xffFFC958),
              ),
              _categoryCardWidget(
                "Mental Health",
                "43 Mentors",
                color: const Color(0xff90D8DC),
                lightColor: Color(0xff95E1E4),
              ),
              _categoryCardWidget(
                "Engagement Manager",
                "50 Mentors ",
                color: Color(0xffFFAA5F),
                lightColor: const Color(0xffFFBC80),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCardWidget(
    String title,
    String subtitle, {
    required Color color,
    required Color lightColor,
  }) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    TextStyle subtitleStyle = TextStyles.body.bold.white;
    // if (AppTheme.fullWidth(context) < 392) {
    //   titleStyle = TextStyles.body.bold.white;
    //   subtitleStyle = TextStyles.bodySm.bold.white;
    // }
    return AspectRatio(
      aspectRatio: 5.6 / 8,
      child: Container(
        // height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle).vP4,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {},
            borderRadius: const BorderRadius.all(Radius.circular(20))),
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
                    ),
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
      margin: const EdgeInsets.only(left: 15, right: 10, top: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xffFFD680), style: BorderStyle.solid),
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
                    ),
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
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      width: AppTheme.fullWidth(context) * .6,
      margin: const EdgeInsets.only(left: 15, right: 10, top: 10),
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
              Text(name + ", " + meetingType, style: TextStyle(fontSize: 10)),
              const SizedBox(
                height: 5,
              ),
              Text(
                meetingDateTime,
                style: TextStyle(fontSize: 10),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              TextButton(
                onPressed: () {},
                child: Text(
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

  //top Mentors list

  Widget _topmentorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Top Mentors", style: TextStyles.title.bold),
                TextButton(
                    onPressed: () {
                      //show mentor list
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorList()));
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            ).hP16,
          ),
          // getmentorWidgetList()
          _mentorWidgetList()
        ],
      ),
    );
  }

  Widget _mentorWidgetList() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      // implement GridView.builder
      child: SizedBox(
        height: 500,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: provider.mentors.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color(0xff979797).withOpacity(0.1)),
                    boxShadow: <BoxShadow>[
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
                    Text(provider.mentors[index]["name"]),
                    Text(provider.mentors[index]["profession"]),
                    Text(provider.mentors[index]["review"]),
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          // backgroundColor: Colors.white,
          // appBar: AppBar(
          //   actions: [
          //     // Using Stack to show Notification Badge
          //     Stack(
          //       children: <Widget>[
          //         IconButton(
          //             icon: const Icon(
          //               Icons.notifications,
          //               size: 30,
          //               color: Color(0xffFDBA2F),
          //             ),
          //             onPressed: () {
          //               setState(() {
          //                 // counter = 0;
          //               });
          //             }),
          //         Positioned(
          //           right: 11,
          //           top: 11,
          //           child: Container(
          //             padding: const EdgeInsets.all(2),
          //             decoration: BoxDecoration(
          //               color: Colors.red,
          //               borderRadius: BorderRadius.circular(6),
          //             ),
          //             constraints: const BoxConstraints(
          //               minWidth: 14,
          //               minHeight: 14,
          //             ),
          //             child: Text(
          //               '$counter',
          //               style: const TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 8,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   leading: IconButton(
          //     icon: const Icon(
          //       Icons.menu,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       z.toggle!();
          //     },
          //   ),
          // ),
          // backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Container(
              decoration:const BoxDecoration(
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
                // title: const Text(
                //   "Profile",
                //   style: TextStyle(
                //       color: const Color(0xffFDBA2F),
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                // ),
                // leading: const BackButtonCustom(),
                leading: IconButton(
                  icon: Container(
                    padding:const EdgeInsets.all(5),
                    child:  const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:const Color(0xffFDBA2F)),
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
                              color:const Color(0xff682FFD),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color:const Color(0xffA0A2B3).withOpacity(0.5))),
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
                    _category(),
                    _upcommingMeetings(),
                    _questionAnswer()
                  ],
                ),
              ),
              _topmentorsList()
            ],
          ),
        )));
  }

  @override
  HomePageMenteeVM create() => HomePageMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
