import 'package:flutter/material.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/models/filter_model.dart';
import 'package:futurensemobileapp/models/user_model.dart';

import '../../../../components/dropdown/dropdown_menu_mode.dart';

class Filter extends StatefulWidget {
  final List<SkillsetModel> skillset;
  final SkillsetModel? selectedSkillset;
  final List<DomainExpertiseModel> domainExpertise;
  final DomainExpertiseModel? selectedDomain;
  final List<ExperienceModel> experience;
  final ExperienceModel? selectedExperience;
  final List<JobttileModel> jobtitleList;
  final JobttileModel? selectedJobtitle;
  // final Function(dynamic val, dynamic val1) filter;
  final Function(FilterModel? filtermodel) filter;

  const Filter(
      {super.key,
      required this.skillset,
      required this.filter,
      required this.selectedSkillset,
      required this.domainExpertise,
      required this.selectedDomain,
      required this.experience,
      required this.selectedExperience,
      required this.jobtitleList,
      required this.selectedJobtitle});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  void initState() {
    setState(() {
      selectedSkillset = widget.selectedSkillset;
      selectedDomain = widget.selectedDomain;
      selectedExperience = widget.selectedExperience;
      selectedJobtitle = widget.selectedJobtitle;
    });

    super.initState();
  }

  FilterModel filter = FilterModel();
  SkillsetModel? selectedSkillset;
  DomainExpertiseModel? selectedDomain;
  ExperienceModel? selectedExperience;
  JobttileModel? selectedJobtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // color: Colors.white,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Form(
                // key: provider.formKey,
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose filter",
                              style: TextStyles.titleM,
                            ),
                            IconButton(
                              onPressed: () {
                                // FilterModel filter = FilterModel(
                                //     selectedJobtitle:
                                //         selectedJobtitle?.jobtitlename,
                                //     selectedSkillset:
                                //         selectedSkillset?.skillName);
                                // widget.filter(
                                //     selectedSkillset, selectedJobtitle);
                                widget.filter(filter);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Skillset",
                          style: TextStyle(
                            color: Color(0xff9295A3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropDownMenuMode(
                          borderRadius: 10,
                          selectedItem: selectedSkillset,
                          hinttext: "	",
                          validationText: "Please Select your skill set ",
                          items: widget.skillset,
                          setdata: (val) {
                            setState(() {
                              selectedSkillset = val;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                                child: Text(
                              "Domain Expertise",
                              style: TextStyle(
                                color: Color(0xff9295A3),
                              ),
                            )),
                            Expanded(
                                child: Text(
                              "Experience",
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
                              selectedItem: selectedDomain,
                              // selectedItem: provider
                              //     .selectedDomain,
                              // items: provider
                              //     .domainExpertiseList,
                              items: widget.domainExpertise,
                              setdata: (val) {
                                selectedDomain = val;
                              },
                              // controller: provider.yourCity,
                              validationText: 'please choose your domain',
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: DropDownMenuMode(
                              borderRadius: 10,
                              hinttext: "",
                              // items: provider
                              //     .experiencesList,
                              items: widget.experience,
                              // selectedItem: provider
                              //     .selectedExperience,
                              selectedItem: selectedExperience,
                              setdata: (val) {
                                selectedExperience = val;
                              },
                              validationText: "please choose jobtitle",
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
                          selectedItem: selectedJobtitle,

                          hinttext: "",
                          validationText: "Please Select jobtitle",
                          // items: [],
                          //     provider.jobtitleList,
                          items: widget.jobtitleList,
                          setdata: (val) {
                            selectedJobtitle = val;
                          },
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: const Color(0xffFDBA2F),
                          onPressed: () {
                            filter.selectedJobtitle =
                                selectedJobtitle?.jobtitlename;
                            filter.selectedSkillset =
                                selectedSkillset?.skillName;
                            filter.selectedDomain =
                                selectedDomain?.expertiseName;
                            filter.selectedExperience =
                                selectedExperience?.experienceName;

                            // widget.filter(selectedSkillset, selectedJobtitle);
                            widget.filter(filter);

                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Go",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedSkillset = null;
                              selectedDomain = null;
                              selectedExperience = null;
                              selectedJobtitle = null;
                            });
                          },
                          child: const Text(
                            "Remove Filters",
                            style: TextStyle(
                                color: Color(0xffFF7901),
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
