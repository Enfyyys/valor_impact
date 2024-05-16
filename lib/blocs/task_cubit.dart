import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/models/task.dart';
import 'package:valor_impact/providers/database_provider.dart';


class TaskCubit extends Cubit<List<Task>> {

  TaskCubit() : super([]);

  Future<void> loadTasks() async {
    final db = DatabaseProvider.getDatabase(); // Make sure to await for database initialization

    List<Map<String, dynamic>> tasksMap = await db.query('tasks'); // Fetch tasks from the 'tasks' table

    emit(
      [
        for (final taskMap in tasksMap)
          Task(
            idTask: taskMap['id_task'],
            taskDescription: taskMap['task_description'],
            moneyWorth: taskMap['money_worth'].toDouble(),
          ),
      ],
    );
  }


  void addTask(Task task) {
    emit([...state, task]);
  }

  Future<List<Task>> getTasks() async {
    final db = DatabaseProvider.getDatabase();

    final List<Map<String, Object?>> taskMaps = await db.query('tasks');

    return [
      for (final {
      'id_task': idTask as int,
      'task_description': taskDescription as String,
      'money_worth': moneyWorth as double,
      //'assigned_to': assignedTo as User?,
      } in taskMaps)
        Task(idTask: idTask, taskDescription: taskDescription, moneyWorth: moneyWorth),
    ];
  }
}
