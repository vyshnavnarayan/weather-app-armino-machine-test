import 'package:demo_application/utils/appstyle.dart';
import 'package:demo_application/utils/const.dart';
import 'package:flutter/material.dart';


class RandomText extends StatelessWidget {
  const RandomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: boxColor.withOpacity(0.4),
            blurRadius: 1.0,
            offset: Offset(0, 3.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cloudy day",
            style: appstyle(18, Colors.white, FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "“Clouds are the silent storytellers of the sky, revealing secrets through their ever-changing forms.”",
            style: appstyle(15, Colors.white, FontWeight.w500),
          )
        ],
      ),
    );
  }
}