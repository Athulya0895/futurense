import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';

import 'package:futurensemobileapp/components/profile/profile_image.dart';

import 'package:futurensemobileapp/screens/mentee/category/mental_wellbeing/mental_wellbeing_vm.dart';
import 'package:futurensemobileapp/screens/mentee/home/widget/search_mentee.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_detail/mentor_detail.dart';
import 'package:futurensemobileapp/screens/mentee/mentor_list/widgets/filter.dart';

class MentalWellBeing extends StatefulWidget {
  const MentalWellBeing({super.key});

  @override
  State<MentalWellBeing> createState() => _MentalWellBeingState();
}

class _MentalWellBeingState extends State<MentalWellBeing>
    with BasePage<MentalWellBeingVM> {
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
                    "Mental Well Being",
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
          child: Column(
            children: [
              SearchMentee(topmentorlist: provider.topMentalWellbeing),
              _allmentorWidgetList(),
            ],
          ),
        ))));
  }

//search all mentors

  Widget _allmentorWidgetList() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 40),
      // implement GridView.builder
      child: SizedBox(
        // height: 500,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: provider.topMentalWellbeing.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color(0xff979797).withOpacity(0.1)),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 10,
                            color: Color(0xffFFD680),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ProfileImage(
                            provider.topMentalWellbeing[index].profilePic),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${provider.topMentalWellbeing[index].fName.toString()} ${provider.topMentalWellbeing[index].lName.toString()}",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          provider.topMentalWellbeing[index].designationName
                              .toString(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "⭐️ ${provider.topMentalWellbeing[index].rating.toString()}(${provider.topMentalWellbeing[index].reviews.toString()} reviews)",
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xffFD2FE2)),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MentorDetails(
                                  topmentor: provider.topMentalWellbeing[index],
                                )));
                  });
            }),
      ),
    );
  }

  @override
  MentalWellBeingVM create() => MentalWellBeingVM();
  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
