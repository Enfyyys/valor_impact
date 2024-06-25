import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/task_cubit.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/themes/theme.dart';
import 'package:valor_impact/views/add_task.dart';

import '../models/task.dart';
import '../ui/screens/home.dart';

class CreateTask extends StatefulWidget {
  @override
  State<CreateTask> createState() => _CreateTask();

  const CreateTask({super.key});
}

class _CreateTask extends State<CreateTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _rewardController = TextEditingController();
  TaskTypeEnum? _selectedTaskType;

  @override
  void dispose() {
    _titleController.dispose();
    _rewardController.dispose();
    super.dispose();
  }

  void _createTask() {
    final String title = _titleController.text;
    final double reward = double.tryParse(_rewardController.text) ?? 0.0;
    final TaskTypeEnum? taskType = _selectedTaskType;

    if (title.isEmpty || taskType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    final task = Task(
      idTask: DateTime.now().millisecondsSinceEpoch,
      taskDescription: title,
      moneyWorth: reward,
      taskType: taskType,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 30)),
    );

    context.read<TaskCubit>().addTask(task);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 33.0,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const AddTask()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Image.asset("assets/images/create.png"),
            const SizedBox(height: 20),
            Text("Créer une tâche", style: AppStyles.textStyleTitre32),
            const SizedBox(height: 20),
            Text('Titre de la tâche', style: AppStyles.textStyleBase24),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Ex : S'engager dans un programme de mentorat",
                  hintStyle: AppStyles.textStyleGris16,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: AppStyles.textStyleGris16,
              ),
            ),
            const SizedBox(height: 20),
            Text('Catégories', style: AppStyles.textStyleBase24),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTaskType = TaskTypeEnum.environnement;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130.0, 36.0),
                    backgroundColor: TaskTypeEnum.environnement.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                  ),
                  child: Text(
                    TaskTypeEnum.environnement.type,
                    style: AppStyles.textStyleBase12,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTaskType = TaskTypeEnum.societe;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130.0, 36.0),
                    backgroundColor: TaskTypeEnum.societe.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                  ),
                  child: Text(
                    TaskTypeEnum.societe.type,
                    style: AppStyles.textStyleBase12,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTaskType = TaskTypeEnum.economie;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130.0, 36.0),
                    backgroundColor: TaskTypeEnum.economie.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                  ),
                  child: Text(
                    TaskTypeEnum.economie.type,
                    style: AppStyles.textStyleBase12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Montant de la récompense', style: AppStyles.textStyleBase24),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _rewardController,
                decoration: InputDecoration(
                  hintText: "Ex : 30",
                  hintStyle: AppStyles.textStyleGris16,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: AppStyles.textStyleGris16,
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: _createTask,
              child: Text("Créer la tâche", style: AppStyles.textStyleBaseViolet),
            ),
          ],
        ),
      ),
    );
  }
}
