import 'dart:ui';

import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:first_time/Auth/login_page_it.dart';
import 'package:first_time/User/Auth/login_page.dart';
import 'package:lottie/lottie.dart';

class ItOrUser extends StatefulWidget {
  const ItOrUser({super.key});

  @override
  State<ItOrUser> createState() => _ItOrUserState();
}

class _ItOrUserState extends State<ItOrUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Lottie.asset(
            'assets/animation/afterAfect.json',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Lottie.asset(
            'assets/animation/green.json',
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/green.json',
                    fit: BoxFit.contain, height: 180),
                Text(
                  S.of(context).welcome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold,
                      fontSize: 45),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginPage())),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F92EF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 11),
                  ),
                  child: Text(
                    S.of(context).ItOrUser_It,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const LoginPageUser()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 11),
                  ),
                  child: Text(
                    S.of(context).ItOrUser_User,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
