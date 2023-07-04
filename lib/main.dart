// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: const MaterialColor(0xFF7689DE, <int, Color>{
        50: const Color(0xFFE8EAF6),
        100: const Color(0xFFC5CAE9),
        200: const Color(0xFF9FA8DA),
        300: const Color(0xFF7986CB),
        400: const Color(0xFF5C6BC0),
        500: const Color(0xFF3F51B5),
        600: const Color(0xFF3949AB),
        700: const Color(0xFF303F9F),
        800: const Color(0xFF283593),
        900: const Color(0xFF1A237E),
      })),
      home: const LoginScreen(),
    );
  }
}
