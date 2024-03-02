import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/User/Auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../Controller/home_page_and_bar.dart';

class SignUpPageUser extends StatefulWidget {
  const SignUpPageUser({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPageUser> {
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await addUserDetails(_nameController.text.trim(),
            _lastNameController.text.trim(), _emailController.text.trim());

        if (mounted) {
          // Check if the widget is still in the tree
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPageUser()),
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
      String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('Users_Normal').add({
      //! impotint to change UID MUST BE THESAMEIN THE TABLE AND AUTH ~!!!!
      'first name': firstName,
      'last name': lastName,
      'email': email,
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
                color: Colors.blue),
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
              },
              child: const Text(
                'حسنا',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: const Color.fromARGB(255, 15, 146, 239),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                'assets/animation/reportsman.json', // Make sure this path is correct
                width: 400.0,
                height: 250.0,
              ),
              TextField(
                style: const TextStyle(color: Colors.blue),
                cursorColor: Colors.cyan,
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'الاسم الاول',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.person_add_alt,
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.blue),
                cursorColor: Colors.cyan,
                controller: _lastNameController,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'الاسم الاخير',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.person_add_alt,
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.blue),
                cursorColor: const Color.fromARGB(255, 15, 146, 239),
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'البريد الإلكتروني',
                  labelStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for focused border
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.blue),
                cursorColor: Colors.cyan,
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for focused border
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: const TextStyle(color: Colors.blue),
                cursorColor: Colors.cyan,
                controller: _confirmedpasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,

                  labelText: 'تاكيد كلمة المرور',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for label text
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 15, 146, 239),
                  ), // Cyan color for icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
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
                  backgroundColor: const Color.fromARGB(255, 15, 146, 239),
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
