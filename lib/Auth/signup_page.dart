import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/Auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final User? userId = FirebaseAuth.instance.currentUser;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedpasswordController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedpasswordController.dispose();
    super.dispose();
  }

  void _registerUser() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmedPassword = _confirmedpasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmedPassword.isEmpty) {
      _showDialog('يرجى ملء جميع الحقول', 'assets/animation/WOR.json');
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      _showDialog('يرجى إدخال بريد إلكتروني صالح', 'assets/animation/WOR.json');
    } else if (password != confirmedPassword) {
      _showDialog('يجب أن تتطابق كلمة المرور المؤكدة مع كلمة المرور',
          'assets/animation/WOR.json');
    } else {
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
                      'assets/animation/userLog2.json', //! importint Change The Animaiton pls
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
                          color: Colors.teal),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await addUserDetails(
          _nameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
          FirebaseAuth.instance.currentUser!.uid,
        );
        if (mounted) {
          // Check if the widget is still in the tree
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'حدث خطأ أثناء التسجيل. يرجى المحاولة مرة أخرى';
        Center(
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cario',
            ),
          ),
        );
        if (e.code == 'weak-password') {
          errorMessage = 'كلمة المرور التي أدخلتها ضعيفة جدًا';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'البريد الإلكتروني الذي أدخلته مستخدم';
        }
        if (mounted) {
          // Also check here before showing the dialog
          _showDialog(errorMessage, 'assets/animation/WOR.json');
        }
      }
    }
  }

  Future<void> addUserDetails(
      String firstName, String lastName, String email, String userId) async {
    await FirebaseFirestore.instance.collection('Users_IT').add({
      //! impotint to change UID MUST BE THESAMEIN THE TABLE AND AUTH ~!!!!

      'first name': firstName,
      'last name': lastName,
      'email': email,
      'uid': userId,
    });
  }

  void _showDialog(String message, String lottieAsset) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Lottie.asset(
                  lottieAsset, // Make sure this path is correct
                  width: 180.0, // Lottie image width
                  height: 180.0, // Lottie image height
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cario',
                        )),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(
                'حسنا',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          "تسجيل حساب جديد",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cario',
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(500),
            bottomLeft: Radius.circular(40),
          ),
        ),
        elevation: 2.00,
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animation/userLog.json', // Make sure this path is correct
                width: 400.0,
                height: 300.0,
              ),
              TextField(
                style: const TextStyle(color: Colors.teal),
                cursorColor: Colors.cyan,
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'الاسم الاول',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.person_add_alt,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.teal),
                cursorColor: Colors.cyan,
                controller: _lastNameController,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'الاسم الاخير',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.person_add_alt,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.teal),
                cursorColor: const Color(0xFF0F92EF),
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'البريد الإلكتروني',
                  labelStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for focused border
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.teal),
                cursorColor: Colors.cyan,
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.teal),
                cursorColor: Colors.teal,
                controller: _confirmedpasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'تاكيد كلمة المرور',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF0F92EF),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: _registerUser,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 90.0),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  ' تسجيل جديد ',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
