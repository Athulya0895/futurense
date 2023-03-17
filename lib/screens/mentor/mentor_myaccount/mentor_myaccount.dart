import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/button/button.dart';

import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';

import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount_vm.dart';
import 'package:futurensemobileapp/screens/mentor/setPreference/setpreference.dart';
import 'package:futurensemobileapp/utils/validators.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MentorMyaccount extends StatefulWidget {
  final jumbToIndex;
  final bool? fromLogin;
  const MentorMyaccount({super.key, this.fromLogin, this.jumbToIndex});

  @override
  State<MentorMyaccount> createState() => _MentorMyaccountState();
}

class _MentorMyaccountState extends State<MentorMyaccount>
    with BasePage<MentorMyaccountVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
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
                  title: const Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Color(0xffFDBA2F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // leading: const BackButtonCustom(),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  )),
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        alignment: Alignment.center,
                        children: [
                          Center(
                              child: provider.image != null
                                  ? CircleAvatar(
                                      radius: 60, // Image radius
                                      backgroundImage:
                                          FileImage(provider.image!),
                                    )
                                  : provider.prefs.user?.profilePic != null
                                      ? CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 60, // Image radius
                                          backgroundImage: NetworkImage(provider
                                              .prefs.user!.profilePic
                                              .toString()),
                                        )
                                      : provider.image != null
                                          ? Image.file(
                                              provider.image!,
                                              fit: BoxFit.cover,
                                            )
                                          : SvgPicture.asset(
                                              'assets/myaccount.svg')),
                          Positioned.fill(
                              child: InkWell(
                            onTap: (() {
                              provider.pickFile();
                            }),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SvgPicture.asset("assets/camera.svg")),
                          )),
                        ],
                      ),
                      // imageProfile(),

                      const SizedBox(height: 10),
                      Center(
                        child: TextButton(
                            onPressed: (() {
                              setState(() {
                                provider.edit = true;
                              });
                              // print("true");
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xffFDBA2F)),
                                ),
                                Icon(Icons.edit)
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "First Name",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(height: 5),
                      provider.edit == true
                          ? InputField(
                              hintText: "First Name",
                              autofocus: true,
                              // initialval: provider.prefs.user!.mentorName.toString(),
                              controller: provider.firstName,
                              // prefixIcon: const Icon(Icons.person),
                              validation: Validators.basic,
                            )
                          : IgnorePointer(
                              child: InputField(
                                hintText: "First Name",
                                // initialval: provider.prefs.user!.mentorName.toString(),
                                controller: provider.firstName,
                                // prefixIcon: const Icon(Icons.person),
                                validation: Validators.basic,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Last Name",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(height: 5),
                      provider.edit == true
                          ? InputField(
                              hintText: "Last Name",
                              controller: provider.lastName,
                              autofocus: true,
                              // prefixIcon: const Icon(Icons.person),
                              validation: Validators.basic,
                            )
                          : IgnorePointer(
                              child: InputField(
                                hintText: "Last Name",
                                controller: provider.lastName,
                                // prefixIcon: const Icon(Icons.person),
                                validation: Validators.basic,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(height: 5),
                      provider.edit == true
                          ? InputField(
                              enabletextfield: false,
                              hintText: "email@gmail.com",
                              controller: provider.email,
                              // prefixIcon: const Icon(Icons.person),
                              validation: Validators.basic,
                            )
                          : IgnorePointer(
                              child: InputField(
                                hintText: "email@gmail.com",
                                controller: provider.email,
                                // prefixIcon: const Icon(Icons.person),
                                validation: Validators.basic,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Contact Number",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(height: 5),
                      provider.edit == true
                          ? InputField(
                              hintText: "Phone Number",
                              controller: provider.phoneNumber,
                              // prefixIcon: const Icon(Icons.phone),
                              validation: Validators.mobile,
                            )
                          : IgnorePointer(
                              child: InputField(
                                hintText: "Phone Number",
                                controller: provider.phoneNumber,
                                // prefixIcon: const Icon(Icons.phone),
                                validation: Validators.mobile,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Current Company",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      provider.edit == true
                          ? DropDownMenuMode(
                              borderRadius: 10,
                              enabledValidation: true,
                              selectedItem: provider.selectedCompany,
                              hinttext: "",
                              validationText:
                                  "Please Select your currency type",
                              items: provider.companyList,
                              setdata: (val) {
                                provider.selectedCompany = val;
                                // print(provider.selectedCompany);
                                setState(() {
                                  provider.currentCompany.text = val.name;
                                });
                              },
                            )
                          : IgnorePointer(
                              child: InputField(
                                hintText: "",
                                controller: provider.currentCompany,
                                // prefixIcon: const Icon(Icons.phone),
                                validation: Validators.basic,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text(
                              "Job Title",
                              style: TextStyle(
                                color: Color(0xff202020),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Experience",
                              style: TextStyle(
                                color: Color(0xff202020),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          provider.edit == true
                              ? Expanded(
                                  child: DropDownMenuMode(
                                    borderRadius: 10,
                                    enabledValidation: true,
                                    hinttext: "",
                                    selectedItem: provider.selectedJob,
                                    items: provider.jobtitleList,
                                    setdata: (val) {
                                      provider.selectedJob = val;
                                      setState(() {
                                        provider.jobTitle.text = val.name;
                                      });
                                    },
                                    validationText: "please choose jobtitle",
                                  ),
                                )
                              : Expanded(
                                  child: IgnorePointer(
                                    child: InputField(
                                      hintText: "",
                                      controller: provider.jobTitle,
                                      validation: Validators.basic,
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          provider.edit == true
                              ? Expanded(
                                  child: DropDownMenuMode(
                                    borderRadius: 10,
                                    hinttext: "",
                                    selectedItem: provider.selectedExperience,
                                    items: provider.experiencesList,
                                    setdata: (val) {
                                      provider.selectedExperience = val;
                                      setState(() {
                                        provider.experience.text = val.name;
                                      });
                                    },
                                    validationText: "please choose experience",
                                  ),
                                )
                              : Expanded(
                                  child: IgnorePointer(
                                    child: InputField(
                                      hintText: "Experience",
                                      controller: provider.experience,
                                      // prefixIcon: const Icon(Icons.phone),
                                      validation: Validators.basic,
                                    ),
                                  ),
                                ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "About You",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(height: 5),
                      provider.edit == true
                          ? InputField(
                              maxline: 5,
                              // minline: 1,
                              hintText: "",
                              controller: provider.about,

                              validation: Validators.basic,
                            )
                          : IgnorePointer(
                              child: InputField(
                                maxline: 5,
                                // minline: 1,
                                hintText: "",
                                controller: provider.about,

                                validation: Validators.basic,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        "LinkedIn ID",
                        style: TextStyle(
                          color: Color(0xff202020),
                        ),
                      ),
                      const SizedBox(height: 5),
                      provider.edit == true
                          ? InputField(
                              // maxline: 5,
                              hintText: "Type your linkedin id",
                              controller: provider.linkedinid,

                              // validation: Validators.linkedIN,
                            )
                          : IgnorePointer(
                              child: InputField(
                                // maxline: 5,
                                hintText: "Type your linkedin id",
                                controller: provider.linkedinid,

                                // validation: Validators.linkedIN,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: widget.fromLogin == true,
                          replacement: Column(
                            children: [
                              provider.edit == true
                                  ? CustomMaterialButtton(
                                      text: "Save",
                                      onPressed: () {
                                        provider.updateProfile(context,
                                            home: true);
                                      })
                                  :const SizedBox(),
                              // Text("setPreference"),.
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: const SetPreferenceMentor(),
                                          withNavBar: true,
                                          pageTransitionAnimation:
                                              PageTransitionAnimation
                                                  .cupertino);
                                    },
                                    child: const Text(
                                      "Edit Preferences",
                                      style: TextStyle(
                                          color: Color(0xff682FFD),
                                          decoration: TextDecoration.underline),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ],
                          ),
                          child: Center(
                              child: CustomMaterialButtton(
                            text: provider.edit == true ? "Save" : "Next",
                            onPressed: () {
                              provider.updateProfile(context);
                            },
                          ))),
                      // Visibility(
                      //     visible: widget.fromLogin == true,
                      //     replacement: provider.edit == true
                      //         ? CustomMaterialButtton(
                      //             textColor: Colors.white,
                      //             text: "save",
                      //             onPressed: () {
                      //               provider.updateProfile(context, home: true);
                      //             })

                      //         : const SizedBox(),
                      //     child: Center(
                      //         child: CustomMaterialButtton(
                      //       onPressed: () {
                      //         provider.updateProfile(context);
                      //         provider.getUserDetails();
                      //       },
                      //       text: provider.edit == true ? "Save" : "Next",
                      //     )
                      //         )),

                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )));
  }
//profile pic

  @override
  MentorMyaccountVM create() => MentorMyaccountVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
