import 'package:flutter/material.dart';
import 'package:polyhouseie/api/weatherapi.dart';

bool loader = true;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    queryForecast(
        setLoader: () => setState(() {
              loader = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Weather Forecast"),
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: Column(
        children: [
          Center(
            child: loader
                ? const Center(child: CircularProgressIndicator())
                : Text("${forecasts.weatherIcon}"),
          )
        ],
      ),
    );
  }
}
