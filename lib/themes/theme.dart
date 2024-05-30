import 'package:flutter/material.dart';

import '../enums/task_type_enum.dart';

class AppStyles {

  static TextStyle textStyleBase = const TextStyle(
    fontFamily: 'Louis George Cafe',
    fontSize: 24,
    color: Colors.white
  );

  static TextStyle textStyleBase24 = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 24,
      color: Colors.white
  );

  static TextStyle textStyleBase16 = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 16,
      color: Colors.white
  );

  static TextStyle textStyleGris16 = TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 16,
      color: Colors.white.withOpacity(0.5)
  );

  static TextStyle textStyleBase12 = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 12,
      color: Colors.white
  );

  static TextStyle textStyleBaseEconomie12 = TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 12,
      color: TaskTypeEnum.economie.color
  );

  static TextStyle textStyleBase8 = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 8,
      color: Colors.white
  );

  static TextStyle textStyleBaseViolet = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 24,
      color: Color(0xff8E3DFF)
  );

  static TextStyle textStyleBaseViolet16 = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 16,
      color: Color(0xff8E3DFF)
  );

  static TextStyle textStyleBaseViolet8 = const TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 8,
      color: Color(0xff8E3DFF)
  );

  static TextStyle textStyleTitre = const TextStyle(
      fontFamily: 'Gobold',
      fontSize: 80,
      color: Colors.white
  );

  static TextStyle textStyleTitre32 = const TextStyle(
      fontFamily: 'Gobold',
      fontSize: 32,
      color: Colors.white
  );

  static TextStyle textStyleTitre24 = const TextStyle(
      fontFamily: 'Gobold',
      fontSize: 24,
      color: Colors.white
  );

  static TextStyle textStyleTitreViolet24 = const TextStyle(
      fontFamily: 'Gobold',
      fontSize: 24,
      color: Color(0xff8E3DFF)
  );

  static TextStyle textStyleTitreTransparentVert = TextStyle(
      fontFamily: 'Gobold',
      fontSize: 16,
      color: TaskTypeEnum.environnement.color
  );

  static TextStyle textStyleTitreTransparentBleu = TextStyle(
      fontFamily: 'Gobold',
      fontSize: 16,
      color: TaskTypeEnum.economie.color
  );

  static TextStyle textStyleTitreTransparentRouge = TextStyle(
      fontFamily: 'Gobold',
      fontSize: 16,
      color: TaskTypeEnum.societe.color
  );

  static TextStyle textStyleTransparentVert12 = TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 12,
      color: TaskTypeEnum.environnement.color
  );

  static TextStyle textStyleTransparentBleu12 = TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 12,
      color: TaskTypeEnum.economie.color
  );

  static TextStyle textStyleTransparentRouge12 = TextStyle(
      fontFamily: 'Louis George Cafe',
      fontSize: 12,
      color: TaskTypeEnum.societe.color
  );
}
