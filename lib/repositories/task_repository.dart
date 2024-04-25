import 'package:sqflite/sqflite.dart';

import '../models/task.dart';
import '../providers/database_provider.dart';

Future<void> insertTask(Task task) async {

  Database db = DatabaseProvider.getDatabase();

  await db.insert(
    'tasks',
    task.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}