import 'package:flutter/foundation.dart';
import 'package:weather/weather.dart';

late Weather forecasts;
late WeatherFactory wf;
String key = "1295c7052ff8d64deacfc01555a23ca8";
double? lat = 19.2094, lon = 73.0939;

void queryForecast(
    {required Function setLoader,
    required double lat,
    required double lon}) async {
  wf = WeatherFactory(key);
  try {
    forecasts = await wf.currentWeatherByLocation(lat, lon);
    setLoader();
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
