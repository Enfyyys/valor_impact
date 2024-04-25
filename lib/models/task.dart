import 'package:valor_impact/models/user.dart';

class Task {
  final int idTask;
  final String taskDescription;
  final double moneyWorth;
  final User? assignedTo;

  const Task(this.assignedTo, {required this.idTask, required this.taskDescription, required this.moneyWorth});

  Map<String, Object?> toMap() {
    return {
      'id_task': idTask,
      'task_description': taskDescription,
      'money_worth': moneyWorth,
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
    return Task(
      null,
      idTask: idTask,
      taskDescription: taskDescription,
      moneyWorth: moneyWorth,
    );
  }

  static List<Map<String, dynamic>> fromJsonList(List<dynamic> jsonList) {
    return jsonList.cast<Map<String, dynamic>>();
  }


}
