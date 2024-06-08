import 'package:flutter_test/flutter_test.dart';
import 'package:valor_impact/blocs/task_cubit.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/models/task.dart';

void main() {
  group('TaskCubit', () {
    late TaskCubit taskCubit;

    setUp(() {
      taskCubit = TaskCubit();
    });

    tearDown(() {
      taskCubit.close();
    });

    test('initial state is empty list', () {
      expect(taskCubit.state, isEmpty);
    });

    test('loadTasks emits valid tasks', () async {
      await taskCubit.loadTasks();
      final loadedTasks = taskCubit.state;

      // Vérifiez que la liste des tâches chargées n'est pas vide
      expect(loadedTasks.isNotEmpty, isTrue);

      // Vérifiez que les descriptions des tâches sont non vides
      for (final task in loadedTasks) {
        expect(task.taskDescription.isNotEmpty, isTrue);
      }

      // Vérifiez que les types de tâches sont valides
      const validTaskTypes = TaskTypeEnum.values;
      for (final task in loadedTasks) {
        expect(validTaskTypes.contains(task.taskType), isTrue);
      }
    });

    test('addTask adds a task to the list', () {
      final initialTasks = taskCubit.state;
      final newTask = Task(
        idTask: 999,
        taskDescription: 'Nouvelle tâche',
        moneyWorth: 20.0,
        taskType: TaskTypeEnum.environnement,
        startDate: DateTime.utc(2024, 6, 8),
        endDate: DateTime.utc(2024, 7, 8),
      );

      taskCubit.addTask(newTask);
      final updatedTasks = taskCubit.state;

      expect(updatedTasks.length, initialTasks.length + 1);
      expect(updatedTasks.contains(newTask), isTrue);
    });

    test('completeTask updates task status', () async {
      await taskCubit.loadTasks();
      final taskId = taskCubit.state.first.idTask;

      await taskCubit.completeTask(taskId);
      final updatedTask = taskCubit.getTaskById(taskId);

      expect(updatedTask!.endDate, isNotNull);
    });
  });
}
