import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static late Database _database;

  static Future<void> initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'valor_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id_task INTEGER PRIMARY KEY, task_description TEXT, money_worth REAL, task_type TEXT),'
          'USER users(id_user INTEGER PRIMARY KEY, username TEXT, password TEXT, money_count REAL),'
          'TEAM teams(id_team INTEGER PRIMARY KEY, team_name TEXT, formula_selected TEXT),'
          'BENEFIT benefits(id_benefit INTEGER PRIMARY KEY, benefit_description TEXT, money_cost REAL);'
        );
      },
      version: 1,
    );
  }


  static Database getDatabase() {
      return _database;
  }
}
