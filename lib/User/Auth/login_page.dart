import 'dart:ui';

import 'package:first_time/Auth/reset_password.dart';
import 'package:first_time/User/controller/home_page_and_bar.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_page.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPageUser extends StatefulWidget {
  const LoginPageUser({super.key});

  @override
  State<LoginPageUser> createState() => _LoginPageUserState();
}

class _LoginPageUserState extends State<LoginPageUser> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool obscureTextSET = true;

  @override
  Widget build(BuildContext context) {
    // final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).ItOrUser_User,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cario',
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(7000),
          ),
        ),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Stack(alignment: Alignment.center, children: [
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
        SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  'assets/animation/green.json',
                  width: 500.0,
                  height: 230.0,
                ),
                Text(
                  S.of(context).LoginAppBar,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontFamily: 'Cario',
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 16,
                    shadowColor: Colors.teal,
                    child: TextFormField(
                      showCursor: true,
                      style: const TextStyle(color: Colors.teal),
                      controller: emailController,
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: S.of(context).email,
                        labelStyle: const TextStyle(
                            fontFamily: 'Cario',
                            fontWeight: FontWeight.bold,
                            color: Colors.teal), // Cyan color for label text
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.teal), // Cyan color for icon
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal), // Consistent border color
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 16,
                    shadowColor: Colors.teal,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.teal),
                      controller: passwordController,
                      obscureText: obscureTextSET,
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                        fillColor: Colors.white,

                        filled: true,
                        suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureTextSET = !obscureTextSET;
                            });
                          },
                          child: Icon(
                            size: 20,
                            obscureTextSET
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        labelText: S.of(context).password,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cario',
                            color: Colors.teal), // Cyan color for label text
                        prefixIcon: const Icon(Icons.lock_outline,
                            color: Colors.teal), // Cyan color for icon
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal), // Consistent border color
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal,
                      ),
                      child: Text(
                        S.of(context).Forgot_password,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    final String email = emailController.text.trim();
                    final String password = passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      // عرض رسالة الخطأ مع صورة
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
                                Text(
                                  S.of(context).LoginAlertEmailPassword,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cario',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  S.of(context).Okay,
                                  style: const TextStyle(
                                      fontFamily: 'Cario',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      return; // لإيقاف تنفيذ الكود في حال كان أحد الحقول فارغ
                    }
                    try {
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
                                Lottie.asset(
                                  'assets/animation/reportGreen.json', //! importint Change The Animaiton pls
                                  height: 200,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  S.of(context).Loading,
                                  style: const TextStyle(
                                      fontFamily: 'Cario',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      );
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      String message = '${e.code}\n ${S.of(context).validData}';
                      String lottieAsset =
                          'assets/animation/WOR.json'; // مسار ملف تحريك Lottie للخطأ

                      showDialog(
                        // ignore: use_build_context_synchronously
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
                                Lottie.asset(lottieAsset,
                                    width: 150, height: 200), // تحريك Lottie
                                const SizedBox(height: 10),

                                Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cario',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: S.of(context).validData,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  S.of(context).Okay,
                                  style: const TextStyle(
                                      fontFamily: 'Cario',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 65.0),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    S.of(context).LoginAppBar,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPageUser(),
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).createAccontA,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cario',
                            fontSize: 14,
                            color: Colors.teal),
                      ),
                    ),
                    Text(
                      S.of(context).createAccontQ,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Cario',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
