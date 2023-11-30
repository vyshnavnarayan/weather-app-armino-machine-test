import 'package:demo_application/screen/live_weather.dart';
import 'package:demo_application/screen/random_text.dart';
import 'package:demo_application/screen/weather_details.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/og.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:  Padding(
              padding: const EdgeInsets.only(left: 34,),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  WeatherDetails(),
                  SizedBox(
                    height: 30,
                  ),
                  LiveWeather(),
                  SizedBox(
                    height: 30,
                  ),
                  RandomText()
                ],
              ),
            ),
          
        ),
      ),
    );
  }
}





