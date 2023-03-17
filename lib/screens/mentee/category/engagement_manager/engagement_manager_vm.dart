import 'package:dio/dio.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class EngagementManagerVM extends BaseViewModel {
  @override
  void onInit() {
    getTopEngagementManager();
  }

  //get Top MentorList
  List temptopengagementmanager = [];
  List<MentorModel> topEngagementmanager = [];
  void getTopEngagementManager() async {
    showLoading();
    final res = await api.menteeRepo.getTopEngagementManager();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
      
        temptopengagementmanager = res.data['DATA'] as List;
        topEngagementmanager = temptopengagementmanager
            .map((e) => MentorModel.fromjson(e))
            .toList();
      
   
        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("server Error");
    }
  }
}
