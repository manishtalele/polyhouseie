import 'package:flutter/material.dart';
import 'package:polyhouseie/widgets/dashboard.dart';
import 'package:polyhouseie/widgets/weathercard.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Dashboard(
                waterlevel: 1, soilmoisture: 2, roof1: true, roof2: false),
            SizedBox(
              height: 20,
            ),
            WeatherCard(),
          ],
        ),
      ),
    );
  }
}
