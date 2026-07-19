import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class AppProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  String _inputName = '';
  String _selectedUserName = 'Selected User Name'; // Default value

  List<User> _users = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  // Getter
  String get inputName => _inputName;
  String get selectedUserName => _selectedUserName;
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  void setInputName(String name) {
    _inputName = name;
    notifyListeners();
  }

  void setSelectedUserName(String name) {
    _selectedUserName = name;
    notifyListeners();
  }

  // Memanggil data dari repository dengan pagination
  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _users = [];
      _hasMore = true;
    }

    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final fetchedList = await _userRepository.getUserList(page: _currentPage);

      if (fetchedList.isEmpty) {
        _hasMore = false;
      } else {
        _users.addAll(fetchedList);
        _currentPage++;
      }
    } catch (e) {
      debugPrint('Error fetching users: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
