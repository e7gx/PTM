import 'package:flutter/material.dart';
import 'introduction_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // انتظر لمدة 30 ثوانٍ ثم انتقل إلى صفحة تسجيل الدخول
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // تضمين الصورة كخلفية
          Lottie.asset(
            'animation/ppmana.json',
            width: 600,
            height: 600,
            fit: BoxFit.fitWidth,
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'PPM لجعل منشأتك أفضل',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.0),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
