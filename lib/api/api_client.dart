import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:futurensemobileapp/api/mentee_service.dart';
import 'package:futurensemobileapp/api/mentor_service.dart';
import './auth_services.dart';
import '/api/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      headers: {HttpHeaders.acceptHeader: "accept: application/json"},
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  late AuthRepo authRepo;
  late MentorRepo mentorRepo;
  late MenteeRepo menteeRepo;
  ApiClient() {
    // _dio.interceptors.add(
    //   PrettyDioLogger(
    //     responseHeader: true,
    //     requestHeader: true,
    //     requestBody: true,
    //     request: true,
    //   ),
    // );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler requestInterceptorHandler) async {
          return requestInterceptorHandler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
         
          if (response.data is String) {
            final jsonResponse = jsonDecode(response.data);
            response.data = jsonResponse;
          }
          return handler.next(response);
        },
        onError: (
          DioError error,
          ErrorInterceptorHandler handler,
        ) async {
          log('DioError, $error');
          return handler.next(error);
        },
      ),
    );
    authRepo = AuthRepo(_dio);
    mentorRepo = MentorRepo(_dio);
    menteeRepo = MenteeRepo(_dio);
  }
}
