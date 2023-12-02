import 'package:demo_application/services/api_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  void onInit() async {
    try {
      await getUserLocation();
      currentWeatherData = await getCurrentWeather(latitude.value, longitude.value);
      hourlyWeatherData = await getHourlyWeather(latitude.value, longitude.value);
    } catch (e) {
      print('Error: $e');
    }

    super.onInit();
  }

  dynamic currentWeatherData;
  dynamic hourlyWeatherData;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  var isloaded = false.obs;

  getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    try {
      isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        throw Exception("Location is not enabled");
      }

      userPermission = await Geolocator.checkPermission();
      if (userPermission == LocationPermission.deniedForever) {
        throw Exception("Permission is denied forever");
      } else if (userPermission == LocationPermission.denied) {
        userPermission = await Geolocator.requestPermission();
        if (userPermission == LocationPermission.denied) {
          throw Exception("Permission is denied");
        }
      }

      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((value) {
        latitude.value = value.latitude;
        longitude.value = value.longitude;
        isloaded.value = true;
      });
    } catch (e) {
      print('Location Error: $e');
      throw e; 
    }
  }
}
