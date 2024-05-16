import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/benefit_cubit.dart';
import 'package:valor_impact/blocs/user_cubit.dart';
import 'package:valor_impact/providers/database_provider.dart';
import 'package:valor_impact/providers/user_provider.dart';
import 'package:valor_impact/views/form_login_choice.dart';
import 'blocs/task_cubit.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';



void main() async {

  Future fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.94.60:3000/tasks'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
    } else {
      print('Erreur lors de la récupération des données.');
    }
  }

  //fetchData();

  WidgetsFlutterBinding.ensureInitialized();

  final TaskCubit taskCubit = TaskCubit();
  final BenefitCubit benefitCubit = BenefitCubit();
  final UserCubit userCubit = UserCubit();

  await DatabaseProvider.initializeDatabase();

  taskCubit.loadTasks();
  benefitCubit.loadBenefits();
  userCubit.loadUsers();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<TaskCubit>(
              create: (_) => taskCubit,
              child: const MyApp(),
            ),
            BlocProvider<BenefitCubit>(
              create: (_) => benefitCubit,
              child: const MyApp(),
            ),
            BlocProvider<UserCubit>(
              create: (_) => userCubit,
              child: const MyApp(),
            ),
            ChangeNotifierProvider(create: (_) => UserProvider()),
          ],
          child: const MyApp())

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valor Impact',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff8E3DFF),
      ),
      home: const FormLoginChoice(),
    );
  }
}
