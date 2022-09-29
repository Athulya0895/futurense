import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/screens/mentee/setPreference/setPreference_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

class SetPreference extends StatefulWidget {
  const SetPreference({super.key});

  @override
  State<SetPreference> createState() => _SetPreferenceState();
}

class _SetPreferenceState extends State<SetPreference>
    with BasePage<SetPreferenceVM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Set Your Mentoring Type",
          style: TextStyle(
              color: Color(0xff777A95).withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        leading: const BackButtonCustom(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
        child: Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mentoring Others",
                style: TextStyle(
                    color: Color(0xff202020),
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Describe your experience and what you'd like to help memntees with",
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(height: 5),
              InputField(
                  hintText:
                      "Use 3-4 sentence to sell yourself as a prospective mentor",
                  controller: provider.preferenceDescription,
                  maxline: 5,
                  minline: 1,
                  // prefixIcon: const Icon(Icons.person),

                  validation: Validators.basic),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Prefered Meeting Type",
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              DropDownMenuMode(
                  borderRadius: 10,
                  hinttext: "Virtual or in Person Meeting",
                  validationText: "",
                  items: const [
                    "Virtual Meeting",
                    "inPerson Meeting",
                    "virtual & PersonalMeeting"
                  ],
                  setdata: () {}),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "How many people can you mentor ?",
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              DropDownMenuMode(
                  borderRadius: 10,
                  hinttext: "Virtual or in Person Meeting",
                  validationText: "",
                  items: const [
                    "1 People",
                    "2 People",
                    "3 People",
                    "4 People",
                    "5 People",
                    "Up to Ten People"
                  ],
                  setdata: () {}),
              const Text(
                "Where can you offer help and support?",
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              Column(
                  children: provider.areaslooking.map((area) {
                return CheckboxListTile(
                    activeColor: const Color(0xffFDBA2F),
                    checkColor: Colors.white,
                    value: area["isChecked"],
                    title: Text(
                      area["name"],
                      style: const TextStyle(
                          color: Color(0xff202020),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        area["isChecked"] = newValue;
                      });
                    });
              }).toList()),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  padding: const EdgeInsets.only(bottom: 15, top: 15),
                  minWidth: double.infinity,
                  color: const Color(0xffFDBA2F),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MyAccount()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  SetPreferenceVM create() => SetPreferenceVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
