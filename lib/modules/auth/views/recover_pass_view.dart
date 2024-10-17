import 'package:flutter/material.dart';

import '../services/validations.dart';
import '../widgets/custom_input.dart';

class RecoverPassView extends StatefulWidget {
  const RecoverPassView({super.key});

  @override
  State<RecoverPassView> createState() => _RecoverPassViewState();
}

class _RecoverPassViewState extends State<RecoverPassView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
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
                const SizedBox(height: 48),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Datos: ${_emailController.text}');
                        Navigator.pushNamed(context, '/verification-code');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                    ),
                    child: const Text('Enviar código', style: TextStyle(fontSize: 16)),
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
