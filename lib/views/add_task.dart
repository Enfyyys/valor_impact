import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/task_cubit.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/themes/theme.dart';
import 'package:valor_impact/views/add_task.dart';
import 'package:valor_impact/views/create_task.dart';
import 'package:valor_impact/views/profile.dart';
import 'package:provider/provider.dart';

import '../enums/role_enum.dart';
import '../models/task.dart';
import '../providers/user_provider.dart';
import '../ui/screens/home.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTask();

  const AddTask({super.key});
}

class _AddTask extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    final selectedRole =
        Provider.of<UserProvider>(context, listen: false).selectedRole;
    return Scaffold(
      body: Column(
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
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 33.0,),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white, size: 33.0,),
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );*/
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("AJOUTER UNE TÂCHE", style: AppStyles.textStyleTitre32,),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateTask()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA565FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 35,),
                        const SizedBox(width: 8.0),
                        Text(
                          'Créer une tâche',
                          style: AppStyles.textStyleBase24
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text('OU', style: AppStyles.textStyleBase24,),
                  const SizedBox(height: 20,),
                  Text('Choisissez une tâche à modifier !', style: AppStyles.textStyleBase24,),
                  const SizedBox(height: 20,),
                  Container(
                    height: 5,
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130.0, 36.0),
                          backgroundColor: TaskTypeEnum.environnement.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                        ),
                        child: Text(TaskTypeEnum.environnement.type, style: AppStyles.textStyleBase12),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130.0, 36.0),
                          backgroundColor: TaskTypeEnum.societe.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                        ),
                        child: Text(TaskTypeEnum.societe.type, style: AppStyles.textStyleBase12),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130.0, 36.0),
                          backgroundColor: TaskTypeEnum.economie.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                        ),
                        child: Text(TaskTypeEnum.economie.type, style: AppStyles.textStyleBase12),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "LISTE DES TÂCHES",
                      style: AppStyles.textStyleTitre24,
                    ),
                  ),
                  BlocBuilder<TaskCubit, List<Task>>(
                    builder: (context, state) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task task = state[index];
                          return Container(
                              margin: const EdgeInsets.all(20.0),
                              width: 390,
                              height: 220,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(20.0),
                                color: task.taskType.color,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: Text(task.taskDescription, style: AppStyles.textStyleBase16,),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: task.taskType.subColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/monnaie.png', scale: 1.5,),
                                            Text(task.moneyWorth.toString(), style: AppStyles.textStyleBase16,),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(task.taskType.url, scale: 0.5,),
                                      Text(task.taskType.type, style: AppStyles.textStyleBase8,),
                                      SizedBox(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Image.asset("assets/images/edit.png", color: task.taskType.color,),
                                              const SizedBox(width: 5.0,),
                                              Text(
                                                "Modifier",
                                                style: TextStyle(
                                                    fontFamily: 'Louis George Cafe',
                                                    fontSize: 12,
                                                    color: task.taskType.color
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
