import 'package:flutter/material.dart';
import 'screens/auth/sign_in_screen.dart';

void main() {
  runApp(const AsPayApp());
}

class AsPayApp extends StatelessWidget {
  const AsPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'as pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF7A800),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFDF6E3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFDF6E3),
          elevation: 0,
          centerTitle: true,
          foregroundColor: Color(0xFF1A1A1A),
        ),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
