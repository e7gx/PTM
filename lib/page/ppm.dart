import 'package:first_time/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:first_time/screen/introduction_screen.dart';
import 'package:get/get.dart';

class PPM extends StatelessWidget {
  const PPM({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const OnBoardingPage(),
    );
  }
}
