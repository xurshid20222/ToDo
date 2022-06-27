import 'package:flutter/material.dart';
import 'package:todo_app/screen/detail_screen.dart';

import 'screen/home_screen.dart';
import 'screen/splash_screen.dart';
import 'screen/welcome_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: const HomeScreen(),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        DetailScreen.id: (context) => const DetailScreen(),
      },
    );
  }
}

