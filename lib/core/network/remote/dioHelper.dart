import 'dart:io';
import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      connectTimeout:Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
        Map<String, dynamic>? qury,
        String lang = 'en',
        String? token}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': "Bearer ${token}"
    };
    return await dio!.get(url, queryParameters: qury);
  }

  static Future<Response> postData(
      {required String url,
        Map<String, dynamic>? qury,
         dynamic data,
        String? token,
        String lang = 'en'}) async {
    dio!.options.headers = {
      'Accept':'application/json',
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': "Bearer ${token}"
    };
    return await dio!.post(
      url,
      queryParameters: qury,
      data: data,
    );
  }
  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? qury,
        required dynamic data,
        String? token,
        String lang = 'en'}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': "Bearer ${token}"
    };
    return await dio!.put(
      url,
      queryParameters: qury,
      data: data,
    );
  }
  static Future<Response> deleteData(
      {required String url,
        Map<String, dynamic>? qury,
        dynamic data,
        String? token,
        String lang = 'en'}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': "Bearer ${token}"
    };
    return await dio!.delete(
      url,
      queryParameters: qury,
      data: data,
    );
  }

}
