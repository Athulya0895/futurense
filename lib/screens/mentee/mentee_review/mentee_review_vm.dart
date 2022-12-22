import 'package:dio/dio.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/models/review_model.dart';

class MenteeReviewVM extends BaseViewModel {
  @override
  void onInit() {
    getReviews();
  }

  ReviewModel? reviewsList;
  //get Reviews of student
  late MentorModel? mentor;
  void getReviews() async {
    showLoading();
    var res = await api.mentorRepo.getReview(mentor!.id.toString());
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        reviewsList = ReviewModel.fromJson(res.data['Data']);
     
     
        notifyListeners();
      } else {
        showNotification("No reviews Found");
      }
    } else {
      showError(res.data['message']);
    }
  }
}
