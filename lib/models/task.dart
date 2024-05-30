import 'package:valor_impact/enums/task_type_enum.dart';

class Task {
  final int idTask;
  final String taskDescription;
  final double moneyWorth;
  final TaskTypeEnum taskType;
  final DateTime startDate;
  final DateTime endDate;

  const Task({
    required this.idTask,
    required this.taskDescription,
    required this.moneyWorth,
    required this.taskType,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_task': idTask,
      'task_description': taskDescription,
      'money_worth': moneyWorth,
      'task_type': taskType,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}