import 'package:suitmedia_mobile_dev_intern/data/models/user_model.dart';
import 'package:suitmedia_mobile_dev_intern/data/services/api_service.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository({ApiService? apiService})
    : _apiService = apiService ?? ApiService();

  Future<List<User>> getUserList({required int page, int perPage = 6}) async {
    try {
      return await _apiService.fetchUsersRaw(page: page, perPage: perPage);
    } catch (e) {
      rethrow;
    }
  }
}
