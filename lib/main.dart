import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/assigned_to_cubit.dart';
import 'package:valor_impact/blocs/benefit_cubit.dart';
import 'package:valor_impact/blocs/user_cubit.dart';
import 'package:valor_impact/providers/database_provider.dart';
import 'package:valor_impact/providers/user_provider.dart';
import 'package:valor_impact/views/form_login_choice.dart';
import 'blocs/task_cubit.dart';
import 'package:provider/provider.dart';

import 'models/task.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseProvider.initializeDatabase();

  final TaskCubit taskCubit = TaskCubit();
  final BenefitCubit benefitCubit = BenefitCubit();
  final UserCubit userCubit = UserCubit();

  taskCubit.loadTasks();
  final List<Task> tasks = taskCubit.getTasks();
  final AssignedToCubit assignedToCubit = AssignedToCubit(tasks: tasks);

  benefitCubit.loadBenefits();
  userCubit.loadUsers();
  assignedToCubit.loadAssignedTo();

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
            BlocProvider<AssignedToCubit>(
              create: (_) => assignedToCubit,
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
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff8E3DFF),
      ),
      home: const FormLoginChoice(),
    );
  }
}
