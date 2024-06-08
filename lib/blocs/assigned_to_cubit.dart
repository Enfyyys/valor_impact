import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/providers/database_provider.dart';

import '../models/assigned_to.dart';
import '../models/task.dart';

class AssignedToCubit extends Cubit<List<AssignedTo>> {

  final List<Task> tasks;
  final Database _database = DatabaseProvider.getDatabase();

  AssignedToCubit({required this.tasks}) : super([]);

  Future<void> loadAssignedTo() async {
    emit([
      AssignedTo(idUser: 1, idTask: 1, assignedDate: DateTime.utc(1989, 11, 9), isFinished: true),
      AssignedTo(idUser: 1, idTask: 2, assignedDate: DateTime.utc(1989, 11, 9), isFinished: true),
      AssignedTo(idUser: 1, idTask: 3, assignedDate: DateTime.utc(1989, 11, 9), isFinished: true),
    ]);
  }

  Future<void> addAssignedTo(AssignedTo assignedTo) async {
    /*await _database.insert(
      'assigned_to',
      assignedTo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/
    emit([...state, assignedTo]);
  }

  Future<void> assignTask(int userId, int taskId) async {
    AssignedTo assignedTo = AssignedTo(
      idUser: userId,
      idTask: taskId,
      assignedDate: DateTime.now(),
      isFinished: false,
    );
    await addAssignedTo(assignedTo);
  }

  List<AssignedTo> getFinishedTasksByUser(int userId) {
    return state.where((assignedTo) => assignedTo.idUser == userId && assignedTo.isFinished).toList();
  }

  List<AssignedTo> getUnfinishedTasksByUser(int userId) {
    return state.where((assignedTo) => assignedTo.idUser == userId && !assignedTo.isFinished).toList();
  }

  double getTotalMoneyFinished(int userId) {
    List<AssignedTo> finishedTaskList = state.where((assignedTo) => assignedTo.idUser == userId && assignedTo.isFinished).toList();
    double totalMoney = 0;

    for (AssignedTo assignedTo in finishedTaskList) {
      Task task = tasks.where((task) => task.idTask == assignedTo.idTask).first;
      totalMoney += task.moneyWorth;
    }

    return totalMoney;
  }

  List<Task> getFinishedTasksByTypeAndUser(int userId, TaskTypeEnum taskTypeEnum) {
    List<AssignedTo> finishedTaskList = state.where((assignedTo) => assignedTo.idUser == userId && assignedTo.isFinished).toList();
    List<Task> listTask = [];
    for (AssignedTo assignedTo in finishedTaskList) {
      Task task = tasks.where((task) => task.idTask == assignedTo.idTask).first;
      if (task.taskType == taskTypeEnum) {
        listTask.add(task);
      }
    }
    return(listTask);
  }
}
