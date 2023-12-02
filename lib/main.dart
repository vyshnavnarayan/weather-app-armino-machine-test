import 'package:demo_application/screen/weather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home:  Home()
      
    );
  }
}
