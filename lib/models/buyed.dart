class Buyed {
  final int idUser;
  final int idBenefit;
  final String buyedDate;

  Buyed({
    required this.idUser,
    required this.idBenefit,
    required this.buyedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'id_benefit': idBenefit,
      'buyed_date': buyedDate,
    };
  }
}