import 'package:flutter/material.dart';
import 'package:valor_impact/enums/role_enum.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/themes/theme.dart';
import 'package:provider/provider.dart';

import '../blocs/assigned_to_cubit.dart';
import '../blocs/user_cubit.dart';
import '../ui/screens/home.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _Profile();

  const Profile({super.key});
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<UserCubit>().currentUser;
    final assignedToCubit = context.read<AssignedToCubit>();
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
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 33.0,),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
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
                  currentUser?.role == RoleEnum.responsable ?
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.0), // Contour blanc
                    ),
                    width: 180.0,
                    height: 180.0,
                    child: Image.asset('assets/images/responsable.png'),
                  )
                  :
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.0), // Contour blanc
                    ),
                    width: 180.0,
                    height: 180.0,
                    child: Image.asset('assets/images/employe.png'),
                  ),
                  Text(currentUser!.role.role, style: AppStyles.textStyleBase16,),
                  Text(currentUser.username, style: AppStyles.textStyleBase,),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 179,
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/medaille.png', scale: 0.5,),
                            const SizedBox(height: 30),
                            Text("Nombre de tâches complétés", style: AppStyles.textStyleBaseViolet8,),
                            const SizedBox(height: 30),
                            Text(assignedToCubit.getFinishedTasksByUser(currentUser.idUser).length.toString(), style: AppStyles.textStyleTitreViolet24,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/sablier.png', scale: 0.5,),
                            const SizedBox(height: 30),
                            Text("Nombre de tâches en cours", style: AppStyles.textStyleBaseViolet8,),
                            const SizedBox(height: 30),
                            Text(assignedToCubit.getUnfinishedTasksByUser(currentUser.idUser).length.toString(), style: AppStyles.textStyleTitreViolet24,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/monnaie.png', scale: 0.9,),
                            const SizedBox(height: 30),
                            Text("Quantité de monnaie gagnée", style: AppStyles.textStyleBaseViolet8,),
                            const SizedBox(height: 30),
                            Text(assignedToCubit.getTotalMoneyFinished(currentUser.idUser).toString(), style: AppStyles.textStyleTitreViolet24,)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(20.0),
                      color: TaskTypeEnum.environnement.color,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(TaskTypeEnum.environnement.url),
                        Text("Total des tâches accomplis \n(Environnement)", style: AppStyles.textStyleBase16,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF).withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          child: Text(assignedToCubit.getFinishedTasksByTypeAndUser(currentUser.idUser, TaskTypeEnum.environnement).length.toString(), style: AppStyles.textStyleTitreTransparentVert,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(20.0),
                      color: TaskTypeEnum.economie.color,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(TaskTypeEnum.economie.url),
                        Text("Total des tâches accomplis \n(Économie)", style: AppStyles.textStyleBase16,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF).withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          child: Text(assignedToCubit.getFinishedTasksByTypeAndUser(currentUser.idUser, TaskTypeEnum.economie).length.toString(), style: AppStyles.textStyleTitreTransparentBleu,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(20.0),
                      color: TaskTypeEnum.societe.color,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(TaskTypeEnum.societe.url),
                        Text("Total des tâches accomplis \n(Société)", style: AppStyles.textStyleBase16,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF).withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          child: Text(assignedToCubit.getFinishedTasksByTypeAndUser(currentUser.idUser, TaskTypeEnum.societe).length.toString(), style: AppStyles.textStyleTitreTransparentRouge,),
                        )
                      ],
                    ),
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
