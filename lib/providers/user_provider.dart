import 'package:flutter/material.dart';
import 'package:valor_impact/enums/role_enum.dart';

class UserProvider with ChangeNotifier {
  late RoleEnum _selectedRole;
  late String _username;

  RoleEnum get selectedRole => _selectedRole;
  String get username => _username;

  void setSelectedRole(RoleEnum role) {
    _selectedRole = role;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }
}