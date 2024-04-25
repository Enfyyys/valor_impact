import 'package:flutter/material.dart';
import 'package:valor_impact/ui/screens/home.dart';
import 'package:valor_impact/views/form_login.dart';

class SignInForm extends StatefulWidget {

  @override
  State<SignInForm> createState() => _SignInForm();

  const SignInForm({super.key});

}

class _SignInForm extends State<SignInForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          //key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Pseudo",
                ),
                //controller: _textFieldController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Rien n'est écrit";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Mot de passe",
                ),
                //controller: _textFieldControllerAddress,
              ),
              ElevatedButton(onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }, child: const Text("S'inscrire")),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormLogin()),
                  );
                },
                child: const Text('Déjà un compte ?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}