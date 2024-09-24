import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/base_url.dart';

class DataProvider {
  static final String url = BaseUrl().getUrl();

  static Map<String, String> setHeaders(String? token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<http.Response> getRequest({required String endpoint}) async {
    try {
      final response = await http.get(Uri.parse("$url/$endpoint"));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> postRequest(
      {required String endpoint, required Map<String, dynamic> body}) async {
    try {
      final response =
          await http.post(Uri.parse("$url/$endpoint"), body: jsonEncode(body));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> putRequest(
      {required String endpoint, required Map<String, dynamic> body}) async {
    try {
      final response =
          await http.put(Uri.parse("$url/$endpoint"), body: jsonEncode(body));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> deleteRequest({required String endpoint}) async {
    try {
      final response = await http.delete(Uri.parse("$url/$endpoint"));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
