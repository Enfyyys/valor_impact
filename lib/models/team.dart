import 'package:valor_impact/enums/formula_enum.dart';

class Team {
  final int idTeam;
  final String teamName;
  final FormulaEnum formulaSelected;

  const Team({
    required this.idTeam,
    required this.teamName,
    required this.formulaSelected,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_team': idTeam,
      'team_name': teamName,
      'formula_selected': formulaSelected,
    };
  }
}