import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';

import 'package:futurensemobileapp/components/profile/profile_image.dart';

import 'package:futurensemobileapp/screens/mentee/category/technical_assistance/technical_assistance_vm.dart';
import 'package:futurensemobileapp/screens/mentee/home/widget/search_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/widgets/filter.dart';

class TechnicalAssistance extends StatefulWidget {
  const TechnicalAssistance({super.key});

  @override
  State<TechnicalAssistance> createState() => _TechnicalAssistanceState();
}

class _TechnicalAssistanceState extends State<TechnicalAssistance>
    with BasePage<TechnicalAssistanceVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
        backgroundColor: Colors.white,
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
                centerTitle: true,
                title: const Center(
                  child: Text(
                    "Technical Assistance",
                    style: TextStyle(
                        color: Color(0xffFDBA2F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
                actions: [
                  IconButton(
                      onPressed: () {
                        //filter click show dialogue
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          barrierLabel:
                              MaterialLocalizations.of(context).dialogLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (context, _, __) {
                            return Filter(
                              filterData: provider.selectedFilter,
                              skillset: provider.skillsetList,
                              filter: provider.filter,
                              selectedSkillset: provider.selectedskillset,
                              domainExpertise: provider.domainExpertiseList,
                              selectedDomain: provider.selectedDomain,
                              experience: provider.experiencesList,
                              selectedExperience: provider.selectedExperience,
                              jobtitleList: provider.jobtitleList,
                              selectedJobtitle: provider.selectedJob,
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ).drive(Tween<Offset>(
                                begin: const Offset(0, -1.0),
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
                      )),
                ]),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SearchMentee(topmentorlist: provider.topTechmentorList),
              _allmentorWidgetList()
            ],
          ),
        )
        //  CustomScrollView(
        //   slivers: <Widget>[
        //     SliverList(
        //       delegate: SliverChildListDelegate(
        //         [
        //           _searchField(),
        //         ],
        //       ),
        //     ),
        //     _allmentorsList()
        //   ],
        // ),
        )));
  }



  //top Mentors list
  Widget _allmentorWidgetList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
      // implement GridView.builder
      child: SizedBox(
        // height: 500,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: provider.filterList.isEmpty &&
                    provider.isSelectedfilter == false
                ? provider.topTechmentorList.length
                : provider.filterList.length,
            //  provider.topMentorList.length > 6
            //     ? 6
            //     : provider.topMentorList
            //         .length, //only five topmentors need to be displayed
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MentorDetails(
                              topmentor: provider.topTechmentorList[index])));
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
                          ProfileImage(
                              url:
                                  provider.topTechmentorList[index].profilePic),
                          //                   const SizedBox(
                          //                     height: 20,
                          //                   ),
                          provider.isSelectedfilter == false ||
                                  provider.filterList.isEmpty
                              ? Text(
                                  "${provider.topTechmentorList[index].fName.toString()} ${provider.topTechmentorList[index].lName.toString()}",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:const TextStyle(
                                      color: Color(0xff222B45),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              : Text(
                                  "${provider.filterList[index].fName.toString()} ${provider.filterList[index].lName.toString()}",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:const TextStyle(
                                      color: Color(0xff222B45),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                          provider.isSelectedfilter == false ||
                                  provider.filterList.isEmpty
                              ? Text(
                                  provider
                                      .topTechmentorList[index].designationName
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color(0xff6B779A), fontSize: 10),
                                )
                              : Text(
                                  provider.filterList[index].designationName
                                      .toString(),
                                  style:const TextStyle(
                                      color: Color(0xff6B779A), fontSize: 10),
                                ),
                          provider.isSelectedfilter == false ||
                                  provider.filterList.isEmpty
                              ? Text(
                                  "⭐️ ${provider.topTechmentorList[index].rating.toString()}(${provider.topTechmentorList[index].reviews.toString()} reviews,)",
                                  textAlign: TextAlign.center,
                                  style:
                                      const TextStyle(color: Color(0xffFD2FE2)),
                                )
                              : Text(
                                  "⭐️ ${provider.filterList[index].rating.toString()}(${provider.filterList[index].reviews.toString()} reviews)",
                                  textAlign: TextAlign.center,
                                  style:
                                      const TextStyle(color: Color(0xffFD2FE2)),
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
      ),
    );
  }

  @override
  TechnicalAssistanceVM create() => TechnicalAssistanceVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
