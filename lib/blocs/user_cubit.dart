import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/enums/role_enum.dart';
import 'package:valor_impact/providers/database_provider.dart';

import '../models/user.dart';


class UserCubit extends Cubit<List<User>> {

  UserCubit() : super([]);

  Future<void> loadUsers() async {
    final db = DatabaseProvider.getDatabase();

    /*List<Map<String, dynamic>> usersMap = await db.query('users');

    emit(
      [
        for (final userMap in usersMap)
          User(
            idUser: userMap['id_team'],
            password: userMap['team_name'],
            username: userMap['formula_selected'],
            moneyCount: userMap['money_count'],
            role: userMap['role']
          ),
      ],
    );*/
    emit(
      [
        const User(idUser: 1, username: 'Éric', password: 'password', role: RoleEnum.employe, moneyCount: 15.0),
        const User(idUser: 2, username: 'Jean', password: 'password', role: RoleEnum.responsable, moneyCount: 30.0)
      ]
    );
  }
}
