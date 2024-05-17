import 'dart:ui';

enum TaskTypeEnum {
  environnement('Environnement', 'assets/images/environnement.png',Color(0xff3FCF00), Color(0xff3CA50D)),
  societe('Société', 'assets/images/societe.png', Color(0xffFF6868), Color(0xffF04C4C)),
  economie('Économie', 'assets/images/economie.png',Color(0xff13A8FF), Color(0xff118CD4));

  const TaskTypeEnum(this.type, this.url, this.color, this.subColor);
  final String type;
  final String url;
  final Color color;
  final Color subColor;
}