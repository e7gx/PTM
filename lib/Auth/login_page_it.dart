import 'package:first_time/Auth/reset_password.dart';
import 'package:first_time/Auth/signup_page.dart';
import 'package:first_time/admin/Auth/admin_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/controller/routes/navbar_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  Widget build(BuildContext context) {
    // final User? user = FirebaseAuth.instance.currentUser;

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
        backgroundColor: Colors.teal,
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
                'assets/animation/green.json',
                width: 500.0,
                height: 230.0,
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.teal),
                  controller: emailController,
                  cursorColor: Colors.teal,
                  decoration: const InputDecoration(
                    filled: true,
                    // fillColor: Color.fromARGB(255, 248, 248, 248),
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
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.teal),
                  controller: passwordController,
                  obscureText: obscureTextSET,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
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
                    labelText: 'كلمة المرور',
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
                                  'assets/animation/green.json', //! importint Change The Animaiton pls
                                  height: 200),
                              const SizedBox(height: 10),
                              const Center(
                                child: Text(
                                  '.... يرجى الانتظار قليلا',
                                  style: TextStyle(
                                      fontFamily: 'Cario',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
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
                        'كلمة المرور او البريد الإلكتروني\nغير صحيح حاول مرة اخرى ';
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
                                  width: 150, height: 180), // تحريك Lottie
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
                                    fontSize: 14,
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
              Column(
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
                      'حساب جديد',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cario',
                          fontSize: 18,
                          color: Colors.teal),
                    ),
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
                          color: Colors.tealAccent),
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
