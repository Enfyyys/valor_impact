import 'package:valor_impact/models/task.dart';
import 'package:valor_impact/models/team.dart';

import '../enums/role_enum.dart';

class User {
  final int idUser;
  final String username;
  final String password;
  final double moneyCount;
  //final Team partOf;
  //final Task assignedTo;
  final RoleEnum role;

  //const User(this.partOf, this.assignedTo, {required this.idUser, required this.username, required this.password, required this.role, required this.moneyCount,});
  const User({required this.idUser, required this.username, required this.password, required this.role, required this.moneyCount,});

  Map<String, dynamic> toMap() {
    return {
      'id': idUser,
      'username': username,
      'password': password,
    };
  }

}
