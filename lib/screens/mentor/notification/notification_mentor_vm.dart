import 'package:dio/dio.dart';
import 'package:futurensemobileapp/base/base_view_model.dart';
import 'package:futurensemobileapp/models/notification_model.dart';
import 'package:futurensemobileapp/utils/messages.dart';

class NotificationMentorVM extends BaseViewModel {
  @override
  void onInit() {
    getNotification();
  }

// NotificationModel? notificationList;
  List<NotificationModel> notifications = [];
  void getNotification() async {
    showLoading();
    var res = await api.mentorRepo.getNotification();
    hideLoading();
    if (res.runtimeType == Response) {
      if (res.data['status'] == true) {
        // notificationList = NotificationModel.fromJson(res.data['DATA']);
        final List data = res.data['DATA'] as List;
        print(" Hey data");
        print(data);
        notifications = data.map((e) => NotificationModel.fromJson(e)).toList();
        // print("hey notification");
        // print(notifications);
        // print(notifications?.length);
        // print(notifications?[0].notification?.length);
        notifyListeners();
        //  var rest = data["articles"] as List;
        // print(rest);
        // list = rest.map<Article>((json) => Article.fromJson(json)).toList();
      } else {
        showError(Messages.unknownError);
      }
    }
  }
}
