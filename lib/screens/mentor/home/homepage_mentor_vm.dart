import 'package:futurensemobileapp/base/base_view_model.dart';

class HomePageMentorVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
  }
  final List<Map> mentees = List.generate(
      5,
      (index) => {
            "profile": "",
            "name": "Professor $index",
            "profession": "profession $index",
            "review": "⭐️ 4.5 (135 reviews)"
          }).toList();



          
}
