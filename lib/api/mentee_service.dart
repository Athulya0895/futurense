import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurensemobileapp/api/api_config.dart';
import 'package:futurensemobileapp/api/mentor_service.dart';
import 'package:futurensemobileapp/utils/locator.dart';
import 'package:futurensemobileapp/utils/share_prefs.dart';

abstract class MenteeRepo {
  factory MenteeRepo(Dio dio) = _MenteeServices;
  Future<dynamic> getMenteePreference();
  Future<dynamic> postMenteePreference(String body);
  Future<dynamic> getMentee(FormData body);
  Future<dynamic> getCategory();
  Future<dynamic> getTopMentors();
  Future<dynamic> getTimeSlots(FormData body, String id);
  Future<dynamic> postSheduleMeeting(String body, String id);
  Future<dynamic> getTopTechnicalMentee();
  Future<dynamic> getTopMentalAssistance();
  Future<dynamic> getTopEngagementManager();
  Future<dynamic> filterMentee(FormData body, String categoryName);
  Future<dynamic> getConfirmedUpcomingMeeting();
  Future<dynamic> getSentUpcomingMeeting();
  Future<dynamic> getReceivedUpcomingMeeting();
  Future<dynamic> getPreviousMeetings();
  Future<dynamic> getCancelledMeetings();
  Future<dynamic> postFeedback(FormData body, String mentorId);
  Future<dynamic> acceptMeeting(FormData body);
  Future<dynamic> cancelMeeting(FormData body);
  Future<dynamic> rescheduleMeeting(FormData body);
  Future<dynamic> getNotification();
}

class _MenteeServices implements MenteeRepo {
  _MenteeServices(this._dio);
  final Dio _dio;
  final prefs = locator<SharedPrefs>();

  @override
  Future getMenteePreference() async {
    try {
      var res = await _dio.get(ApiConfig.getMentorPreference, queryParameters: {
        'fn': "MenteeSkillSet",
        'id': prefs.userId.toString()
      });
      return res;
    } catch (e) {
      log("Error api calling getMenteepreference", error: e);
      return false;
    }
  }

  @override
  Future postMenteePreference(String body) async {
    try {
      var res = await _dio.get(ApiConfig.getMentorPreference, queryParameters: {
        'fn': "MenteeSkillSet",
        'id': prefs.userId.toString()
      });
      return res;
    } catch (e) {
      log("Error api calling update mentee preference", error: e);
      return false;
    }
  }

  @override
  Future getCategory() async {
    try {
      var res = await _dio.get(ApiConfig.getCategory, queryParameters: {
        'fn': "GetCategories",
      });
      return res;
    } catch (e) {
      log("error while calling get Categoryapi", error: e);
      return false;
    }
  }

  @override
  Future getTopMentors() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        'fn': "TopMentors",
      });
      return res;
    } catch (e) {
      log("Error while calling getTopmenmtor api", error: e);
      return false;
    }
  }

  @override
  Future getMentee(FormData body) async {
    try {
      var res = await _dio.post(ApiConfig.baseapi, data: body);
      return res;
    } catch (e) {
      log("Error while calling getmentee", error: e);
      return false;
    }
  }

  @override
  Future getTimeSlots(FormData body, String id) async {
    try {
      final res = await _dio.post(ApiConfig.baseapi,
          data: body,
          queryParameters: {
            'fn': "GetTimeSlotsById",
            'id': id,
            'role': "mentee"
          });
      return res;
    } catch (e) {
      log("Error While running getTimeSlots ", error: e);
      return false;
    }
  }

  @override
  Future postSheduleMeeting(String body, String id) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'role': "mentee",
        'fn': "PostScheduleMeeting",
        'student_id': prefs.userId.toString(),
        "faculty_id": id,
      });
      return res;
    } catch (e) {
      log("Error while running postShedulingmeeting", error: e);
      return false;
    }
  }

  @override
  Future getTopTechnicalMentee() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        'fn': "TopTechnicalMentors",
      });
      return res;
    } catch (e) {
      log("Error while running gettoptechnicalMentee api", error: e);
      return false;
    }
  }

  @override
  Future getTopMentalAssistance() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi,
          queryParameters: {'fn': "TopMentalWellMentors"});
      return res;
    } catch (e) {
      log("Error while running getTopMentalwellbeing");
      return false;
    }
  }

  @override
  filterMentee(FormData body, String categoryName) async {
    try {
      var res = await _dio.post(
        ApiConfig.baseapi,
        data: body,
        queryParameters: {
          "fn": "filterSearch",
          "role": "mentee",
          "category": categoryName
        },
      );
      return res;
    } catch (e) {
      log("Error while running getfilterlist", error: e);
      return false;
    }
  }

  @override
  Future getConfirmedUpcomingMeeting() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        "fn": "UpcomingMeetingsConfirmed",
        "role": "mentee",
        "student_id": prefs.userId.toString(),
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
        "role": "mentee",
        "student_id": prefs.userId.toString(),
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
        "role": "mentee",
        "student_id": prefs.userId.toString(),
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
        "role": "mentee",
        "student_id": prefs.userId.toString(),
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
        "role": "mentee",
        "student_id": prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error While calling getCancel meetings");
      return false;
    }
  }

  @override
  Future postFeedback(FormData body, String mentorId) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'role': "mentee",
        'fn': "ShareFeedback",
        'student_id': prefs.userId.toString(),
        "faculty_id": mentorId,
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
        'role': "mentee",
      });
      return res;
    } catch (e) {
      log("Error while calling acceptMeeting");
      return false;
    }
  }

  @override
  Future cancelMeeting(FormData body) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'fn': "CancelMeeting",
      });
      return res;
    } catch (e) {
      log("Error while calling Cancel Meeting");
      return false;
    }
  }

  @override
  Future getTopEngagementManager() async {
    try {
      var res = await _dio.get(ApiConfig.baseapi,
          queryParameters: {'fn': "TopEngagementMentors"});
      return res;
    } catch (e) {
      log("Error while running getTopMentalwellbeing");
      return false;
    }
  }

  @override
  Future rescheduleMeeting(FormData body) async {
    try {
      final res =
          await _dio.post(ApiConfig.baseapi, data: body, queryParameters: {
        'fn': "RescheduleMeeting",
        'role': "mentee",
      });
      return res;
    } catch (e) {
      log("Error while calling reschedule Meeting");
      return false;
    }
  }

  @override
  Future getNotification() async {
    try {
      final res = await _dio.get(ApiConfig.baseapi, queryParameters: {
        'fn': "getNotifications",
        'user_id': prefs.userId.toString(),
      });
      return res;
    } catch (e) {
      log("Error while calling getNotification");
      return false;
    }
  }
}
