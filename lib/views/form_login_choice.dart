import 'package:flutter/material.dart';
import 'package:valor_impact/views/sign_in_form.dart';

import '../themes/theme.dart';
import 'form_login.dart';
import 'formula_choice.dart';

enum RoleEnum {
  responsable('Responsable'),
  employe('Employé');

  const RoleEnum(this.role);
  final String role;
}

class FormLoginChoice extends StatefulWidget {
  const FormLoginChoice({ super.key });

  @override
  State<FormLoginChoice> createState() => _FormLoginChoiceState();
}

class _FormLoginChoiceState extends State<FormLoginChoice> {

  RoleEnum? selectedRole;

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
                Text("Qui êtes vous ?",
                  style: AppStyles.textStyleBase,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropdownMenu<RoleEnum>(
                    width: 400,
                    textStyle: AppStyles.textStyleBaseViolet,
                    //initialSelection: RoleEnum.employe,
                      onSelected: (RoleEnum? role) {
                        setState(() {
                          selectedRole = role;
                        });
                      },
                      dropdownMenuEntries: RoleEnum.values
                          .map<DropdownMenuEntry<RoleEnum>>(
                              (RoleEnum role) {
                            return DropdownMenuEntry<RoleEnum>(
                              value: role,
                              label: role.role,
                              labelWidget: Text(
                                role.role,
                                style: AppStyles.textStyleBaseViolet,
                              ),
                            );
                          }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                selectedRole == null ?
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text('BIENVENUE',
                      style: AppStyles.textStyleTitre,
                    )
                  )
                :
                Column(
                  children: [
                    Text("Déjà un compte ?",
                      style: AppStyles.textStyleBase,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            selectedRole == RoleEnum.employe ?
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignInForm()),
                            )
                            :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FormulaChoice()),
                            );

                          },
                          child: Text("Créer un compte",
                            style: AppStyles.textStyleBaseViolet,
                          ),
                        ),
                        const SizedBox(width: 20),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff8E3DFF),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FormLogin()),
                            );
                          },
                          child: Text("Se connecter",
                            style: AppStyles.textStyleBase,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned (
            left: 0,
            top: 650,
            child: Image.asset('assets/images/poigne.png', scale: 0.87,),
          ),
        ],
      ),
    );
  }
}
