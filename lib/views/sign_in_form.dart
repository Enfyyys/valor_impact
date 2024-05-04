import 'package:flutter/material.dart';
import 'package:valor_impact/ui/screens/home.dart';

import '../themes/theme.dart';

class SignInForm extends StatefulWidget {

  @override
  State<SignInForm> createState() => _SignInForm();

  const SignInForm({super.key});
}

class _SignInForm extends State<SignInForm> {
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
            child: Form(
                //key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Code entreprise", style: AppStyles.textStyleBase16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        style: AppStyles.textStyleBaseViolet16,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "1234",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("E-mail", style: AppStyles.textStyleBase16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        style: AppStyles.textStyleBaseViolet16,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "francoisgigaud@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Mot de passe", style: AppStyles.textStyleBase16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        style: AppStyles.textStyleBaseViolet16,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ".......",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Confirmation Mot de passe", style: AppStyles.textStyleBase16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        style: AppStyles.textStyleBaseViolet16,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ".......",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text('J’accepte les conditions d’utilisations', style: AppStyles.textStyleBase8,),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            left: MediaQuery.of(context).size.width * 0.5 - 115,
            child: ElevatedButton(onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            }, child: Text("Créer un compte", style: AppStyles.textStyleBaseViolet)),
          )

          ]
        )
      );
  }
}