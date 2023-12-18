import 'package:flutter/material.dart';
import 'package:first_time/page/splash_screen.dart';

class PPM extends StatelessWidget {
  const PPM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
