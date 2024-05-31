import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/ui/screens/home.dart';
import '../blocs/user_cubit.dart';
import '../themes/theme.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLogin();
}

class _FormLogin extends State<FormLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                      controller: _emailController,
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
                      controller: _passwordController,
                      obscureText: true,
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
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
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
                _login(context);
              },
              child: Text("Se connecter", style: AppStyles.textStyleBase),
            ),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      context.read<UserCubit>().login(email, password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
            (route) => false,
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Invalid email or password';
      });
    }
  }
}
