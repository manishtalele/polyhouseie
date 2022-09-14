import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/screens/splash.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primary2Color,
      primarySwatch: Colors.green,


      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white, 
        foregroundColor:  Colors.black,
      )
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
