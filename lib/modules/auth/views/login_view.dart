import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/validations.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_input_password.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                CustomInput(
                  controller: _emailController, 
                  hintText: 'Correo Electrónico', 
                  labelText: 'Correo Electrónico',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validations.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomInputPassword(
                  controller: _passwordController, 
                  validator: Validations.validatePassword
                ),
                const SizedBox(height: 48),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print('Datos: ${_emailController.text} - ${_passwordController.text}');
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text
                          );
                          print('Credenciales: $credential');
                        } on FirebaseAuthException catch (err) {
                          if (err.code == 'user-not-found') {
                            print('Ningún usuario encontrado para ese correo electrónico.');
                          } else if (err.code == 'wrong-password') {
                            print('Contraseña incorrecta proporcionada para ese usuario.');
                          }
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                    ),
                    child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: const Text(
                    'Crear una cuenta', 
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue, 
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue
                    )
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/recover-pass'),
                  child: const Text('Recuperar Contraseña',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue
                    )
                  ),
                )
              ],
            )
          ),
        ),
      )
    );
  }
}
