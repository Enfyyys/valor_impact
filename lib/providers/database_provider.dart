import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static late Database _database;

  static Future<void> initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'valor_database.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE tasks('
                'id_task INTEGER PRIMARY KEY, '
                'task_description TEXT, '
                'money_worth REAL, '
                'task_type TEXT, '
                'start_date TEXT, '
                'end_date TEXT); '
            'CREATE TABLE users('
                'id_user INTEGER PRIMARY KEY, '
                'username TEXT, '
                'password TEXT, '
                'money_count REAL, '
                'role TEXT, '
                'id_team INTEGER, '
                'FOREIGN KEY(id_team) REFERENCES teams(id_team)); '
            'CREATE TABLE teams('
                'id_team INTEGER PRIMARY KEY, '
                'team_name TEXT, '
                'formula_selected TEXT); '
            'CREATE TABLE benefits('
                'id_benefit INTEGER PRIMARY KEY, '
                'benefit_description TEXT, '
                'money_cost REAL, '
                'image_url TEXT, '
                'benefit_type TEXT); '
            'CREATE TABLE assigned_to('
                'id_user INTEGER, '
                'id_task INTEGER, '
                'assignedDate TEXT, '
                'PRIMARY KEY(id_user, id_task), '
                'FOREIGN KEY(id_user) REFERENCES users(id_user), '
                'FOREIGN KEY(id_task) REFERENCES tasks(id_task)); '
            'CREATE TABLE buyed('
                'id_user INTEGER, '
                'id_benefit INTEGER, '
                'buyedDate TEXT, '
                'PRIMARY KEY(id_user, id_benefit), '
                'FOREIGN KEY(id_user) REFERENCES users(id_user), '
                'FOREIGN KEY(id_benefit) REFERENCES benefits(id_benefit));'
        );
      },
      version: 1,
    );
  }

  static Database getDatabase() {
    return _database;
  }
}
