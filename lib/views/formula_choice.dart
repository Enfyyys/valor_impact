import 'package:flutter/material.dart';

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
                child: Text("bababooyyyyyy")
                ),
            ]
        )
    );
  }
}