class NotificationModel {
  String? date;
  List<Notification>? notification;
  NotificationModel({this.date, this.notification});
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    var notificationListResult = json['notification'] as List;

    List<Notification> notificationList = [];
    notificationList =
        notificationListResult.map((e) => Notification.fromJson(e)).toList();
    return NotificationModel(
        // rating: json['rating'],
        // feedbacksBy: notificationList,
        date: json['date'],
        notification: notificationList);
  }
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'rating': rating,
  //   };
  // }
}

class Notification {
  String? title;
  int? index;
  String? body;

  Notification({
    this.title,
    this.index,
    this.body,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      title: json['title'],
      index: json['index'],
      body: json['body'],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'index': index,
      'body': body,
    };
  }
}
