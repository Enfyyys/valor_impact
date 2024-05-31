import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/enums/formula_enum.dart';

import '../models/team.dart';


class TeamCubit extends Cubit<List<Team>> {

  TeamCubit() : super([]);

  Future<void> loadTeams() async {
    /*final db = DatabaseProvider.getDatabase();

    List<Map<String, dynamic>> teamsMap = await db.query('teams');

    emit(
      [
        for (final teamMap in teamsMap)
          Team(
            idTeam: teamMap['id_team'],
            teamName: teamMap['team_name'],
            formulaSelected: teamMap['formula_selected'],
          ),
      ],
    );*/
    emit(
      [
        const Team(idTeam: 1, teamName: "Groupe hehehehaaa", formulaSelected: FormulaEnum.ultraPremium)
      ],
    );
  }
}
