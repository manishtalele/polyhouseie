import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/firebase_options.dart';
import 'package:polyhouseie/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primary2Color,
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )),
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
