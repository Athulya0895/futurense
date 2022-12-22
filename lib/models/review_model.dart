class ReviewModel {
  String? rating;
  List<FeedbacksBy>? feedbacksBy;
  ReviewModel({this.rating, this.feedbacksBy});
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    var feebackListResult = json['feedbacks_by'] as List;
    
    List<FeedbacksBy> feedbackList = [];
    feedbackList =
        feebackListResult.map((e) => FeedbacksBy.fromJson(e)).toList();
    return ReviewModel(
      rating: json['rating'],
      feedbacksBy: feedbackList,
    );
  }
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'rating': rating,
  //   };
  // }
}

class FeedbacksBy {
  String? profilePic;
  String? sharedBy;
  String? name;
  String? rating;
  String? review;

  FeedbacksBy(
      {this.profilePic, this.sharedBy, this.name, this.rating, this.review});

  factory FeedbacksBy.fromJson(Map<String, dynamic> json) {
    return FeedbacksBy(
      profilePic: json['profile_pic'],
      sharedBy: json['shared_by'],
      name: json['name'],
      rating: json['rating'],
      review: json['review'],
    );
  }
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'profile_pic': profilePic,
  //     'shared_by': sharedBy,
  //     'name': name,
  //     'rating': rating,
  //     'review': review,
  //   };
  // }
}
