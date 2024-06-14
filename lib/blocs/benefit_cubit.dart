import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:valor_impact/enums/benefit_type_enum.dart';
import 'package:valor_impact/models/benefit.dart';

import '../providers/database_provider.dart';

class BenefitCubit extends Cubit<List<Benefit>> {

  BenefitCubit() : super([]);
  //final Database _database = DatabaseProvider.getDatabase();

  Future<void> loadBenefits() async {
    emit(const [
      Benefit(idBenefit: 1, benefitDescription: "1h de yoga", moneyCost: 300, imageUrl: 'assets/images/meditation.png', benefitType: BenefitTypeEnum.collective),
      Benefit(idBenefit: 2, benefitDescription: "Soirée cinéma", moneyCost: 500, imageUrl: 'assets/images/cinema.png', benefitType: BenefitTypeEnum.individuel),
      Benefit(idBenefit: 3, benefitDescription: "Massage de 30min", moneyCost: 300, imageUrl: 'assets/images/massage.png', benefitType: BenefitTypeEnum.individuel)
    ]);
  }

  Future<void> addBenefit(Benefit benefit) async {
    /*await _database.insert(
      'benefits',
      benefit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/
    emit([...state, benefit]);
  }

  removeBenefit(int idBenefit) {}

  /*Future<void> buyReward(int userId, Benefit benefit) async {
    // On récupère l'utilisateur dans la bdd
    final List<Map<String, dynamic>> user = await _database.query(
      'users',
      where: 'id_user = ?',
      whereArgs: [userId],
    );

    // Si l'utilisateur à plus d'argent que le cout de la récompense
    if (user.isNotEmpty && user.first['money_count'] >= benefit.moneyCost) {
      // Déduit le cout de la récompense à l'argent de l'utilisateur
      final double newBalance = user.first['money_count'] - benefit.moneyCost;
      await _database.update(
        'users',
        {'money_count': newBalance},
        where: 'id_user = ?',
        whereArgs: [userId],
      );

      // Insertion dans la table buyed
      await _database.insert(
        'buyed',
        {
          'id_user': userId,
          'id_benefit': benefit.idBenefit,
          'buyed_date': DateTime.now().toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      // Erreur si l'utilisateur n'a pas assez d'argent
      throw Exception('Pas assez d\'argent');
    }
  }*/
}
