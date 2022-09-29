import 'package:futurensemobileapp/base/base_view_model.dart';

class MentorListVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  final List<Map> mentors = List.generate(
      10,
      (index) => {
            "profile": "",
            "name": "Professor $index",
            "profession": "profession $index",
            "review": "⭐️ 4.5 (135 reviews)"
          }).toList();
}
