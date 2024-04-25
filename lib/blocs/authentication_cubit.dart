import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


// États possibles de l'authentification
enum AuthenticationStatus { authenticated, unauthenticated }

// Événements possibles pour le cubit d'authentification
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {}

class UserLoggedOut extends AuthenticationEvent {}

// Cubit pour gérer l'authentification
class AuthenticationCubit extends Cubit<AuthenticationStatus> {
  AuthenticationCubit() : super(AuthenticationStatus.unauthenticated);

  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'valor_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id_user INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> appStarted() async {
    await initDatabase();
    // Logique pour vérifier si l'utilisateur est déjà connecté au démarrage de l'application
    // Si oui, émettre l'état 'authenticated', sinon émettre l'état 'unauthenticated'
    bool isLoggedIn = await isUserLoggedIn();
    if (isLoggedIn) {
      emit(AuthenticationStatus.authenticated);
    } else {
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  Future<bool> isUserLoggedIn() async {
    List<Map<String, dynamic>> users = await _database.query('users');
    return users.isNotEmpty;
  }

  Future<void> userLoggedIn(String username, String password) async {
    /*await _database.insert(
      'users',
      User(idUser: 1, username: username, password: password).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    emit(AuthenticationStatus.authenticated);*/
  }

  Future<void> userLoggedOut() async {
    await _database.delete('users');
    emit(AuthenticationStatus.unauthenticated);
  }
}
