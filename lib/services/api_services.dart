import 'package:demo_application/models/current_weather_model.dart';
import 'package:demo_application/models/hourly_weather_model.dart';
import 'package:http/http.dart' as http;

import '../consts/strings.dart';


// class WeatherService {
//   static const String apiKey = '41ed71f70394fc5466a9752316d6ee67';

//   Future<HourlyWeatherData> getHourlyWeather(double lat, double long) async {
//     var link =
//         "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
//     var res = await http.get(Uri.parse(link));
//     if (res.statusCode == 200) {
//       var data = hourlyWeatherDataFromJson(res.body.toString());
//       return data;
//     } else {
//       throw Exception('Failed to load hourly weather data');
//     }
//   }
// }

Future<CurrentWeatherData> getCurrentWeather(double lat, double long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());
    return data;
  } else {
    throw Exception('Failed to load current weather data');
  }
}

Future<HourlyWeatherData> getHourlyWeather(double lat, double long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = hourlyWeatherDataFromJson(res.body.toString());
    return data;
  } else {
    throw Exception('Failed to load hourly weather data');
  }
}
