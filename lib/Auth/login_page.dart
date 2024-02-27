import 'package:first_time/Auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/controller/routes/home_page.dart';
import 'signup_page.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "تسجيل الدخول",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cario',
            ),
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
        backgroundColor: const Color(0xFF0F92EF),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                'assets/animation/ppmana.json', // تأكد من مسار الـ asset الصحيح للتحريك
                width: 500.0,
                height: 230.0,
              ),
              const SizedBox(height: 40.0),
              TextField(
                style: const TextStyle(color: Colors.blue),
                controller: emailController,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,
                  // fillColor: Color.fromARGB(255, 248, 248, 248),
                  labelText: 'البريد الإلكتروني',
                  labelStyle: TextStyle(
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F92EF)), // Cyan color for label text
                  prefixIcon: Icon(Icons.email_outlined,
                      color: Color(0xFF0F92EF)), // Cyan color for icon

                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.cyan), // Consistent border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0F92EF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0F92EF)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25.0),
              TextField(
                style: const TextStyle(color: Colors.blue),
                controller: passwordController,
                obscureText: true,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario',
                      color: Color(0xFF0F92EF)), // Cyan color for label text
                  prefixIcon: Icon(Icons.lock_outline,
                      color: Color(0xFF0F92EF)), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF0F92EF)), // Consistent border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0F92EF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0F92EF)),
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
                      foregroundColor: const Color(0xFF0F92EF),
                    ),
                    child: const Text(
                      'نسيت كلمة السر؟',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 15,
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
                          title: const Text(
                            'خطأ في الإدخال',
                            style: TextStyle(
                                fontFamily: 'Cario',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
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
                                  'يرجى ملء كل من حقول البريد \n       الإلكتروني وكلمة المرور',
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
                                  height:
                                      200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                              const SizedBox(height: 10),

                              const Center(
                                child: Text(
                                  '.... يرجى الانتظار قليلا',
                                  style: TextStyle(
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
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    String message =
                        '       كلمة المرور او البريد الإلكتروني       \n          غير صحيح حاول مرة اخرى ';
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
                          title: const Text(
                            'خطأ',
                            style: TextStyle(
                                fontFamily: 'Cario',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Lottie.asset(lottieAsset,
                                  width: 150, height: 200), // تحريك Lottie
                              const SizedBox(height: 10),
                              Text(
                                message,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Cario',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                  msg: "تاكد من البيانات وحاول مرة اخرى",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
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
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 65.0),
                  backgroundColor: const Color(0xFF0F92EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
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
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'سجل الآن',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cario',
                          fontSize: 16,
                          color: Color(0xFF0F92EF)),
                    ),
                  ),
                  const Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
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
    );
  }
}
