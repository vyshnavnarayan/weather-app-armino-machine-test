import 'package:demo_application/controllers/main_controller.dart';
import 'package:demo_application/models/current_weather_model.dart';
import 'package:demo_application/models/hourly_weather_model.dart';
import 'package:demo_application/utils/appstyle.dart';
import 'package:demo_application/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../consts/strings.dart';
import '../utils/capitalize.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails({
    super.key,
  });

  var controller = Get.put(MainController());
  var date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: boxColor,
      ),
      child: FutureBuilder(
        future: controller.currentWeatherData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            CurrentWeatherData data = snapshot.data;
            print(snapshot.data);

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Today",
                      style: appstyle(22, boxElementColor, FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: boxElementColor,
                          size: 30,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      // "assets/weather/${data.weather![0].icon}.png",
                      "https://openweathermap.org/img/wn/${data.weather![0].icon}@2x.png"
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${data.main!.temp}$degree",
                      style: appstyle(60, boxElementColor, FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  "${data.weather![0].description}".toFirstCharacterCapitalize(),
                  style: appstyle(18, boxElementColor, FontWeight.w600),
                ),
                Text(
                  "${data.name}",
                  style: appstyle(12, boxElementColor, FontWeight.w600),
                ),
                Text(
                  "${date}",
                  style: appstyle(12, boxElementColor, FontWeight.w600),
                ),
                FutureBuilder(
                  future: controller.hourlyWeatherData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      HourlyWeatherData data = snapshot.data;

                      DateTime sunsetTime = DateTime.fromMillisecondsSinceEpoch(
                          data.city!.sunset! * 1000);
                      String formattedSunrise =
                          '${sunsetTime.hour}:${sunsetTime.minute}';

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Feels like 28",
                            style:
                                appstyle(12, boxElementColor, FontWeight.w600),
                          ),
                          Text(
                            " | ",
                            style:
                                appstyle(12, boxElementColor, FontWeight.w600),
                          ),
                          Text(
                            "Sunset $formattedSunrise",
                            style:
                                appstyle(12, boxElementColor, FontWeight.w600),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}