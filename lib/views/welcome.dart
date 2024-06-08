import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/assigned_to_cubit.dart';
import 'package:valor_impact/blocs/task_cubit.dart';
import 'package:valor_impact/models/assigned_to.dart';
import 'package:valor_impact/themes/theme.dart';
import 'package:valor_impact/views/add_task.dart';
import 'package:valor_impact/views/profile.dart';
import 'package:provider/provider.dart';

import '../blocs/user_cubit.dart';
import '../enums/role_enum.dart';
import '../models/task.dart';
import '../providers/user_provider.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _Welcome();

  const Welcome({super.key});
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final selectedRole =
        Provider.of<UserProvider>(context, listen: false).selectedRole;
    final assignedToCubit = context.read<AssignedToCubit>();
    final currentUser = context.read<UserCubit>().currentUser;
    final userCubit = context.read<UserCubit>();
    final taskCubit = context.read<TaskCubit>();
    return Scaffold(
      body: Column(
        children: [
          // En-tête avec les images
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  width: 199,
                  height: 34,
                ),
                selectedRole == RoleEnum.responsable ?
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0), // Contour blanc
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: IconButton(
                    icon: Image.asset('assets/images/responsable.png', scale: 3.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profile()),
                      );
                    },
                  ),
                )
                    :
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0), // Contour blanc
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: IconButton(
                    icon: Image.asset('assets/images/employe.png', scale: 3.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profile()),
                      );
                    },
                  ),
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
                  Container(
                    width: 390,
                    height: 220,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xffA565FF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/images/taches.png'),
                            const SizedBox(height: 10),
                            Text(
                              "Nombre total de tâches : 28",
                              style: AppStyles.textStyleBase16,
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Column(
                          children: [
                            Container(
                              width: 130,
                              height: 40,
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff57A773),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nombre de tâches \n complétées: 18",
                                    style: AppStyles.textStyleBase8,
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset('assets/images/medaille.png'),
                                ],
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 40,
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff82B0C0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nombre de tâches \n en attentes: 10",
                                    style: AppStyles.textStyleBase8,
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset('assets/images/sablier.png'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 33,
                              width: 140,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AddTask()),
                                  );
                                },
                                icon: const Icon(Icons.add),
                                label: Text(
                                  "Ajouter une tâche",
                                  style: AppStyles.textStyleBaseViolet8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "TÂCHES EN COURS",
                      style: AppStyles.textStyleTitre24,
                    ),
                  ),
                  BlocBuilder<AssignedToCubit, List<AssignedTo>>(
                    builder: (context, state) {
                      final List<AssignedTo> taskList = assignedToCubit.getUnfinishedTasksByUser(currentUser!.idUser);
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: taskList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task? task = taskCubit.getTaskById(taskList[index].idTask);
                          return Container(
                              margin: const EdgeInsets.all(20.0),
                              width: 390,
                              height: 220,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(20.0),
                                color: task?.taskType.color,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: Text(task!.taskDescription, style: AppStyles.textStyleBase16,),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: task?.taskType.subColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/temps.png'),
                                            Text('Temps restant: ${task.endDate.difference(DateTime.now()).inDays} jours', style: AppStyles.textStyleBase16,),
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
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: task.taskType.subColor,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            assignedToCubit.finishAssignedTo(currentUser.idUser, task.idTask);
                                            print(currentUser.moneyCount);
                                            userCubit.addMoneyToUser(currentUser.idUser, task.moneyWorth);
                                            print(currentUser.moneyCount);
                                          },
                                          child: Row(
                                            children: [
                                              Image.asset('assets/images/monnaie.png', scale: 1.5,),
                                              Text(task.moneyWorth.toString(), style: AppStyles.textStyleBase16,),
                                            ],
                                          ),
                                        ),
                                      )
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
