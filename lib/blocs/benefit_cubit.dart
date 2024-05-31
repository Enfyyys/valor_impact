import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/enums/benefit_type_enum.dart';
import 'package:valor_impact/models/benefit.dart';

class BenefitCubit extends Cubit<List<Benefit>> {

  BenefitCubit() : super([]);

  Future<void> loadBenefits() async {
    emit(const [
      Benefit(idBenefit: 1, benefitDescription: "1h de yoga", moneyCost: 300, imageUrl: 'assets/images/meditation.png', benefitType: BenefitTypeEnum.collective),
      Benefit(idBenefit: 2, benefitDescription: "Soirée cinéma", moneyCost: 500, imageUrl: 'assets/images/cinema.png', benefitType: BenefitTypeEnum.individuel),
      Benefit(idBenefit: 3, benefitDescription: "Massage de 30min", moneyCost: 300, imageUrl: 'assets/images/massage.png', benefitType: BenefitTypeEnum.individuel)
    ]);
  }

  void addBenefit(Benefit benefit) {
    emit([...state, benefit]);
  }
}
