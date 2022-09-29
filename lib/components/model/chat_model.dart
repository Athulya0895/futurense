// // import 'package:cloud_firestore/cloud_firestore.dart';

// // import '../utils/locator.dart';
// // import '../utils/share_prefs.dart';

// import 'package:futurensemobileapp/utils/locator.dart';
// import 'package:futurensemobileapp/utils/share_prefs.dart';

// class ChatModel {
//   String? message;
//   String? messageType;
//   DateTime? date;
//   bool? isUser;
//   bool? isRead;
//   ChatModel(
//       {this.date, this.messageType, this.isUser, this.message, this.isRead});

//   factory ChatModel.fromJson(e) {
//     return ChatModel(
//         date: DateTime.parse(e['time'].toDate().toString()),
//         message: e['message'],
//         isRead: e['is_read'],
//         isUser:
//             e['user'].toString() == locator<SharedPrefs>().user?.id.toString(),
//         messageType: e['message_type']);
//   }
//   Map<String, dynamic> toJSON() {
//     return <String, dynamic>{
//       'time': Timestamp.fromDate(DateTime.now()),
//       'message': message,
//       'message_type': '0',
//       'user': locator<SharedPrefs>().user?.id.toString(),
//       'is_read': false,
//     };
//   }
// }
