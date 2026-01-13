// ignore_for_file: strict_top_level_inference

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_endpoints.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: AppEndpoints.baseUrl,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({required String endPoint}) async {
    try {
      Response response = await dio!.get(endPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}