import 'package:flutter/material.dart';
import 'package:valor_impact/views/sign_in_form.dart';

import '../enums/role_enum.dart';
import '../themes/theme.dart';

class FormulaChoice extends StatefulWidget {

  @override
  State<FormulaChoice> createState() => _FormulaChoice();

  const FormulaChoice({super.key});
}

class _FormulaChoice extends State<FormulaChoice> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.5 - 165.5,
                child: Image.asset(
                  'assets/images/Logo.png',
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Quelle formule préférez-vous ?",
                      style: AppStyles.textStyleBase,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInForm(role: RoleEnum.responsable)),
                        );
                      }, child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text("Formule gratuite", style: AppStyles.textStyleBaseViolet)),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInForm(role: RoleEnum.responsable)),
                      );
                    }, child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.65,
                      child: Text("Formule freemium : 24.99€ ✓ Possibilité de pouvoir ajouter ses propres tâches", style: AppStyles.textStyleBaseViolet)),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInForm(role: RoleEnum.responsable)),
                        );
                      }, child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text("Formule premium : 84.99€ ✓ Possibilité de pouvoir ajouter ses propres tâches  ✓ Accompagnement personnalisé avec un expert en développement RSE", style: AppStyles.textStyleBaseViolet)),
                    ),
                  ],
                ),
              )

            ]
        )
    );
  }
}