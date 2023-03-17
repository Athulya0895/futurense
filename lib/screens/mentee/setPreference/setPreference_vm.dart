import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

import 'package:futurensemobileapp/screens/mentee/home/home/home.dart';

import 'package:lottie/lottie.dart';

class SetPreferenceMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    getMenteePreference();
    prefs.firsttimeLogin = true;
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController preferenceDescription = TextEditingController();
  // Generate a list of available hobbies here

  // List<Map> areaslooking = [
  //   {"name": "Interview", "isChecked": false},
  //   {"name": "Java", "isChecked": false},
  //   {
  //     "name": "Python",
  //     "isChecked": false,
  //   },
  //   {"name": "Sql", "isChecked": false},
  //   {"name": "Surfling The Internet", "isChecked": false}
  // ];

  List<dynamic> areaslooking = [];
  String? description;

  void getMenteePreference() async {
    showLoading();
    final res = await api.menteeRepo.getMenteePreference();
    // print(res);
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == "true") {
        // print("true");
        areaslooking = res.data['Data']['areaslooking'];
        description = res.data['Data']['mentorship'] ?? "";
        notifyListeners();

        preferenceDescription.text = description ?? "";
      }
    }
    notifyListeners();
  }

//update mentee preference
  void UpdateMenteePreference(BuildContext context) async {
 
    List<Map> checkboxlist = [];
    for (var i = 0; i < areaslooking.length; i++) {
      checkboxlist.add({
        "name": areaslooking[i]['name'],
        "isChecked": areaslooking[i]['isChecked']
      });
    }
    // print(checkboxlist);
    final body = jsonEncode({
      "mentorship": preferenceDescription.text,
      "areaslooking": checkboxlist
    });

    showLoading();
    final res = await api.menteeRepo.postMenteePreference(body);
  
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == "true") {
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
                      child: Lottie.asset(
                        'assets/Rescheduled.json',
                        fit: BoxFit.fill,
                        reverse: true,
                        repeat: false,
                        //      onLoaded: (value) async {
                        //   await Future.delayed(value.duration);
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => HomeMentee()));
                        // }
                        onLoaded: (value) async {
                          // Future.delayed(value.duration).then((value) {
                          //   Navigator.push(
                          //     context,
                          //     PageRouteBuilder(
                          //       pageBuilder:
                          //           (context, animation1, animation2) =>
                          //               const HomeMentee(),
                          //       transitionDuration: Duration.zero,
                          //       reverseTransitionDuration: Duration.zero,
                          //     ),
                          //     // MaterialPageRoute(
                          //     //     builder: (context) => const HomeMentee()),
                          //   );
                          // });
                          Future.delayed(value.duration).then((value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const HomeMentee(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero),
                                (route) => false);
                          });
                        },
                      ),
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
      } else {
        print(res.data['message']);
      }
    } else {
      showError("Server Error");
    }
    notifyListeners();
  }
}
