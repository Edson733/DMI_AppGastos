import 'package:flutter/material.dart';

import '../services/validations.dart';
import '../widgets/custom_input_password.dart';

class RepeatPassView extends StatefulWidget {
  const RepeatPassView({super.key});

  @override
  State<RepeatPassView> createState() => _RepeatPassViewState();
}

class _RepeatPassViewState extends State<RepeatPassView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Nueva contraseña'),
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
                CustomInputPassword(
                  controller: _passwordController, 
                  validator: Validations.validatePassword
                ),
                const SizedBox(height: 16),
                CustomInputPassword(
                  controller: _confirmPassController, 
                  hintText: 'Repetir Contraseña',
                  labelText: 'Repetir Contraseña',
                  validator: (value) => Validations.validateConfirmPassword(_passwordController.text, value)
                ),
                const SizedBox(height: 48),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Datos: ${_passwordController.text} - ${_confirmPassController.text}');
                        Navigator.pushNamed(context, '/');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    child: const Text('Guardar', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
