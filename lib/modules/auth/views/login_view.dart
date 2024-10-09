import 'package:flutter/material.dart';

import '../services/validations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(fontSize: 32, color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('hucha_blanca.png', width: 200, height: 200),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Correo Electrónico',
                        label: Text('Correo Electrónico'),
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white38)),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validations.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        label: const Text('Contraseña'),
                        hintStyle: const TextStyle(
                            fontSize: 16, color: Colors.white38),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: Icon(_isVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    style: const TextStyle(color: Colors.white),
                    validator: Validations.validatePassword,
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(
                              'Datos: ${_emailController.text} - ${_passwordController.text}');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: const Text('Iniciar Sesión',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/recover-pass'),
                    child: const Text('Recuperar Contraseña',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline
                      )
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
