import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia_mobile_dev_intern/core/constants/api_constants.dart';
import 'package:suitmedia_mobile_dev_intern/data/models/user_model.dart';

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  // Mengambil data user dari API
  Future<List<User>> fetchUsersRaw({required int page, int perPage = 6}) async {
    final url = Uri.parse(
      ('${ApiConstants.baseUrl}${ApiConstants.usersPath}?page=$page&per_page=$perPage'),
    );

    try {
      final response = await _client
          .get(url, headers: {'x-api-key': ApiConstants.apiKey})
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<dynamic> rawData = body['data'] ?? [];
        return rawData.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception('Server Error: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Exception: $e');
    }
  }
}
