import 'package:flutter/material.dart';
import 'package:valor_impact/ui/screens/home.dart';
import 'package:valor_impact/views/form_login.dart';

import '../themes/theme.dart';

class SignInForm extends StatefulWidget {

  @override
  State<SignInForm> createState() => _SignInForm();

  const SignInForm({super.key});
}

class _SignInForm extends State<SignInForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned (
            left: 75,
            top: 150,
            child: Image.asset('assets/images/Logo.png'),
          ),
          Center(
            child: Form(
                //key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Code entreprise", style: AppStyles.textStyleBase16),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
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
                      width: 400,
                      child: TextFormField(
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
                      width: 400,
                      child: TextFormField(
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
                      width: 400,
                      child: TextFormField(
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
                    ElevatedButton(onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    }, child: Text("Créer un compte", style: AppStyles.textStyleBaseViolet)),
                  ],
                ),
              ),
            )
          ]
        )
      );
  }
}