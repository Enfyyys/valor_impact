import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/models/task.dart';
import 'package:http/http.dart' as http;

class TaskCubit extends Cubit<List<Task>> {

  TaskCubit() : super([]);

  Future<void> loadTasks() async {
    final response = await http.get(Uri.parse('http://192.168.94.60:3000/tasks'));

    List<Map<String, dynamic>> tasksMap = Task.fromJsonList(jsonDecode(response.body));

    emit(
      [
        for (final taskMap in tasksMap)
          Task(
            taskMap['assignedTo'],
            idTask: taskMap['idTask'],
            taskDescription: taskMap['taskDescription'],
            moneyWorth: double.parse(taskMap['moneyWorth']),
          ),
      ],
    );
  }

  void addTask(Task task) {
    emit([...state, task]);
  }
}
