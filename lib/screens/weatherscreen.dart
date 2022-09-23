import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/api/weatherapi.dart';
import 'package:intl/intl.dart';

bool loader = true;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String formatter = DateFormat('dd-MMM').format(DateTime.now());
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Weather Forecast"),
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: Center(
        child: loader
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Image.asset(
                    'assets/icon/sunny.png',
                    height: width / 2,
                    width: width,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primary2Color,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset("assets/icon/date.svg"),
                        const Spacer(),
                        Text(
                          formatter,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text("Temperature",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: primary2Color,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset("assets/icon/temperature.svg"),
                        const Spacer(),
                        Text(
                          "${forecasts.temperature}",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Place",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primary2Color,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset('assets/icon/place.svg'),
                        const Spacer(),
                        Text(
                          "${forecasts.areaName}",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(children: [
                      Text(
                        "Weather",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: primary2Color,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset("assets/icon/weather.svg"),
                      const Spacer(),
                      Text(
                        "${forecasts.weatherMain}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Humidity",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primary2Color,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset("assets/icon/humidity.svg"),
                        const Spacer(),
                        Text(
                          "${forecasts.humidity}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "WindSpeed",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: primary2Color,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset("assets/icon/wind.svg"),
                        const Spacer(),
                        Text("${forecasts.windSpeed} m/s",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
