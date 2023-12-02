import 'package:demo_application/widgets/live_weather.dart';
import 'package:demo_application/widgets/random_text.dart';
import 'package:demo_application/widgets/weather_details.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/og.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:  Padding(
            padding: const EdgeInsets.only(left: 34,right: 34),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 5,
                ),
                WeatherDetails(),
                SizedBox(
                  height: 10,
                ),
                LiveWeather(),
                SizedBox(
                  height: 10,
                ),
                RandomText()
              ],
            ),
          ),
        
      ),
    );
  }
}





