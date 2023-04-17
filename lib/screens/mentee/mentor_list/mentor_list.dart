import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';

import 'package:futurensemobileapp/components/profile/profile_image.dart';


import 'package:futurensemobileapp/screens/mentee/home/widget/search_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/mentor_list_vm.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/widgets/filter.dart';

class MentorList extends StatefulWidget {
  // final List<MentorModel>? topmentorlists;
  const MentorList({
    super.key,
  });

  @override
  State<MentorList> createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> with BasePage<MentorListVM> {
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
                    "Our Mentors",
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
                              filterData: provider.filterData,
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
                      ))
                ]),
          ),
        ),
        body: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            children: [
              SearchMentee(topmentorlist: provider.topMentorList),
              _allmentorWidgetList(),
            ],
          ),
        ))));
  }



  //top Mentors list
  Widget _allmentorWidgetList() {
    
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
      // implement GridView.builder
      child: SizedBox(
        // height: 500,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                //  childAspectRatio: 3 / 3.8,

                childAspectRatio:
                    ((MediaQuery.of(context).size.width / 2) - 30) / 210,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: provider.filterList.isEmpty &&
                    provider.isSelectedfilter == false
                ? provider.topMentorList.length
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
                              topmentor: provider.topMentorList[index])));
                }),
                child: Stack(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      // padding: const EdgeInsets.only(top: 10),
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
                              url: provider.topMentorList[index].profilePic),
                        const  SizedBox(
                            height: 8,
                          ),
                          provider.isSelectedfilter == false ||
                                  provider.filterList.isEmpty
                              ? Text(
                                  "${provider.topMentorList[index].fName.toString()} ${provider.topMentorList[index].lName.toString()}",
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
                                  provider.topMentorList[index].designationName
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style:const TextStyle(
                                      color: Color(0xff6B779A), fontSize: 10),
                                )
                              : Text(provider.filterList[index].designationName
                                  .toString()),
                          provider.isSelectedfilter == false ||
                                  provider.filterList.isEmpty
                              ? Text(
                                  "⭐️ ${provider.topMentorList[index].rating.toString()}(${provider.topMentorList[index].reviews.toString()} reviews,)",
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
  MentorListVM create() => MentorListVM();

  @override
  void initialise(BuildContext context) {}
}
