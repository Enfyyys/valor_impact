import 'package:flutter_test/flutter_test.dart';
import 'package:valor_impact/blocs/assigned_to_cubit.dart';

void main() {
  group('AssignedToCubit', () {
    late AssignedToCubit assignedToCubit;

    setUp(() {
      assignedToCubit = AssignedToCubit(tasks: []);
    });

    tearDown(() {
      assignedToCubit.close();
    });

    test('initial state is empty list', () {
      expect(assignedToCubit.state, []);
    });

    test('loadAssignedTo emits list of assigned tasks', () async {
      await assignedToCubit.loadAssignedTo();
      expect(assignedToCubit.state.length, 3);
    });

    test('getFinishedTasksByUser returns correct tasks', () async {
      await assignedToCubit.loadAssignedTo();
      final finishedTasks = assignedToCubit.getFinishedTasksByUser(1);
      expect(finishedTasks.length, 3);
      expect(finishedTasks[0].isFinished, true);
      expect(finishedTasks[0].idUser, 1);
    });
  });
}
