import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/button/button.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/mentee/forum/writepost/write_post_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class WritePost extends StatefulWidget {
  const WritePost({super.key});

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> with BasePage<WritePostVM> {
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
                title: const Center(
                    // child: Text(
                    //   "Join the Conversation",
                    //   style: TextStyle(
                    //       color: Color(0xffFDBA2F),
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Start the Conversation",
                    style: TextStyle(
                        color: Color(0xff202020),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Topic",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                    hintText: "Questions, Answers, Blogs, etc.,..",
                    autofocus: true,
                    // initialval: provider.prefs.user!.mentorName.toString(),
                    controller: provider.topic,
                    // prefixIcon: const Icon(Icons.person),
                    validation: Validators.basic,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Tags",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  DropDownMenuMode(
                    enabledValidation: true,
                    borderRadius: 10,
                    selectedItem: provider.selectedTags,
                    hinttext: "Fields/skills",
                    validationText: "Please Select your tags",
                    items: provider.tags,
                    setdata: (val) {
                      provider.selectedTags = val;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Write your thoughts",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InputField(
                      textInputType: TextInputType.multiline,
                      hintText: "Your opinion in this question..",
                      maxline: 5,
                      controller: provider.writeThoughts,
                      // prefixIcon: const Icon(Icons.person),

                      validation: Validators.meetingagenda),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Attachment (PDF/Images/Video)",
                    style: TextStyle(
                      color: Color(0xff202020),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Stack(
                    children: [
                      Container(
                        width: 350,
                        height: 147,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffEBF6F7),
                        ),
                        child: provider.image != null
                            ? Image.file(
                                provider.image!,
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/upload.svg"),
                                  TextButton.icon(
                                      onPressed: (() {
                                        provider.pickFile();
                                      }),
                                      icon: const Icon(Icons.add),
                                      label: const Text("Add file"))
                                ],
                              ),
                      ),
                      provider.image != null
                          ? Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: provider.removeFile,
                                icon: const Icon(Icons.close),
                              ),
                            )
                          :const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomMaterialButtton(
                      text: "Post",
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        )));
  }

  @override
  WritePostVM create() => WritePostVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
