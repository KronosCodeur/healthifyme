import 'package:flutter/material.dart';
import 'package:healthifyme/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(taille: 0.0, poids: 0.0, imc: 0.0),
    );
  }
}
