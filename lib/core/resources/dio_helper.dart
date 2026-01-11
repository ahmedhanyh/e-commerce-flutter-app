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

  static putRequest({required String endPoint}) async {
    try {
      Response response = await dio!.put(endPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}