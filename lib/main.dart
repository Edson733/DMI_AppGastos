import 'package:flutter/material.dart';

import 'modules/auth/views/login_view.dart';
import 'modules/auth/views/recover_pass_view.dart';
import 'modules/auth/views/repeat_pass_view.dart';
import 'modules/auth/views/verification_code_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/login': (context) => const LoginView(),
        '/recover-pass': (context) => const RecoverPassView(),
        '/verification-code': (context) => const VerificationCodeView(),
        '/confirm-pass': (context) => const RepeatPassView(),
      },
    );
  }
}
