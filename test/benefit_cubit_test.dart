import 'package:flutter_test/flutter_test.dart';
import 'package:valor_impact/blocs/benefit_cubit.dart';
import 'package:valor_impact/enums/benefit_type_enum.dart';
import 'package:valor_impact/models/benefit.dart';

void main() {
  group('BenefitCubit', () {
    late BenefitCubit benefitCubit;

    setUp(() {
      benefitCubit = BenefitCubit();
    });

    tearDown(() {
      benefitCubit.close();
    });

    test('Initial state is empty list', () {
      expect(benefitCubit.state, []);
    });

    test('Adding a benefit emits updated list', () {
      final initialBenefits = benefitCubit.state;
      const benefit = Benefit(idBenefit: 999, benefitDescription: "Test Benefit", moneyCost: 100, imageUrl: 'assets/images/test.png', benefitType: BenefitTypeEnum.collective);
      benefitCubit.addBenefit(benefit);
      expect(benefitCubit.state.length, initialBenefits.length + 1);
    });

    // Add more tests as needed for other methods like buyReward, etc.
  });
}
