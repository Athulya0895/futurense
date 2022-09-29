import 'dart:developer';
import 'package:dio/dio.dart';

import 'api_config.dart';

abstract class AuthRepo {
  factory AuthRepo(Dio dio) = _AuthServices;
  Future<dynamic> login(FormData body);
  //  Future<dynamic> createVideoPromo(FormData body);
  Future<dynamic> signup(String body);
}

class _AuthServices implements AuthRepo {
  _AuthServices(this._dio);
  final Dio _dio;

  @override
  Future login(FormData body) async {
    try {
      var res = await _dio.post(ApiConfig.login, data: body);
      return res;
    } catch (e) {
      log("error api call login", error: e);
      return false;
    }
  }

  @override
  Future signup(String body) async {
    try {
      // var res=await _dio.post(Api)
    } catch (e) {}
//  Future getUser(String body) async {
    //   try {
    //     var res = await _dio.post(ApiConfig.getUser, data: body);
    //     return res;
    //   } catch (e) {
    //     log("error api call getUser", error: e);
    //     return false;
    //   }
    // }
  }
}
