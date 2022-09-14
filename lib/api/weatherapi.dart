import 'package:weather/weather.dart';

late Weather forecasts;
late WeatherFactory wf;
String key = "1295c7052ff8d64deacfc01555a23ca8";
double? lat = 19.218330, lon = 72.978088;

void queryForecast({required Function setLoader}) async {
  wf = WeatherFactory(key);
  forecasts = await wf.currentWeatherByLocation(lat!, lon!);
  setLoader();
}
