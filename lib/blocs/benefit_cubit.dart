import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/models/benefit.dart';

class BenefitCubit extends Cubit<List<Benefit>> {

  BenefitCubit() : super([]);

  Future<void> loadBenefits() async {
    emit(const [
      Benefit(idBenefit: 1, benefitDescription: "toto", moneyCost: 20),
      Benefit(idBenefit: 2, benefitDescription: "tata", moneyCost: 40),
      Benefit(idBenefit: 3, benefitDescription: "titi", moneyCost: 15),
    ]);
  }

  void addBenefit(Benefit benefit) {
    emit([...state, benefit]);
  }
}
