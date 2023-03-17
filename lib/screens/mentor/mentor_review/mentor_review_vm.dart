import 'package:dio/dio.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/review_model.dart';

class MentorReviewVM extends BaseViewModel {
  @override
  void onInit() {
    getReviews();
  }

// List<ReviewModel> jobtitleList = [];
  ReviewModel? reviewsList;
  //get Reviews of student
  late MentorModel? mentee;
  void getReviews() async {
    showLoading();
    var res = await api.mentorRepo.getReview(mentee!.id.toString());
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        reviewsList = ReviewModel.fromJson(res.data['Data'] ?? "");
       
        notifyListeners();
      } else {
        showNotification("No reviews Found");
      }
    } else {
      showError(res.data['message']);
    }
  }
}
