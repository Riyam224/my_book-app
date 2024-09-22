// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    var response = await _dio.get('$base64Url$endPoints');

    return response.data;
  }
}
