
import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/views/home_screen/home_screen.dart';
import 'package:plataforma_rede_campo/views/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plataforma Rede Campo",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
