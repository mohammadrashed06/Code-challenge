import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constant.dart';

class ApiService {
  Future<Map<String, dynamic>> getResponse({
    required String endPoint,
    required String queryParameter,
  }) async {
    http.Response response =
        await http.get(Uri.parse("$baseUrl$endPoint$apiKey$queryParameter"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data['data'];
    } else {
      throw Exception("Error When Get All Response");
    }
  }
}
