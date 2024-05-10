import 'package:flutter/material.dart';
import 'package:valor_impact/enums/role_enum.dart';

class RoleProvider with ChangeNotifier {
  late RoleEnum _selectedRole;

  RoleEnum get selectedRole => _selectedRole;

  void setSelectedRole(RoleEnum role) {
    _selectedRole = role;
    notifyListeners(); // Notifiez les écouteurs de changement
  }
}