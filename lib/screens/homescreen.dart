import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: const [
          // Image.asset("assets/icon/logo.png"),
          SizedBox(
            width: 20,
          ),
          Text(
            "Polyhouseie",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      )),
      body: Column(
        children: const [],
      ),
    );
  }
}
