import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/task_cubit.dart';
import 'package:valor_impact/themes/theme.dart';
import 'package:valor_impact/views/profile.dart';
import 'package:provider/provider.dart';

import '../enums/role_enum.dart';
import '../models/task.dart';
import '../providers/user_provider.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskList();

  const TaskList({super.key});
}

class _TaskList extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final selectedRole =
        Provider.of<UserProvider>(context, listen: false).selectedRole;
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
                                onPressed: () {},
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
                  BlocBuilder<TaskCubit, List<Task>>(
                    builder: (context, state) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task task = state[index];
                          return ListTile(
                            title: Text(task.taskDescription),
                            subtitle: Text(task.moneyWorth.toString()),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(height: 0);
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
