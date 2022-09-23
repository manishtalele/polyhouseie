import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:polyhouseie/Theme/deftheme.dart';
import 'package:polyhouseie/api/location.dart';
import 'package:polyhouseie/api/weatherapi.dart';
import 'package:polyhouseie/screens/weatherscreen.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late Position position;
  double lat = 19.2094, lon = 73.0939;
  bool loader = true;
  Future getLocation() async {
    position = await getGeoLocationPosition();
    setState(() {
      lat = position.latitude;
      lon = position.longitude;
    });
  }

  @override
  void initState() {
    getLocation();
    queryForecast(
        setLoader: () => setState(() {
              loader = false;
            }),
        lat: lat,
        lon: lon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "Weather forecast",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: primary2Color),
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WeatherScreen(lat: lat, lon: lon))),
            child: SvgPicture.asset("assets/icon/Back.svg"),
          )
        ]),
        const SizedBox(height: 20),
        loader
            ? const CircularProgressIndicator()
            : Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon/sunny.png',
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                            color: primary2Color,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        "${forecasts.temperature}",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
