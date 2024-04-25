import 'package:valor_impact/models/task.dart';
import 'package:valor_impact/models/team.dart';

class User {
  final int idUser;
  final String username;
  final String password;
  final double moneyCount;
  final Team partOf;
  final Task assignedTo;

  const User(this.moneyCount, this.partOf, this.assignedTo, {required this.idUser, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': idUser,
      'username': username,
      'password': password,
    };
  }

}
