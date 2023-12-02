import 'package:demo_application/models/current_weather_model.dart';
import 'package:demo_application/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_application/controllers/main_controller.dart';
import 'package:demo_application/models/hourly_weather_model.dart';
import 'package:demo_application/utils/const.dart';

class LiveWeather extends StatelessWidget {
  LiveWeather({Key? key}) : super(key: key);

  var controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: boxColor.withOpacity(0.7),
            offset: Offset(0, 3.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 1.0,
                    offset: Offset(0, 3.0),
                  ),
                ],
              ),
              child: FutureBuilder(
                future: _fetchHourlyWeatherData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    if (snapshot.hasData) {
                      HourlyWeatherData data = snapshot.data;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          var hourlyData = data.list![index + 5];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${hourlyData.dtTxt?.hour} :00",
                                  style: appstyle(
                                      12, Colors.white, FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8.3,
                                ),
                                Row(
                                  children: [
                                    Image.network(
                                      "https://openweathermap.org/img/wn/${hourlyData.weather![0].icon}.png",
                                      scale: 1.5,
                                    ),
                                    Text(
                                      "${hourlyData.main?.temp}°",
                                      style: appstyle(
                                          12, Colors.white, FontWeight.normal),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } catch (e) {
                    print('Error fetching hourly weather data: $e');
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                  }
                },
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: boxElementColor,
            ),
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 1.0,
                    offset: Offset(0, 3.0),
                  ),
                ],
              ),
              child: FutureBuilder(
                future: _fetchHourlyWeatherData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    if (snapshot.hasData) {
                      HourlyWeatherData data = snapshot.data;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            data.list!.length > 5 ? 5 : data.list!.length,
                        itemBuilder: (context, index) {
                          var hourlyData = data.list![index + 2];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${hourlyData.dtTxt?.hour} :00",
                                  style: appstyle(
                                      12, Colors.white, FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.network(
                                      "https://openweathermap.org/img/wn/${hourlyData.weather![0].icon}.png",
                                      scale: 1.5,
                                    ),
                                    Text(
                                      "${hourlyData.main?.temp}°",
                                      style: appstyle(
                                          12, Colors.white, FontWeight.normal),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } catch (e) {
                    print('Error fetching hourly weather data: $e');
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<HourlyWeatherData> _fetchHourlyWeatherData() async {
    try {
      return await controller.hourlyWeatherData;
    } catch (e) {
      print('Hourly Weather Data Error: $e');
      throw e;
    }
  }
}
