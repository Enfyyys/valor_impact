import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/enums/role_enum.dart';
import '../models/user.dart';

class UserCubit extends Cubit<List<User>> {
  User? _currentUser;

  UserCubit() : super([]);

  Future<void> loadUsers() async {
    emit(
        [
          const User(idUser: 1, username: 'Éric', password: 'password', role: RoleEnum.employe, moneyCount: 15.0, idTeam: 1),
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
}
