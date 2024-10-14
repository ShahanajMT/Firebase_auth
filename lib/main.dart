import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:userauth_firebase/application/features/auth/pages/login_page.dart';
import 'package:userauth_firebase/application/features/auth/pages/register_page.dart';
import 'package:userauth_firebase/application/features/home/home_page.dart';
import 'package:userauth_firebase/application/features/splash/splash_page.dart';
import 'package:userauth_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPageWrapper(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
