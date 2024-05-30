class Benefit {
  final int idBenefit;
  final String benefitDescription;
  final double moneyCost;
  final String imageUrl;
  //final String benefitType;

  const Benefit({
    required this.idBenefit,
    required this.benefitDescription,
    required this.moneyCost,
    required this.imageUrl,
    //required this.benefitType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_benefit': idBenefit,
      'benefit_description': benefitDescription,
      'money_cost': moneyCost,
      'image_url': imageUrl,
      //'benefit_type': benefitType,
    };
  }
}