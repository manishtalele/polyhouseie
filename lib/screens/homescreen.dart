import 'package:flutter/material.dart';
import 'package:polyhouseie/api/getdata.dart';
import 'package:polyhouseie/widgets/controlcard.dart';
import 'package:polyhouseie/widgets/dashboard.dart';
import 'package:polyhouseie/widgets/weathercard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  callApi() async {
    await getData(
        loader: () => setState(() {
              loader = false;
            }));
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 1,
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            )),
        body: loader
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Dashboard(
                        soilmoisture: controlData["SoilMoisture"],
                        roof1: controlData["Roof1"],
                        roof2: controlData["Roof2"], pump1:  controlData["Waterpump1"], pump2:  controlData["Waterpump2"],),
                    const SizedBox(
                      height: 20,
                    ),
                    const WeatherCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    ControlCard(
                      roof1: controlData["Roof1"],
                      roof2: controlData["Roof1"],
                      waterpump1: controlData["Waterpump1"],
                      waterpump2: controlData["Waterpump2"],
                    )
                  ],
                ),
              ));
  }
}
