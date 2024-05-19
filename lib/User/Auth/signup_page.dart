// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/User/Auth/login_page.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPageUser extends StatefulWidget {
  const SignUpPageUser({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPageUser> {
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
      _showDialog(
          S.of(context).signup_pageFillFields, 'assets/animation/WOR.json');
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      _showDialog(
          S.of(context).signup_pageValidEmail, 'assets/animation/WOR.json');
    } else if (password != confirmedPassword) {
      _showDialog(
          S.of(context).signup_pageConfirmedMatch, 'assets/animation/WOR.json');
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

                  Center(
                    child: Text(
                      S.of(context).Loading,
                      style: const TextStyle(
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
            MaterialPageRoute(builder: (context) => const LoginPageUser()),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = S.of(context).signup_pageErorrTryAgain;
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
          errorMessage = S.of(context).signup_pageWeakPassword;
        } else if (e.code == 'email-already-in-use') {
          errorMessage = S.of(context).signup_pageEmailAlreadyUsed;
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
    await FirebaseFirestore.instance.collection('Users_Normal').add({
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
          title: Text(
            S.of(context).signup_pageErorr,
            style: const TextStyle(
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
              child: Text(
                S.of(context).signup_pageOk,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          S.of(context).signup_pageSignUpNewAccount,
          style: const TextStyle(
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
                decoration: InputDecoration(
                  filled: true,

                  labelText: S.of(context).signup_pageFirstNAme,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: const Icon(
                    Icons.person_add_alt,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                    ), // Cyan color for border
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: const OutlineInputBorder(
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
                decoration: InputDecoration(
                  filled: true,

                  labelText: S.of(context).signup_pageLastName,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: const Icon(
                    Icons.person_add_alt,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: const OutlineInputBorder(
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
                decoration: InputDecoration(
                  filled: true,

                  labelText: S.of(context).signup_pageEmail,
                  labelStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for border
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: const OutlineInputBorder(
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
                decoration: InputDecoration(
                  filled: true,

                  labelText: S.of(context).signup_pagePassword,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 15, 146, 239),
                    ), // Cyan color for border
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: const OutlineInputBorder(
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
                decoration: InputDecoration(
                  filled: true,

                  labelText: S.of(context).signup_pageConfirmPassword,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    color: Colors.teal,
                  ), // Cyan color for label text
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.tealAccent,
                  ), // Cyan color for icon
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF0F92EF),
                    ), // Cyan color for border
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ), // Cyan color for enabled border
                  ),
                  focusedBorder: const OutlineInputBorder(
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
                child: Text(
                  S.of(context).signup_pageNewRegistration,
                  style: const TextStyle(
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
