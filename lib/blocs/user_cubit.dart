import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:valor_impact/enums/role_enum.dart';
import '../models/user.dart';
import '../providers/database_provider.dart';

class UserCubit extends Cubit<List<User>> {
  User? _currentUser;

  UserCubit() : super([]);

  Future<void> loadUsers() async {
    emit(
        [
          const User(idUser: 1, username: 'Éric', password: 'password', role: RoleEnum.employe, moneyCount: 1500.0, idTeam: 1),
          const User(idUser: 2, username: 'Jean', password: 'password', role: RoleEnum.responsable, moneyCount: 30.0, idTeam: 1)
        ]
    );
  }

  User? get currentUser => _currentUser;

  void login(String username, String password) {
    final user = state.firstWhere(
          (user) => user.username == username && user.password == password,
      orElse: () => throw Exception('User not found'),
    );
    _currentUser = user;
    emit([...state]);
  }

  void logout() {
    _currentUser = null;
    emit([...state]);
  }

  void createUser(String username, String password, RoleEnum role/*, double moneyCount, int idTeam*/) {
    final newUser = User(
      idUser: state.length + 1,
      username: username,
      password: password,
      role: role,
      moneyCount: 0,
      idTeam: 1,
    );
    _currentUser = newUser;
    state.add(newUser);
    emit([...state]);
  }

  void addMoneyToUser(int userId, double money) {
    final updatedUsers = state.map((user) {
      if (user.idUser == userId) {
        return user.copyWith(moneyCount: user.moneyCount + money);
      }
      return user;
    }).toList();
    emit(updatedUsers);

    _currentUser = updatedUsers.firstWhere((user) => user.idUser == userId);
  }

  /*Future<void> addMoneyToUserDatabase(int userId, double money) async {
    final Database db = DatabaseProvider.getDatabase();

    // On récupère l'utilisateur
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id_user = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      // On met à jour l'argent de l'utilisateur
      final user = User.fromMap(maps.first);
      final newMoneyCount = user.moneyCount + money;

      await db.update(
        'users',
        {'money_count': newMoneyCount},
        where: 'id_user = ?',
        whereArgs: [userId],
      );
    } else {
      // Erreur si l'utilisateur n'est pas trouvé
      throw Exception('User not found');
    }
  }*/
}
