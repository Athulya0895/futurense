import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail_vm.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/mentor_list_vm.dart';

class MentorList extends StatefulWidget {
  const MentorList({super.key});

  @override
  State<MentorList> createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> with BasePage<MentorListVM> {
//search all mentors
//also can search based on filter
  Widget _searchField() {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff6B779A).withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.grey,
        //     blurRadius: 15,
        //     offset: Offset(5, 5),
        //   )
        // ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search for mentor",
          hintStyle: TextStyles.body.subTitleColor,
          suffixIcon: SizedBox(
            width: 50,
            child: const Icon(Icons.search, color: Colors.orange)
                .alignCenter
                .ripple(
                  () {},
                  borderRadius: BorderRadius.circular(13),
                ),
          ),
        ),
      ),
    );
  }
//list of all mentors

  //top Mentors list

  Widget _allmentorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 4),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text("Top Mentors", style: TextStyles.title.bold),
            //     TextButton(
            //         onPressed: () {
            //           //show mentor list
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => MentorList()));
            //         },
            //         child: Text("View All"))
            //   ],
            // ).hP16,
          ),
          _allmentorWidgetList()
        ],
      ),
    );
  }

  Widget _allmentorWidgetList() {
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
              return InkWell(
                  child: Container(
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xff979797).withOpacity(0.1)),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 10,
                            color: Color(0xff979797),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          child: SizedBox(
                            // height: 40,
                            // width: 40,
                            // decoration: BoxDecoration(
                            //   color: Theme.of(context).backgroundColor,
                            // ),
                            child: Image.asset("assets/professor.png",
                                fit: BoxFit.contain),
                          ),
                        ).p(8),
                        Text(provider.mentors[index]["name"]),
                        Text(provider.mentors[index]["profession"]),
                        Text(provider.mentors[index]["review"]),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MentorDetails()));
                  });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Mentors",
              style: TextStyle(
                  color: const Color(0xff777A95).withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            leading: const BackButtonCustom(),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    //filter click show dialogue
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      transitionDuration: Duration(milliseconds: 500),
                      barrierLabel:
                          MaterialLocalizations.of(context).dialogLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      pageBuilder: (context, _, __) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.white,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      ListView(
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Choose filter",
                                                style: TextStyles.titleM,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    // setState(() {
                                                    //   isSelectedfilter =
                                                    //       false;
                                                    // });
                                                    // provider.filter();
                                                  },
                                                  icon: Icon(Icons.close))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Key Mentoring Areas",
                                            style: TextStyle(
                                              color: Color(0xff9295A3),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          DropDownMenuMode(
                                            borderRadius: 10,
                                            selectedItem: "IT",
                                            hinttext: "	",
                                            validationText:
                                                "Please Select your currency type",
                                            items: const [
                                              "IT",
                                              "finanace",
                                              "sdf",
                                              "cvb"
                                            ],
                                            setdata: (val) {
                                              // provider.selectedCurrency = val;
                                              // print(provider.selectedCurrency);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Expanded(
                                                  child: Text(
                                                "Organisation",
                                                style: TextStyle(
                                                  color: Color(0xff9295A3),
                                                ),
                                              )),
                                              Expanded(
                                                  child: Text(
                                                "Industry",
                                                style: TextStyle(
                                                  color: Color(0xff9295A3),
                                                ),
                                              ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: DropDownMenuMode(
                                                borderRadius: 10,
                                                hinttext: "",
                                                items: const [
                                                  "asdf",
                                                  "sdfgh",
                                                  ""
                                                ],
                                                setdata: () {},
                                                // controller: provider.yourCity,
                                                validationText:
                                                    'please choose your city',
                                              )),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child: DropDownMenuMode(
                                                borderRadius: 10,
                                                hinttext: "",
                                                items: const [
                                                  "software engineer",
                                                  "tester",
                                                  "Projecrt Manager"
                                                ],
                                                setdata: () {},
                                                validationText:
                                                    "please choose jobtitle",
                                              ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Jobtitle",
                                            style: TextStyle(
                                              color: Color(0xff9295A3),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          DropDownMenuMode(
                                            borderRadius: 10,
                                            selectedItem: "",
                                            hinttext: "",
                                            validationText:
                                                "Please Select jobtitle",
                                            items: const [
                                              "Software Engineer",
                                              "finanace",
                                              "python",
                                              "java developer"
                                            ],
                                            setdata: (val) {
                                              // provider.selectedCurrency = val;
                                              // print(provider.selectedCurrency);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                color: Color(0xffFD2FE2)
                                                    .withOpacity(0.5),
                                                onPressed: () {},
                                                child: const Text(
                                                  "Clear",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                color: Color(0xffFDBA2F),
                                                onPressed: () {},
                                                child: const Text(
                                                  "ok",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          ).drive(Tween<Offset>(
                            begin: Offset(0, -1.0),
                            end: Offset.zero,
                          )),
                          child: child,
                        );
                      },
                    );
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffF1F4F7))),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.tune,
                      color: Color(0xff202020),
                    ),
                  ))
            ],
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _searchField(),
                  ],
                ),
              ),
              _allmentorsList()
            ],
          ),
        )));
  }

  @override
  MentorListVM create() => MentorListVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
