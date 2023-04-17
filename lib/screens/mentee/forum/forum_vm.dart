import 'package:dio/dio.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/feed_model.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

class ForumMenteeVM extends BaseViewModel {
  @override
  void onInit() {
    // TODO: implement onInit
    // likePost(index);
  }

  // bool isLiked = false;
  // int likeCount = 0;
  List<FeedPost> posts = List.generate(
      20,
      (index) => FeedPost(
            comments: List.generate(
              4,
              (index) => CommentsModel(
                  comment: "Well explained with easy examples.",
                  commentorId: "1",
                  commentorName: "Saurabh Mehta",
                  commentorProfile: "",
                  hoursAgo: "2 hours ago",
                  subComments: List.generate(
                      3,
                      (index) => SubComment(
                          comment: "Subcomment${index}",
                          commentorId: "${index}",
                          commentorName: "commentorName${index}",
                          commentorProfile: "",
                          hoursAgo: "3 hours ago"))),
            ),
            postID: '0',
            hoursAgo: " 2 hr ago",
            tags: "cvbn",
            userType: "mentor",
            description:
                "SAP stands for system applications and products in data processing.",
            designation: "Interaction Designer",
            favouriteCount: 2,
            imageUrl: "",
            likeCount: 3,
            messageCount: 3,
            shareCount: 1,
            title: "What is SAP ?",
            userId: "",
            userName: "Oyin Dolapo",
            userProfile: "",
          ));
  void likePost(int index) {
    print('Like button pressed');
    print(index);
    // setState(() {

    if (posts[index].isLiked == true) {
      posts[index].isLiked = false;
      // likeCount -= 1;
      posts[index].likeCount = posts[index].likeCount! - 1;
      print(posts[index].isLiked);
      notifyListeners();
    } else {
      posts[index].isLiked = true;
      // likeCount += 1;
      posts[index].likeCount = posts[index].likeCount! + 1;
      print(posts[index].isLiked);
      notifyListeners();
    }
    print('Like count: $posts[index].likeCount');
    print('Is liked: $posts[index].isLiked');
    // });
  }

  List tempmentorList = [];
  List<MentorModel> topMentorList = [];

  void getTopMentors() async {
    showLoading();
    final res = await api.menteeRepo.getTopMentors();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        tempmentorList = res.data['DATA'] as List;
        topMentorList =
            tempmentorList.map((e) => MentorModel.fromjson(e)).toList();

        notifyListeners();
      } else {
        showError(res.data['message']);
      }
    } else {
      showError("servere Error");
    }
  }
}
