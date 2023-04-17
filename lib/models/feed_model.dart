class FeedPost {
  String? postID;
  String? userId;
  String? userName;
  String? designation;
  String? userType;
  String? userProfile;
  String? hoursAgo;
  bool isExpanded;
  String? imageUrl;
  String? title;
  String? description;
  bool? isLiked;
  int? likeCount;
  int? favouriteCount;
  int? messageCount;
  int? shareCount;
  String? tags;
  List<CommentsModel>? comments;

  FeedPost({
    this.postID,
    this.userId,
    this.userName,
    this.userProfile,
    this.hoursAgo,
    this.isExpanded = false,
    this.designation,
    this.userType,
    this.imageUrl,
    this.title,
    this.description,
    this.isLiked = false,
    this.likeCount,
    this.favouriteCount,
    this.messageCount,
    this.shareCount,
    this.tags,
    this.comments,
  });

  factory FeedPost.fromJson(Map<String, dynamic> json) {
    var commentListResult = json['comment'] as List;

    List<CommentsModel> commentList = [];
    commentList =
        commentListResult.map((e) => CommentsModel.fromJson(e)).toList();
    return FeedPost(
      postID: json['postID'],
      userId: json['userId'],
      userName: json['userName'],
      userProfile: json['userProfile'],
      hoursAgo: json['hoursAgo'],
      designation: json['designation'],
      userType: json['userType'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      isLiked: json['isLiked'],
      likeCount: json['likeCount'],
      favouriteCount: json['favouriteCount'],
      messageCount: json['messageCount'],
      shareCount: json['shareCount'],
      tags: json['tags'],
      comments: commentList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postID': postID,
      'userId': userId,
      'userName': userName,
      'userProfile': userProfile,
      'hoursAgo': hoursAgo,
      'designation': designation,
      'userType': userType,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'likeCount': likeCount,
      'isLiked': isLiked,
      'favouriteCount': favouriteCount,
      'messageCount': messageCount,
      'shareCount': shareCount,
      'tags': tags,
      'comments': comments,
    };
  }
}

class CommentsModel {
  String? commentorId;
  String? commentorName;
  String? commentorProfile;
  String? hoursAgo;
  String? comment;
  final List<SubComment>? subComments;
  CommentsModel({
    this.commentorId,
    this.commentorName,
    this.commentorProfile,
    this.comment,
    this.hoursAgo,
    this.subComments,
  });
  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    var subcommentListResult = json['comment'] as List;

    List<SubComment> subcommentList = [];
    subcommentList =
        subcommentListResult.map((e) => SubComment.fromJson(e)).toList();
    return CommentsModel(
      commentorId: json['commentorId'],
      commentorName: json['commentorName'],
      commentorProfile: json['commentorProfile'],
      comment: json['comment'],
      hoursAgo: json['hoursAgo'],
      subComments: subcommentList,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'commentorId': commentorId,
      'commentorName': commentorName,
      'commentorProfile': commentorProfile,
      'comment': comment,
      'hoursAgo': hoursAgo,
      'subComments': subComments,
    };
  }
}

class SubComment {
  String? commentorId;
  String? commentorName;
  String? commentorProfile;
  String? hoursAgo;
  String? comment;
  SubComment({
    this.commentorId,
    this.commentorName,
    this.commentorProfile,
    this.comment,
    this.hoursAgo,
  });
  factory SubComment.fromJson(Map<String, dynamic> json) {
    return SubComment(
        commentorId: json['commentorId'],
        commentorName: json['commentorName'],
        commentorProfile: json['commentorProfile'],
        comment: json['comment'],
        hoursAgo: json['hoursAgo']);
  }
  Map<String, dynamic> toJson() {
    return {
      'commentorId': commentorId,
      'commentorName': commentorName,
      'commentorProfile': commentorProfile,
      'comment': comment,
      'hoursAgo': hoursAgo,
    };
  }
}
