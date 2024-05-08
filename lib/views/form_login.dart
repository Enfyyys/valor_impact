import 'package:flutter/material.dart';
import 'package:valor_impact/ui/screens/home.dart';

import '../themes/theme.dart';

class FormLogin extends StatefulWidget {

  @override
  State<FormLogin> createState() => _FormLogin();

  const FormLogin({super.key});
}

class _FormLogin extends State<FormLogin> {
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
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 40),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("E-mail", style: AppStyles.textStyleBase16),
                          ),
                        ],
                      ),
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
                      Row(
                        children: [
                          const SizedBox(width: 40),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Mot de passe", style: AppStyles.textStyleBase16),
                          ),
                        ],
                      ),
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
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.8,
                left: MediaQuery.of(context).size.width * 0.5 - 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8E3DFF),
                      side: const BorderSide(color: Colors.white, width: 2),
                    ),
                  onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                }, child: Text("Se connecter", style: AppStyles.textStyleBase)),
              )

            ]
        )
    );
  }
}