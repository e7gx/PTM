import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:first_time/Auth/login_page.dart';
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
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     "👋 أهلا وسهلا بك",
      //     style: TextStyle(
      //         color: Colors.teal,
      //         fontFamily: 'Cario',
      //         fontWeight: FontWeight.bold,
      //         fontSize: 23),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          // Lottie.asset(
          //   'assets/animation/backgroundColors.json',
          //   fit: BoxFit.fill,
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          Lottie.asset(
            'assets/animation/ppmana.json',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          // const Card(
          //   shadowColor: Colors.cyan,
          //   elevation: 8,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(16.0),
          //     ),
          //   ),
          //   color: Colors.transparent,
          //   margin: EdgeInsets.only(top: 180, bottom: 150, left: 10, right: 10),
          // ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/green.json',
                    fit: BoxFit.contain, height: 180),
                const Text(
                  'أهلا وسهلا بك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: ((context) => LoginPage())),
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
                  child: const Text(
                    'موظف الدعم الفني',
                    style: TextStyle(
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
                  child: const Text(
                    'مستفيد من الخدمة',
                    style: TextStyle(
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
  // body: Container(
  //       height: double.infinity,
  //       width: double.infinity,
  //       decoration: const BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.cover,
  //           image: AssetImage('assets/images/PTM_IT.png'),
  //         ),
  //       ),
  //       child: Card(
  //         shadowColor: Colors.cyan,
  //         elevation: 8,
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(16.0),
  //           ),
  //         ),
  //         color: Colors.transparent,
  //         margin:
  //             const EdgeInsets.only(top: 180, bottom: 150, left: 10, right: 10),
  //         child: Container(
  //           decoration: const BoxDecoration(
  //             gradient: LinearGradient(
  //               colors: [
  //                 Colors.blue,
  //                 Colors.transparent,
  //                 Colors.teal,
  //               ],
  //               begin: Alignment.topRight,
  //               end: Alignment.bottomLeft,
  //             ),
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(16),
  //             ),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               // Lottie.asset('assets/animation/aichat.json',
  //               //     fit: BoxFit.fitWidth, height: 150),
  //               const SizedBox(height: 20),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.pushReplacement(
  //                     context,
  //                     MaterialPageRoute(builder: ((context) => LoginPage())),
  //                   );
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: const Color(0xFF0F92EF),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 50, vertical: 11),
  //                 ),
  //                 child: const Text(
  //                   'موظف الدعم الفني',
  //                   style: TextStyle(
  //                       color: Colors.white,
  //                       fontFamily: 'Cario',
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16),
  //                 ),
  //               ),
  //               const SizedBox(height: 40),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.pushReplacement(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: ((context) => const LoginPageUser()),
  //                     ),
  //                   );
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.teal,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(9.0),
  //                   ),
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 50, vertical: 11),
  //                 ),
  //                 child: const Text(
  //                   'مستفيد من الخدمة',
  //                   style: TextStyle(
  //                       color: Colors.white,
  //                       fontFamily: 'Cario',
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),