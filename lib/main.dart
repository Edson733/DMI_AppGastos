import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'modules/auth/views/login_view.dart';
import 'modules/auth/views/recover_pass_view.dart';
import 'modules/auth/views/register_view.dart';
import 'modules/auth/views/repeat_pass_view.dart';
import 'modules/auth/views/verification_code_view.dart';
import 'modules/user/views/profile_view.dart';
import 'modules/user/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/recover-pass': (context) => const RecoverPassView(),
        '/verification-code': (context) => const VerificationCodeView(),
        '/confirm-pass': (context) => const RepeatPassView(),
        '/profile': (context) => const ProfileView(),
      },
    );
  }
}
