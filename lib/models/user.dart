import 'package:valor_impact/enums/role_enum.dart';

class User {
  final int idUser;
  final String username;
  final String password;
  final double moneyCount;
  final RoleEnum role;
  final int idTeam;

  const User({
    required this.idUser,
    required this.username,
    required this.password,
    required this.moneyCount,
    required this.role,
    required this.idTeam,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'username': username,
      'password': password,
      'money_count': moneyCount,
      'role': role,
      'id_team': idTeam,
    };
  }
}