import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cargo/views/auth/loginScreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ewawe Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        splash: Image.asset('assets/images/cargologo.jpeg'),
        nextScreen: LoginScreen(),
      ),
    );
  }
}
