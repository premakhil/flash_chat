import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        // primaryColorLight: Color(0xFFE8DEF8),
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: Color(0xFF6750A4),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => loginScreen(),
        '/register': (context) => registerScreen(),
        '/chat': (context) => chatScreen(),
      },
    );
  }
}
