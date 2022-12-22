import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/screens/mentor/home/home/home.dart';
import 'package:futurensemobileapp/screens/mentor/mentor_myaccount/mentor_myaccount.dart';
import 'package:lottie/lottie.dart';

class SetPreferenceMentorVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
    getMentorPreference();
    prefs.firsttimeLogin = true;
    // preferenceDescription = new TextEditingController(text: description);
    // print(description.toString());
    // preferenceDescription.text = description ?? "";
    // print("menorship");
    // print(preferenceDescription.text);
    // print("mentorship");
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController preferenceDescription = TextEditingController();

  List<dynamic> areaslooking = [];
  String? description;

  void getMentorPreference() async {
    showLoading();
    final res = await api.mentorRepo.getMentorPreference();
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        print(true);
        areaslooking = res.data['Data']['areaslooking'];
        description = res.data['Data']['mentorship'] ?? "";
        notifyListeners();
        print(res.data['Data']['mentorship']);
        preferenceDescription.text = description ?? "";
      }
    }
    notifyListeners();
  }

  //Update MentorPreference
  void UpdateMentorPreference(BuildContext context) async {
    List<Map> checkboxlist = [];
    for (var i = 0; i < areaslooking.length; i++) {
      checkboxlist.add({
        "name": areaslooking[i]['name'],
        "isChecked": areaslooking[i]['isChecked']
      });
    }
    print(checkboxlist);
    final body = jsonEncode({
      "mentorship": preferenceDescription.text,
      "areaslooking": checkboxlist
    });

    showLoading();
    final res = await api.mentorRepo.postMentorPreference(body);
    print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        // showNotification(res.data['message']);
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.white,
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(26),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset("assets/success.png"),
                    Center(
                      child: Lottie.asset('assets/Rescheduled.json',
                          fit: BoxFit.fill,
                          reverse: true,
                          repeat: false, onLoaded: (value) async {
                        await Future.delayed(value.duration);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Changes Saved!",
                      style: TextStyle(color: Color(0xff6EBFC3), fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          },
        );
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Home()));

      } else {
        print("false");
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }
}



// update(context) async {
//     if (formKey.currentState!.validate()) {
//       final body = {
//         "user": user?.userId,
//         "password":
//             passwordController.text.isEmpty ? false : passwordController.text,
//         "district_id": user?.district,
//         "region_id": "",
//         "form_id": selectedFrom['id'],
//         "school_id": selectedSchool['id'],
//         "phone": user?.phone,
//         "firstname": nameController.text,
//         "lastname": "",
//         "new_password": newPasswordController.text.isEmpty
//             ? false
//             : newPasswordController.text
//       };
//       showLoading();
//       final res = await api.userRepo.updateUser(jsonEncode(body));
//       hideLoading();

//       if (res.runtimeType == Response) {
//         showLoading();
//         final resuser = await api.userRepo
//             .getCurrentUser(jsonEncode({"user": prefs.user?.userId ?? ""}));

//         hideLoading();

//         if (resuser.runtimeType == Response) {
//           List? data = resuser.data['data'] as List?;
//           if (data?.isNotEmpty == true) {
//             user = UserModel.fromJson(data![0]);
//             notifyListeners();
//             prefs.user = user;
//             if (res.data['success'] == true) {
//               prefs.user = user!..firstname = nameController.text;
//               await SuccessPopup().show(context);
//               Navigator.pop(context);
//             } else {
//               showError(res.data['message'] ?? Messages.unknownError);
//             }
//           }
//         }
//       } else {
//         showError(Messages.serverError);
//       }
//     }
//   }