

import '../enums/task_type_enum.dart';

class Task {
  final int idTask;
  final String taskDescription;
  final double moneyWorth;
  final TaskTypeEnum taskType;
  final DateTime startDate;
  final DateTime endDate;
  //final User? assignedTo;

  //const Task(this.assignedTo, {required this.idTask, required this.taskDescription, required this.moneyWorth});
  const Task({required this.idTask, required this.taskDescription, required this.moneyWorth, required this.taskType, required this.startDate, required this.endDate});

  Map<String, Object?> toMap() {
    return {
      'id_task': idTask,
      'task_description': taskDescription,
      'money_worth': moneyWorth,
      'task_type': moneyWorth,
    };
  }

  @override
  String toString() {
    return 'Task{id_task: $idTask, task_description: $taskDescription, money_worth: $moneyWorth}';
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    final int idTask = json['id_task'];
    final String taskDescription = json['task_description'];
    final double moneyWorth = json['money_worth'];
    final TaskTypeEnum taskType = json['task_type'];
    final DateTime startDate = json['start_date'];
    final DateTime endDate = json['end_date'];
    return Task(
      idTask: idTask,
      taskDescription: taskDescription,
      moneyWorth: moneyWorth,
      taskType: taskType,
      startDate: startDate,
      endDate: endDate
    );
  }

  static List<Map<String, dynamic>> fromJsonList(List<dynamic> jsonList) {
    return jsonList.cast<Map<String, dynamic>>();
  }

}
