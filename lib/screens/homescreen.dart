import 'package:flutter/material.dart';
import 'package:polyhouseie/api/userid.dart';
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
        body: StreamBuilder(
            stream: userData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.hasData) {
                // print(snapshot.data["roof-1"]);
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Dashboard(
                          waterlevel: snapshot.data["waterlevel"],
                          soilmoisture: snapshot.data["soilmoisture"],
                          roof1: snapshot.data["roof-1"],
                          roof2: snapshot.data["roof-2"]),
                      const SizedBox(
                        height: 20,
                      ),
                      const WeatherCard(),
                      const SizedBox(
                        height: 20,
                      ),
                      const ControlCard()
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
