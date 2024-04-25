import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/task_cubit.dart';
import 'package:valor_impact/views/add_task.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {

  @override
  State<TaskList> createState() => _TaskList();

  const TaskList({super.key});

}

class _TaskList extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des tâches'),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              final Task task = state[index];
              return ListTile(
                title: Text(task.taskDescription),
                subtitle:
                Text(task.moneyWorth.toString()),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTask()),
          );
          /*var fido = const Task(
            null,
            idTask: 5,
            taskDescription: 'bliblibli',
            moneyWorth: 60,
          );

          await insertTask(fido);*/
          //print(DatabaseProvider.getDatabase().query("tasks"));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}