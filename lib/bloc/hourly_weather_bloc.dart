// import 'package:bloc/bloc.dart';
// import 'package:demo_application/services/api_services.dart';
// import 'package:meta/meta.dart';
// import 'package:demo_application/models/hourly_weather_model.dart';


// part 'hourly_weather_event.dart';
// part 'hourly_weather_state.dart';

// class HourlyWeatherBloc extends Bloc<HourlyWeatherEvent, HourlyWeatherState> {
//   final WeatherService weatherService = WeatherService();

//   HourlyWeatherBloc() : super(HourlyWeatherInitial());

//   Stream<HourlyWeatherState> mapEventToState(HourlyWeatherEvent event) async* {
//     if (event is GetHourlyWeather) {
//       try {
//         final hourlyWeatherData = await weatherService.getHourlyWeather(event.lat, event.long);
//         yield HourlyWeatherLoaded(hourlyWeatherData: hourlyWeatherData);
//       } catch (e) {
//         yield HourlyWeatherError(message: 'Failed to load hourly weather data');
//       }
//     }
//   }
// }
