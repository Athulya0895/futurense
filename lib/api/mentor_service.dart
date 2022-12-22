import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:futurensemobileapp/api/api_config.dart';
import 'package:futurensemobileapp/utils/locator.dart';
import 'package:futurensemobileapp/utils/share_prefs.dart';

abstract class MentorRepo {
  factory MentorRepo(Dio dio) = _MentorServices;
  Future<dynamic> getMentor(FormData body);
  Future<dynamic> getCurrentCompany(FormData body);
  Future<dynamic> getDomainExpertise();
  Future<dynamic> getJobtitle();
  Future<dynamic> getExperience();
  Future<dynamic> getSkillset();
  Future<dynamic> getMentorPreference();
  Future<dynamic> postMentorPreference(String body);
  Future<dynamic> updateProfile(FormData body);
  Future<dynamic> getTopMentees();
  Future<dynamic> getTimeslotMentor(FormData body, String id);
  Future<dynamic> postSheduleMeetingMentor(String body, String id);
  Future<dynamic> getConfirmedUpcomingMeeting();
  Future<dynamic> getSentUpcomingMeeting();
  Future<dynamic> getReceivedUpcomingMeeting();
  Future<dynamic> getPreviousMeetings();
  Future<dynamic> getCancelledMeetings();
  Future<dynamic> postFeedback(FormData body, String menteeId);
  Future<dynamic> acceptMeeting(FormData body);
  Future<dynamic> rescheduleMeeting(FormData body);
  Future<dynamic> filterMentor(FormData body, String category);
  Future<dynamic> getReview(String userId);
}

class _MentorServices implements MentorRepo {
  _MentorServices(this._dio);
  final Dio _dio;
  final prefs = locator<SharedPrefs>();

//get mentor details
  @override
  Future getMentor(FormData body) async {
    try {
      var res = await _dio.post(ApiConfig.getMentor, data: body);
      return res;
    } catch (e) {
      log("error api calling getmentor", error: e);
      return false;
    }
  }

  @override
  Future getCurrentCompany(FormData body) async {
    try {
      var res = await _dio.post(ApiConfig.getCurrentCompany, data: body);
      return res;
    } catch (e) {
      log("error api calling getCurrentCompany", error: e);
      return false;
    }
  }

  @override
  Future getDomainExpertise() async {
    try {
      var res = await _dio.post(ApiConfig.getDomainexpertise,
          queryParameters: {"fn": "GetDomainExpertise"});
      return res;
    } catch (e) {
      log("error api calling getDomainExpertise ", error: e);
      return false;
    }
  }

  @override
  Future getJobtitle() async {
    try {
      var res = await _dio.post(ApiConfig.getJobTitle,
          queryParameters: {"fn": "GetDesignationDetails"});
      return res;
    } catch (e) {
      log("error api calling jobtitle", error: e);
      return false;
    }
  }

  @override
  Future getMentorPreference() async {
    try {
      var res = await _dio.get(ApiConfig.getMentorPreference, queryParameters: {
        'fn': "MentorSkillSet",
        'id': prefs.userId.toString()
      });
      return res;
    } catch (e) {
      log("Error api calling getMentorpreference", error: e);
      return false;
    }
  }

  @override
  Future postMentorPreference(String body) async {
    try {
      var res = await _dio.post(
        ApiConfig.updateMentorpreference,
        data: body,
        queryParameters: {
          'fn': "MentorSkillSet",
          'id': prefs.userId.toString()
        },
      );
      return res;
    } catch (e) {
      log("Error api Calling postMentorPreference", error: e);
      return false;
    }
  }

  @override
  Future updateProfile(FormData body) async {
    try {
      var res = await _dio.post(ApiConfig.updateProfile,
          data: body,
          queryParameters: {
            'fn': "UpdateProfile",
            'id': prefs.userId.toString()
          });
      return res;
    } catch (e) {
      log("Error api Calling Update Profile", error: e);
      return false;
    }
  }

  @override
  Future getExperience() async {
    try {
      var res = await _dio.get(
        ApiConfig.getExperience,
        queryParameters: {
          'fn': "GetWorkExpList",
        },
      );
      return res;
    } catch (e) {
      log("Error api calling getExperience", error: e);
      return false;
    }
  }

  @override
  Future getTopMentees() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "TopMentees",
      });
      return res;
    } catch (e) {
      log("Error api calling gettopMentees");
      return false;
    }
  }

  @override
  Future getTimeslotMentor(FormData body, String id) async {
    try {
      final res = await _dio.post(ApiConfig.baseapi,
          data: body,
          queryParameters: {
            'fn': "GetTimeSlotsById",
            'id': id,
            'role': "mentor"
          });
      return res;
    } catch (e) {
      log("Error While running getTimeSlotsmentor ", error: e);
      return false;
    }
  }

  @override
  Future postSheduleMeetingMentor(String body, String id) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'role': "mentor",
        'fn': "PostScheduleMeeting",
        'student_id': id,
        "faculty_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error while running postShedulingmeeting", error: e);
      return false;
    }
  }

  @override
  Future getSkillset() async {
    try {
      var res = await _dio
          .get(ApiConfig.baseapi, queryParameters: {"fn": "GetSkillSets"});
      return res;
    } catch (e) {
      log("Error while running getskillset api call", error: e);
      return false;
    }
  }

  @override
  Future getConfirmedUpcomingMeeting() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "UpcomingMeetingsConfirmed",
        "role": "mentor",
        "faculty_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error while  running getupcoming confirmed", error: e);
      return false;
    }
  }

  @override
  Future getSentUpcomingMeeting() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "UpcomingMeetingsSent",
        "role": "mentor",
        "faculty_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error while running get sent upcoming meeting");
      return false;
    }
  }

  @override
  Future getReceivedUpcomingMeeting() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "UpcomingMeetingsReceived",
        "role": "mentor",
        "faculty_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error while running get received upcoming meeting");
      return false;
    }
  }

  @override
  Future getPreviousMeetings() async {
    try {
      final res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "PreviousMeetings",
        "role": "mentor",
        "faculty_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error While running get previous meetings");
      return false;
    }
  }

  @override
  Future getCancelledMeetings() async {
    try {
      final res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "CancelledMeetings",
        "role": "mentor",
        "faculty_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error While calling getCancel meetings");
      return false;
    }
  }

  @override
  Future postFeedback(FormData body, String menteeId) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'role': "mentee",
        'fn': "ShareFeedback",
        'faculty_id': prefs.userId.toString(),
        "student_id": menteeId,
      });
      return res;
    } catch (e) {
      log("Error while calling postFeedback");
      return false;
    }
  }

  @override
  Future acceptMeeting(FormData body) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'fn': "AcceptMeeting",
        'role': "mentor",
      });
      return res;
    } catch (e) {
      log("Error while calling acceptMeeting");
      return false;
    }
  }

  @override
  Future rescheduleMeeting(FormData body) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'fn': "RescheduleMeeting",
        'role': "mentor",
      });
      return res;
    } catch (e) {
      log("Error while calling reschedule Meeting");
      return false;
    }
  }

  @override
  Future filterMentor(FormData body, String category) async {
    try {
      var res = await _dio.post(
        ApiConfig.baseapi,
        data: body,
        queryParameters: {
          "fn": "filterSearch",
          "role": "mentor",
          "category": category
        },
      );
      return res;
    } catch (e) {
      log("Error while running getfilterlist", error: e);
      return false;
    }
  }

  @override
  Future getReview(String userId) async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "CheckReviews",
        "user_id": userId,
      });
      return res;
    } catch (e) {
      log("Error while runnuning getReviews", error: e);
      return false;
    }
  }
}
