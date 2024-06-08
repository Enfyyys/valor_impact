import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/enums/task_type_enum.dart';
import 'package:valor_impact/themes/theme.dart';

import '../blocs/benefit_cubit.dart';
import '../blocs/user_cubit.dart';
import '../models/benefit.dart';
import '../ui/screens/home.dart';

class BenefitList extends StatefulWidget {
  @override
  State<BenefitList> createState() => _BenefitList();

  const BenefitList({super.key});
}

class _BenefitList extends State<BenefitList> {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final benefitCubit = context.read<BenefitCubit>();
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
                  Text("Récompenses", style: AppStyles.textStyleTitre32,),
                  const SizedBox(height: 20,),
                  Column(
                    children: [
                      Image.asset('assets/images/monnaie.png', scale: 0.9,),
                      Text("Quantité de monnaie gagnée", style: AppStyles.textStyleBase12,),
                      Text(userCubit.currentUser!.moneyCount.toString(), style: AppStyles.textStyleTitre24,)
                    ],
                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Liste des Récompenses",
                      style: AppStyles.textStyleTitre24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                        child: Text("Individuel", style: AppStyles.textStyleBase12),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130.0, 36.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                        ),
                        child: Text("Collective", style: AppStyles.textStyleBaseEconomie12),
                      ),
                    ],
                  ),
                  BlocBuilder<BenefitCubit, List<Benefit>>(
                    builder: (context, state) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Benefit benefit = state[index];
                          return Container(
                              margin: const EdgeInsets.all(20.0),
                              width: 390,
                              height: 220,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(20.0),
                                color: TaskTypeEnum.economie.color,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        child: Text(benefit.benefitDescription, style: AppStyles.textStyleBase16,),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: TaskTypeEnum.economie.subColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/monnaie.png', scale: 1.5,),
                                            Text(benefit.moneyCost.toString(), style: AppStyles.textStyleBase16,),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Image.asset(benefit.imageUrl),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(TaskTypeEnum.economie.url, scale: 0.8,),
                                      Text(TaskTypeEnum.economie.type, style: AppStyles.textStyleBase8,),
                                      SizedBox(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            userCubit.addMoneyToUser(userCubit.currentUser!.idUser, -benefit.moneyCost);
                                            setState(() {});
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.add, color: TaskTypeEnum.economie.color, size: 33.0,),
                                              const SizedBox(width: 5.0,),
                                              Text(
                                                "Acheter",
                                                style: TextStyle(
                                                    fontFamily: 'Louis George Cafe',
                                                    fontSize: 12,
                                                    color: TaskTypeEnum.economie.color
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
