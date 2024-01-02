import 'package:flutter/material.dart';
import 'package:first_time/page/introduction_screen.dart';

class PPM extends StatelessWidget {
  const PPM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        canvasColor: Colors.white,
        useMaterial3: false,
        primarySwatch: Colors.cyan,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: const OnBoardingPage(),
    );
  }
}
