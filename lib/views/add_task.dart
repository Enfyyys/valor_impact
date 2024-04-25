import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTask();

  const AddTask({super.key});

}

class _AddTask extends State<AddTask> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'une tâche"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          //key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Description",
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
                  hintText: "Valeur",
                ),
                //controller: _textFieldControllerAddress,
              ),
              ElevatedButton(onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );*/
              }, child: const Text("Ajouter")),
            ],
          ),
        ),
      ),
    );
  }
}