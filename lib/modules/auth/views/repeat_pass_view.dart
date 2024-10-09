import 'package:flutter/material.dart';

import '../services/validations.dart';

class RepeatPassView extends StatefulWidget {
  const RepeatPassView({super.key});

  @override
  State<RepeatPassView> createState() => _RepeatPassViewState();
}

class _RepeatPassViewState extends State<RepeatPassView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isVisibleOne = true;
  bool _isVisibleTwo = true;

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
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isVisibleOne,
                    decoration: InputDecoration(
                      hintText: 'Nueva Contraseña',
                      label: const Text('Nueva Contraseña'),
                      hintStyle: const TextStyle(fontSize: 16, color: Colors.white38),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisibleOne = !_isVisibleOne;
                          });
                        },
                        icon: Icon(_isVisibleOne ? Icons.visibility : Icons.visibility_off)
                      )
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: Validations.validatePassword,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmPassController,
                    obscureText: _isVisibleTwo,
                    decoration: InputDecoration(
                      hintText: 'Repetir Contraseña',
                      label: const Text('Repetir Contraseña'),
                      hintStyle: const TextStyle(fontSize: 16, color: Colors.white38),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisibleTwo = !_isVisibleTwo;
                          });
                        },
                        icon: Icon(_isVisibleTwo ? Icons.visibility : Icons.visibility_off)
                      )
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) => Validations.validateConfirmPassword(_passwordController.text, value),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: const Text('Guardar',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
