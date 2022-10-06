import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';

class HomePageMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }

  final List<Map> mentors = List.generate(
      5,
      (index) => {
            "profile": "",
            "name": "Professor $index",
            "profession": "profession $index",
            "review": "⭐️ 4.5 (135 reviews)"
          }).toList();

  //          List<Map> areaslooking = [
  //   {"name": "Interview", "isChecked": false},
  //   {"name": "Java", "isChecked": false},
  //   {
  //     "name": "Python",
  //     "isChecked": false,
  //   },
  //   {"name": "Sql", "isChecked": false},
  //   {"name": "Surfling The Internet", "isChecked": false}
  // ];
}
