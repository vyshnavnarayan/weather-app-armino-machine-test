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
    return Container(
      height: 200,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: boxColor.withOpacity(0.7),
                  offset: Offset(0, 3.0),
                ),
              ],
            ),
      child: Column(
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
              future: controller.hourlyWeatherData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  HourlyWeatherData data = snapshot.data;
    
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      print(data.list!.length);
                      var hourlyData = data.list![index+5];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text("${hourlyData.dtTxt?.hour} :00",style: appstyle(12, Colors.white, FontWeight.normal),),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/clouds.png",
                                  scale: 5,
                                ),
                                Text("${hourlyData.main?.temp}°",style: appstyle(12, Colors.white, FontWeight.normal),),
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
              future: controller.hourlyWeatherData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  HourlyWeatherData data = snapshot.data;
    
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.list!.length > 5 ? 5 : data.list!.length,
                    itemBuilder: (context, index) {
                      var hourlyData = data.list![index + 2];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text("${hourlyData.dtTxt?.hour} :00",style: appstyle(12, Colors.white, FontWeight.normal),),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/clouds.png",
                                  scale: 5,
                                ),
                                Text("${hourlyData.main?.temp}°",style: appstyle(12, Colors.white, FontWeight.normal),),
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
              },
            ),
            
          ),          
        ],
      ),
    );
  }
}



