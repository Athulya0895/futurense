import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:futurensemobileapp/api/api_config.dart';
import 'package:futurensemobileapp/utils/locator.dart';
import 'package:futurensemobileapp/utils/share_prefs.dart';

abstract class MentorRepo {
  factory MentorRepo(Dio dio) = _MentorServices;
  Future<dynamic> getMentor(FormData body);
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
    } catch (e) {
      log("error api calling getmentor", error: e);
      return false;
    }
  }
}
