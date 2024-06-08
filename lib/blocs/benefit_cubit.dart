import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:valor_impact/enums/benefit_type_enum.dart';
import 'package:valor_impact/models/benefit.dart';

import '../providers/database_provider.dart';

class BenefitCubit extends Cubit<List<Benefit>> {

  BenefitCubit() : super([]);
  final Database _database = DatabaseProvider.getDatabase();

  Future<void> loadBenefits() async {
    emit(const [
      Benefit(idBenefit: 1, benefitDescription: "1h de yoga", moneyCost: 300, imageUrl: 'assets/images/meditation.png', benefitType: BenefitTypeEnum.collective),
      Benefit(idBenefit: 2, benefitDescription: "Soirée cinéma", moneyCost: 500, imageUrl: 'assets/images/cinema.png', benefitType: BenefitTypeEnum.individuel),
      Benefit(idBenefit: 3, benefitDescription: "Massage de 30min", moneyCost: 300, imageUrl: 'assets/images/massage.png', benefitType: BenefitTypeEnum.individuel)
    ]);
  }

  Future<void> addBenefit(Benefit benefit) async {
    await _database.insert(
      'benefits',
      benefit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    emit([...state, benefit]);
  }

  Future<void> buyReward(int userId, Benefit benefit) async {
    // Fetch user money balance
    final List<Map<String, dynamic>> user = await _database.query(
      'users',
      where: 'id_user = ?',
      whereArgs: [userId],
    );

    if (user.isNotEmpty && user.first['money_count'] >= benefit.moneyCost) {
      // Deduct the cost from the user's balance
      final double newBalance = user.first['money_count'] - benefit.moneyCost;
      await _database.update(
        'users',
        {'money_count': newBalance},
        where: 'id_user = ?',
        whereArgs: [userId],
      );

      // Insert into buyed table
      await _database.insert(
        'buyed',
        {
          'id_user': userId,
          'id_benefit': benefit.idBenefit,
          'buyed_date': DateTime.now().toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // Emit updated state if necessary (e.g., to update UI)
    } else {
      // Handle insufficient funds or user not found
      throw Exception('Insufficient funds or user not found');
    }
  }
}
