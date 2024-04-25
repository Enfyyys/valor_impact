import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/theme.dart';

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
    return MaterialApp(
      theme: AppTheme.themeData,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned (
            left: 75,
            top: 150,
            child: Image.asset('assets/images/Logo.png'),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Qui êtes vous ?",
                    style: TextStyle(
                        fontFamily: 'Louis George Cafe',
                        fontSize: 24,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)
                    ),
                    child: DropdownMenu<RoleEnum>(
                      width: 400,
                      textStyle: const TextStyle(
                        fontFamily: 'Louis George Cafe',
                        fontSize: 24,
                        color: Color(0xff8E3DFF),
                      ),
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
                                  style: const TextStyle(
                                      fontFamily: 'Louis George Cafe',
                                      fontSize: 24,
                                      color: Color(0xff8E3DFF)
                                  ),
                                ),
                              );
                            }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  selectedRole == null ?
                    const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Text('BIENVENUE',
                        style: TextStyle(
                            fontFamily: 'Gobold',
                            fontSize: 80,
                            color: Colors.white
                        ),
                      )
                    )
                  :
                  Column(
                    children: [
                      const Text("Déjà un compte ?",
                        style: TextStyle(
                            fontFamily: 'Louis George Cafe',
                            fontSize: 24,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text("Créer un compte",
                              style: TextStyle(
                                  fontFamily: 'Louis George Cafe',
                                  fontSize: 20,
                                  color: Color(0xff8E3DFF)
                              ),),
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
                            onPressed: () {},
                            child: const Text("Se connecter",
                              style: TextStyle(
                                  fontFamily: 'Louis George Cafe',
                                  fontSize: 20,
                                  color: Colors.white
                              ),),
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
      ),
    );
  }
}