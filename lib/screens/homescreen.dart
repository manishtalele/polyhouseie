import 'package:flutter/material.dart';
import 'package:polyhouseie/widgets/controlcard.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icon/logo.png",
                height: 60,
                width: 60,
              ),
              const Text(
                "Polyhouseie",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Icon(
            Icons.notifications_none_outlined,
            color: Color.fromRGBO(75, 160, 100, 100),
          )
        ],
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Dashboard(
                waterlevel: 0, soilmoisture: 2, roof1: true, roof2: false),
            SizedBox(
              height: 20,
            ),
            WeatherCard(),
            SizedBox(
              height: 20,
            ),
            ControlCard()
            // ShowData()
          ],
        ),
      ),
    );
  }
}
