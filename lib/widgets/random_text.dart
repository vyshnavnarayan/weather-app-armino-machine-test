import 'package:demo_application/utils/appstyle.dart';
import 'package:flutter/material.dart';

class RandomText extends StatelessWidget {
  const RandomText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.25,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cloudy day",
            style: appstyle(18, Colors.white, FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            "“Clouds are the silent storytellers of the sky, revealing secrets through their ever-changing forms.”",
            style: appstyle(15, Colors.white, FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
