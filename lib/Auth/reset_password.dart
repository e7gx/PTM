// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _emailControllerResat = TextEditingController();

  @override
  void dispose() {
    _emailControllerResat.dispose();
    super.dispose();
  }

  Future passwordResat() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControllerResat.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/animation/like1.json',
                    height:
                        200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'تم ارسال رابط التحقق بنجاح',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario',
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'موافق',
                  style: TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/animation/WOR.json',
                    height:
                        200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    '  يجب التحقق من الايميل المدخل ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario',
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'موافق',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "اعادة تعيين كلمة السر",
          style: TextStyle(
              fontFamily: 'Cario',
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(500),
        //     bottomLeft: Radius.circular(40),
        //   ),
        // ),
        // elevation: 2.00,
        // backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.tealAccent,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Positioned.fill(
          child: Lottie.asset(
            'assets/animation/afterAfect.json',
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: Lottie.asset(
            'assets/animation/green.json',
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: const SizedBox(),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Lottie.asset('assets/animation/green.json', height: 200),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'تغيير كلمة السر يكون من هنا سيتم ارسال رسالة لك على البريد الالكتروني',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Cario',
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.blue),
                  controller: _emailControllerResat,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    labelText: 'البريد الإلكتروني',
                    labelStyle: TextStyle(
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal), // Cyan color for label text
                    prefixIcon: Icon(Icons.email_outlined,
                        color: Colors.teal), // Cyan color for icon

                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal), // Consistent border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  passwordResat();
                  _emailControllerResat.clear();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 65.0),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'التحقق',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
