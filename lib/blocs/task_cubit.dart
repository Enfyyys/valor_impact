
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/models/task.dart';
import 'package:valor_impact/providers/database_provider.dart';


class TaskCubit extends Cubit<List<Task>> {

  TaskCubit() : super([]);

  Future<void> loadTasks() async {
    //final db = DatabaseProvider.getDatabase();

    //List<Map<String, dynamic>> tasksMap = await db.query('tasks');

    emit(
      [
        Task(idTask: 1, taskDescription: "Organiser une journée de bénévolat pour les employés avec au moins 50 % de participation.", moneyWorth: 50.0, taskType: TaskTypeEnum.societe, startDate: DateTime.utc(1989, 11, 9), endDate:DateTime.utc(2089, 11, 9)),
        Task(idTask: 2, taskDescription: "Réaliser au moins 70 % des achats auprès de fournisseurs locaux ou certifiés équitables.", moneyWorth: 50.0, taskType: TaskTypeEnum.economie, startDate: DateTime.utc(1989, 11, 9), endDate:DateTime.utc(2089, 11, 9)),
        Task(idTask: 3, taskDescription: "Atteindre un taux de recyclage minimum de 60 % pour les déchets produits par l'entreprise.", moneyWorth: 50.0, taskType: TaskTypeEnum.environnement, startDate: DateTime.utc(1989, 11, 9), endDate:DateTime.utc(2089, 11, 9)),
        /*for (final taskMap in tasksMap)
          Task(
            idTask: taskMap['id_task'],
            taskDescription: taskMap['task_description'],
            moneyWorth: taskMap['money_worth'].toDouble(),
            taskType: taskMap['task_type'] ?? TaskTypeEnum.environnement,
          ),*/
      ],
    );
  }


  void addTask(Task task) {
    emit([...state, task]);
  }

  List<Task> getTasks() {
    return state;
  }

}
