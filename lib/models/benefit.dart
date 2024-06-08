import 'package:valor_impact/enums/benefit_type_enum.dart';

class Benefit {
  final int idBenefit;
  final String benefitDescription;
  final double moneyCost;
  final String imageUrl;
  final BenefitTypeEnum benefitType;

  const Benefit({
    required this.idBenefit,
    required this.benefitDescription,
    required this.moneyCost,
    required this.imageUrl,
    required this.benefitType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_benefit': idBenefit,
      'benefit_description': benefitDescription,
      'money_cost': moneyCost,
      'image_url': imageUrl,
      'benefit_type': benefitType,
    };
  }

  Benefit copyWith({
    int? idBenefit,
    String? benefitDescription,
    double? moneyCost,
    String? imageUrl,
    BenefitTypeEnum? benefitType,
  }) {
    return Benefit(
      idBenefit: idBenefit ?? this.idBenefit,
      benefitDescription: benefitDescription ?? this.benefitDescription,
      moneyCost: moneyCost ?? this.moneyCost,
      imageUrl: imageUrl ?? this.imageUrl,
      benefitType: benefitType ?? this.benefitType,
    );
  }
}