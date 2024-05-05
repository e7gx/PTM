import 'dart:ui';

import 'package:first_time/App/ppm.dart';
import 'package:first_time/Auth/reset_password.dart';
import 'package:first_time/Auth/signup_page.dart';
import 'package:first_time/admin/Auth/admin_login.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/controller/routes/navbar_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool obscureTextSET = true;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).ItOrUser_It,
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
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      // backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Lottie.asset(
            'assets/animation/aichat.json',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Lottie.asset(
            'assets/animation/p2p.json',
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
                    'assets/animation/p2p.json',
                    width: 500.0,
                    height: 230.0,
                  ),
                  Text(
                    S.of(context).login,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 16,
                      shadowColor: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius here
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Apply borderRadius to ClipRRect
                        child: TextFormField(
                          showCursor: true,
                          style: const TextStyle(color: Colors.blue),
                          controller: emailController,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: S.of(context).email,
                            labelStyle: const TextStyle(
                                fontFamily: 'Cario',
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blue), // Cyan color for label text
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: Colors.blue), // Cyan color for icon
                            border: InputBorder.none, // Remove border here
                            enabledBorder:
                                InputBorder.none, // Remove enabled border here
                            focusedBorder:
                                InputBorder.none, // Remove focused border here
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 16,
                      shadowColor: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius here
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Apply borderRadius to ClipRRect
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          controller: passwordController,
                          obscureText: obscureTextSET,
                          cursorColor: Colors.blue,
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
                                color: Colors.blue,
                                obscureTextSET
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                            labelText: S.of(context).password,
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cario',
                                color:
                                    Colors.blue), // Cyan color for label text
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.blue), // Cyan color for icon
                            border: InputBorder.none, // Remove border here
                            enabledBorder:
                                InputBorder.none, // Remove enabled border here
                            focusedBorder:
                                InputBorder.none, // Remove focused border here
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
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
                          foregroundColor: Colors.blue,
                        ),
                        child: Text(
                          S.of(context).Forgot_password,
                          textAlign: TextAlign
                              .start, // Align text start for RTL or LTR based on language
                          style: const TextStyle(
                            fontFamily: 'Cario',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textDirection: isArabic()
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                                  const Center(
                                    child: Text(
                                      'يرجى ملء كل من حقول البريد \nالإلكتروني وكلمة المرور',
                                      textAlign: TextAlign.center,
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
                                        color: Colors.blue),
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
                                      'assets/animation/p2p.json', //! importint Change The Animaiton pls
                                      height: 200),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      S.of(context).Loading,
                                      style: const TextStyle(
                                          fontFamily: 'Cario',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
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

                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setBool('isLoggedIn', true);

                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        String message =
                            // ignore: use_build_context_synchronously
                            '${e.code}\n ${S.of(context).validData}';
                        String lottieAsset =
                            'assets/animation/WOR.json'; // مسار ملف تحريك Lottie للخطأ

                        if (e.code == 'user-not-found') {
                          message = 'لم يتم العثور على المستخدم!';
                        } else if (e.code == 'wrong-password') {
                          message = 'كلمة المرور غير صحيحة!';
                        }

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
                                      width: 150, height: 180),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
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
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      S.of(context).login,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: 'Cario',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              S.of(context).createAccontA,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cario',
                                  fontSize: 16,
                                  color: Colors.blue),
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminLoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
