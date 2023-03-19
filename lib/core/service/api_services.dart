import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/base_response/base_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = 'http://3.6.240.11:4000/api';
  String? accessToken = '';
  Future<Dio> launchDio() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(TokenInterceptor(dio));
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    // stop the request if no internet connection low or take too long

    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  get({required String endPoint, params}) async {
    String? errorMessage = 'Request Failed';
    try {
      Dio dio = await launchDio();
      final response =
          await dio.get('$baseUrl/$endPoint', queryParameters: params);

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data,
            success: true, error: '');
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint('_@Get Resquest Execption => $e');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  post({required String endPoint, data}) async {
    final Response response;
    String? errorMessage = 'Request Failed';
    try {
      debugPrint('post base url:$baseUrl/$endPoint');
      Dio dio = await launchDio();
      response = await dio.post('$baseUrl/$endPoint', data: data);

      // Dio full response error handling checks

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint('_@Post Resquest Execption => $e');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  put({required String endPoint, data}) async {
    String? errorMessage = 'Request Failed';
    try {
      Dio dio = await launchDio();
      final response = await dio.put('$baseUrl/$endPoint', data: data);
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data,
            success: true, error: '');
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint('_@Put Resquest Execption => $e');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  delete({required String endPoint, params}) async {
    String? errorMessage = 'Request Failed';
    try {
      Dio dio = await launchDio();
      final response =
          await dio.delete('$baseUrl/$endPoint', queryParameters: params);
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data,
            success: true, error: '');
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint('_@Delete Resquest Execption => $e');
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

////////////// http request example //////////////
  getData() async {
    try {
      final url =
          'https://api.example.com/data'; // Replace with your API endpoint
      final response = await http.get(Uri.parse(url));

      // Process the retrieved data here
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.body,
            success: true, error: '');
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      debugPrint('_@Get Resquest Execption => $e');
    }
    return RequestResponse.fromJson(
        {'success': false, 'error': 'Request Failed'});
  }
}
