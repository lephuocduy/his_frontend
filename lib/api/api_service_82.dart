import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:his_frontend/api/services/setting/models/response/user_info_response/user_info_response.dart';
import 'package:his_frontend/data/local/preferences.dart';
import 'package:his_frontend/data/repositories/setting/models/output/user_info/user_info.dart';

class ApiService82 {
  late Dio _dio;
  final String baseUrl = "http://192.168.110.16:1082";
  static const kAccessToken = 'Authorization';
  String? _accessToken;

  ApiService82() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Interceptors to handle token and errors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Get token from local storage (shared_preferences)
          var data = await Preference.getUserInfo();
          String? token = data?.token;

          if (token != null) {
            options.headers[kAccessToken] = 'Bearer $token';
          }
          return handler.next(options); // Proceed with the request
        },
        onError: (DioError e, handler) async {
          // Check if the error is related to token expiration
          if (e.response?.statusCode == 401) {
            // Attempt to refresh the token
            if (await _refreshTokenIfNeeded()) {
              // Retry the request with the new token
              final opts = e.requestOptions;
              opts.headers[kAccessToken] = 'Bearer $_accessToken';
              final cloneReq = await _dio.request(
                opts.path,
                options: Options(
                  method: opts.method,
                  headers: opts.headers,
                ),
                data: opts.data,
                queryParameters: opts.queryParameters,
              );
              return handler.resolve(cloneReq);
            }
          }
          return handler.next(e); // Forward the error if token refresh failed
        },
      ),
    );
  }

  void setToken(String? token) {
    _accessToken = token;
    _dio.options.headers[kAccessToken] = 'Bearer $token';
  }

  Future<bool> _refreshTokenIfNeeded() async {
    var data = await Preference.getUserInfo();

    try {
      final response = await _dio.get(
        'http://192.168.110.16:1081/Users/Login/lanhh?pwd=c4ca4238a0b923820dcc509a6f75849b',
      );
      final result = UserInfoResponse.fromJson(response.data);

      final token = result.token;

      data = data?.copyWith(token: token);

      if (data != null) {
        Preference.setUserInfo(data);
      }

      setToken(token);

      return true;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
      return false;
    }
  }

  // Example GET request method
  Future<Response?> get(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      print('GET error: $e');
      return null;
    }
  }

  // Example POST request method
  Future<Response?> post(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      print('POST error: $e');
      return null;
    }
  }

  // Example PUT request method
  Future<Response?> put(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      print('PUT error: $e');
      return null;
    }
  }

  // Example DELETE request method
  Future<Response?> delete(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      print('DELETE error: $e');
      return null;
    }
  }
}
