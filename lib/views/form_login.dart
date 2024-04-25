import 'package:flutter/material.dart';
import 'package:valor_impact/views/sign_in_form.dart';

class FormLogin extends StatefulWidget {

  @override
  State<FormLogin> createState() => _FormLogin();

  const FormLogin({super.key});

}

class _FormLogin extends State<FormLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Confirmation du mot de passe",
                ),
                //controller: _textFieldControllerAddress,
              ),
              ElevatedButton(onPressed: () {

              }, child: const Text("Se connecter")),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInForm()),
                  );
                },
                child: const Text('Pas de compte ?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}